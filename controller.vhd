library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
entity controller is
    generic (
        n              : integer := 256;
        ram_size       : integer := 64;
        address_size   : integer := 8;
        label_size     : integer := 8
    );
    port (
        clk            : in    std_logic; 
        clk_inv        : in    std_logic; 
        rst            : in    std_logic;
        initiate       : inout std_logic;
        ready_signal   : inout   std_logic;   
        bus_left       : inout std_logic_vector(n-1 downto 0);
        bus_right      : inout std_logic_vector(n-1 downto 0)
    );
end entity controller;

architecture a_controller of controller is

    constant null_vec : std_logic_vector(n-1 downto 0) := (others => '0');
    type state_type is ( idle , fetch_num_neuron ,  prepare_labels , fetch_neuron_weights , ready ); -- our fsm.    

    -- idle : state that make the fsm waiting to begin.
    -- prepare_labels : state to prepare bias registers with initial values ( latched from memory in specific location ).
    -- fetch_neuron : state to fetch neuron from the memory.
    -- fetch_weights : state to fetch all weight (note: the weights will be on mdr all the time).
    -- ready : state whose job is to rise a signal to booth's algorithm to start multipication.

    signal enable_decoder_src     : std_logic := '0'; -- enable the source decoder.
    signal enable_decoder_dst     : std_logic := '0'; -- enable the destination decoder.
    signal enable_mar_in          : std_logic := '0'; -- enable mar.
    signal enable_mdr_in          : std_logic := '0'; -- enable mdr to put data in it.
    signal enable_write           : std_logic := '0'; -- write signal to memory to enable to write the final result into ram.
    signal enable_mdr_out         : std_logic := '0'; -- enable mdr to latch its data into bus.

    signal sel_src : std_logic_vector(3 downto 0) := "0000"; -- selector for the souce decoder.
    signal sel_dst : std_logic_vector(3 downto 0) := "0000"; -- selector for the destination decoder.

    signal num      : std_logic_vector( label_size - 1 downto 0 ) := (others => '0'); -- number of neurons.
    signal next_num : std_logic_vector( label_size - 1 downto 0 ) := (others => '0'); -- temp number of neurons to be decremented.
    
    signal state : state_type := idle;      -- main signal of fsm ( this is the main state ).
    signal next_state : state_type := idle; -- signal to avoid infinite loop.
    
    signal address : std_logic_vector(address_size - 1 downto 0) := (others => '0'); -- address of (num of neurons).
    signal next_address : std_logic_vector(address_size - 1 downto 0) := (others => '0'); -- temp address to be incremented after each state of fetch neuron
    
    signal alu_inp1  : std_logic_vector(label_size - 1 downto 0) := (others => '0'); -- a
    signal alu_inp2	 : std_logic_vector(label_size - 1 downto 0) := (others => '0'); -- b
    signal alu_out   : std_logic_vector(label_size - 1 downto 0) := (others => '0'); -- add or sub
    signal alu_sel   : std_logic := '0';
    signal alu_cin   : std_logic := '0';
    signal alu_cout  : std_logic := '0';
    signal cnt       : std_logic := '0';
    
    -- begin masterpieces :v

begin
    process(clk , state)
    begin     
        enable_mar_in <= '0'; 
        enable_write <= '0'; 
        enable_decoder_src <= '0';
        enable_decoder_dst <= '0';
        enable_mdr_in <= '0';
        enable_mdr_out <= '0'; 
        sel_src <= "0000";
        sel_dst <= "0000"; 
                
        if (rising_edge(clk) and initiate = '1') then
            ready_signal <= '0';
            initiate <= '0';
            next_state <= fetch_num_neuron;

        elsif (rising_edge(clk)) then

            case( state ) is
                ------------------------------------------------------------------------------------
                when fetch_num_neuron =>
                    -- fetch number of neurons.
                    if( cnt = '0' ) then
                        cnt <= '1';
                        bus_left(address_size-1 downto 0) <= address;
                        enable_mar_in <= '1';
                        next_state <= fetch_num_neuron;
                        
                        -- alu to increment the address to get next fetch
                        alu_inp1 <= null_vec(label_size -1 downto address_size)&address;
                        alu_inp2 <= (others=>'0');
                        alu_inp2(0) <= '1';
                        alu_cin <= '0';
                        alu_sel <= '0';
                        next_address <= alu_out;
                        
                    elsif cnt = '1' then
                        cnt <= '0';
                        enable_mdr_in <= '1';   
                        enable_mdr_out <= '1';
                        num <= bus_right(label_size - 1 downto 0 );
                        next_state <= prepare_labels;
                    end if;
                ------------------------------------------------------------------------------------
                when prepare_labels =>
                    -- prepare label registers.
                    if( cnt = '0' ) then
                        cnt <= '1';
                        bus_left(address_size-1 downto 0) <= address;
                        enable_mar_in <= '1';
                        next_state <= prepare_labels;
                            
                        -- alu to increment the address to get next fetch
                        alu_inp1 <= null_vec(label_size -1 downto address_size)&address;
                        alu_inp2 <= (others=>'0');
                        alu_inp2(0) <= '1';
                        alu_cin <= '0';
                        alu_sel <= '0';
                        next_address <= alu_out;

                    elsif cnt = '1' then
                        cnt <= '0';
                        enable_mdr_in <= '1'; 
                        enable_mdr_out <= '1';
                        enable_decoder_dst <= '1';
                        sel_dst <= "1111";
                        next_state <= fetch_neuron_weights;
                    end if;
                ------------------------------------------------------------------------------------
                when fetch_neuron_weights =>
                    if(num = null_vec) then
                        next_state <= idle;
                    elsif(ready_signal = '0') then
                        -- prepare neuron register.
                        bus_left(address_size-1 downto 0) <= address;
                        enable_mar_in <= '1';

                        -- alu to increment the address to get next fetch
                        alu_inp1 <= null_vec(label_size -1 downto address_size)&address;
                        alu_inp2 <= (others=>'0');
                        alu_inp2(0) <= '1';
                        alu_cin <= '0';
                        alu_sel <= '0';
                        next_address <= alu_out;
                        next_state <= ready;
                    end if;
                ------------------------------------------------------------------------------------
                when ready =>
                    -- rise a signal to booth's algorithm to start multipication.
                    ready_signal <= '1';
                    
                    -- alu to decrement number of neurons
                    alu_inp1 <= null_vec(label_size -1 downto address_size)&address;
                    alu_inp2 <= (others=>'0');
                    alu_inp2(0) <= '1';
                    alu_cin <= '0';
                    alu_sel <= '1';
                    next_num <= alu_out;
                    next_state <= fetch_neuron_weights;
                when others =>
                    next_state <= idle;
                    
            end case ;
	    end if ;
    end process;
    state <= next_state;
    num <= next_num;
    address <= next_address;
    -- ics
    specialregfile : entity work.special_register_file generic map ( n , ram_size , address_size ) port map ( clk , enable_mar_in , enable_mdr_in ,  enable_mdr_out ,  enable_write , rst ,  clk_inv, bus_left , bus_right );
    labelsregfile  : entity work.label_register_file generic map ( n ) port map ( clk , rst , enable_decoder_src , enable_decoder_dst , sel_src, sel_dst , bus_left , bus_right );
    alu_subtractor_adder : entity work.alu generic map ( label_size ) port map ( alu_inp1 , alu_inp2 , alu_sel , alu_cin , alu_out , alu_cout );
end a_controller;
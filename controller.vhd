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
        ready_signal   : inout std_logic;
        bi_bus         : inout std_logic_vector(n-1 downto 0)
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

    type sub_state_type is ( sub_state_1 , sub_state_2 , sub_state_3 , sub_state_4 , sub_state_5 );


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
    signal sub_state : sub_state_type := sub_state_1; -- signal to avoid infinite loop.
    
    signal address : std_logic_vector(address_size - 1 downto 0) := (others => '0'); -- address of (num of neurons).
    signal next_address : std_logic_vector(address_size - 1 downto 0) := (others => '0'); -- temp address to be incremented after each state of fetch neuron
    
    signal alu_inp1  : std_logic_vector(label_size - 1 downto 0) := (others => '0'); -- a
    signal alu_inp2	 : std_logic_vector(label_size - 1 downto 0) := (others => '0'); -- b
    signal alu_out   : std_logic_vector(label_size - 1 downto 0) := (others => '0'); -- add or sub
    signal alu_sel   : std_logic := '0';
    signal alu_cin   : std_logic := '0';
    signal alu_cout  : std_logic := '0';
    
    -- begin masterpieces :v

begin
    process( clk )
    begin
        if (clk'event and clk = '1') then
            
            if(initiate = '1') then
                ready_signal <= '0'; initiate <= '0';
                state <= fetch_num_neuron;          
            else
                case(state) is
                    when fetch_num_neuron =>
                        case(sub_state) is
                            when sub_state_1 =>
                                sel_src <= "0000";          sel_dst <= "0000"; 
                                enable_mar_in <= '0';       enable_write <= '0'; 
                                enable_mdr_in <= '0';       enable_mdr_out <= '0'; 
                                enable_decoder_src <= '0';  enable_decoder_dst <= '0';
                                sub_state <= sub_state_2;
                            when sub_state_2 => 
                                sub_state <= sub_state_3;
                                bi_bus(address_size - 1 downto 0) <= address;
                                enable_mar_in <= '1';
                                enable_mdr_in <= '1';
                            when sub_state_3 =>
                                sub_state <= sub_state_4;
                                alu_inp1 <= null_vec(label_size -1 downto address_size)&address;
                                alu_inp2 <= null_vec(label_size -1 downto 1)&'1';
                                alu_sel <= '0';
                                bi_bus <= (others => 'Z');
                                enable_mar_in <= '0';
                            when sub_state_4 =>
                                sub_state <= sub_state_5;
                                enable_mdr_out <= '1';
                                address <= alu_out;
                                enable_mdr_in <= '0';
                            when sub_state_5 =>
                                sub_state <= sub_state_1;
                                num <= bi_bus(label_size - 1 downto 0 );
                                state <= prepare_labels;
                                enable_mdr_out <= '0';
                        end case ;

                    when prepare_labels =>

                        case(sub_state) is
                            when sub_state_1 =>
                                sel_src <= "0000";          sel_dst <= "0000"; 
                                enable_mar_in <= '0';       enable_write <= '0'; 
                                enable_mdr_in <= '0';       enable_mdr_out <= '0'; 
                                enable_decoder_src <= '0';  enable_decoder_dst <= '0';
                                bi_bus <= (others => 'Z');
                                sub_state <= sub_state_2;
                            when sub_state_2 => 
                                sub_state <= sub_state_3;
                                bi_bus(address_size - 1 downto 0) <= address;
                                enable_mar_in <= '1';
                                enable_mdr_in <= '1';
                            when sub_state_3 =>
                                sub_state <= sub_state_4;
                                alu_inp1 <= null_vec(label_size -1 downto address_size)&address;
                                alu_inp2 <= null_vec(label_size -1 downto 1)&'1';
                                alu_sel <= '0';
                                bi_bus <= (others => 'Z');
                                enable_mar_in <= '0';
                            when sub_state_4 =>
                                sub_state <= sub_state_5;
                                enable_mdr_out <= '1';
                                address <= alu_out;
                                enable_mdr_in <= '0';
                                enable_decoder_dst <= '1';
                                sel_dst <= "1111";
                            when sub_state_5 =>
                                sub_state <= sub_state_1;
                                state <= fetch_neuron_weights;
                                enable_mdr_out <= '0';
                                enable_decoder_dst <= '0';
                                sel_dst <= "0000";
                        end case ;
                    
                    when fetch_neuron_weights =>
                        -- here all neurons are done and I'm waiting for another initiate signal.
                        if(num = null_vec) then
                            state <= idle;
                        end if;
                        -- if ready_signal is equal to zero this means booths needs more.
                        if ready_signal = '0' then
                            case(sub_state) is
                                when sub_state_1 =>
                                    sel_src <= "0000";          sel_dst <= "0000"; 
                                    enable_mar_in <= '0';       enable_write <= '0'; 
                                    enable_mdr_in <= '0';       enable_mdr_out <= '0'; 
                                    enable_decoder_src <= '0';  enable_decoder_dst <= '0';
                                    bi_bus <= (others => 'Z');
                                    ready_signal <= '0';
                                    sub_state <= sub_state_2;
                                when sub_state_2 => 
                                    sub_state <= sub_state_3;
                                    bi_bus(address_size - 1 downto 0) <= address;
                                    enable_mar_in <= '1';
                                    enable_mdr_in <= '1';
                                    alu_inp1 <= null_vec(label_size -1 downto address_size)&address;
                                    alu_inp2 <= null_vec(label_size -1 downto 1)&'1';
                                    alu_sel <= '0';
                                when others =>
                                    state <= ready;
                                    sub_state <= sub_state_1;
                                    address <= alu_out;
                                    enable_mar_in <= '0';
                                    enable_mdr_in <= '0';
                            end case ;    
                        end if ;
                    when ready =>
                        case( sub_state ) is
                            when sub_state_1 =>
                                sel_src <= "0000";          sel_dst <= "0000"; 
                                enable_mar_in <= '0';       enable_write <= '0'; 
                                enable_mdr_in <= '0';       enable_mdr_out <= '0'; 
                                enable_decoder_src <= '0';  enable_decoder_dst <= '0';
                                bi_bus <= (others => 'Z');
                                alu_inp1 <= null_vec(label_size -1 downto ram_size)&address;
                                alu_inp2 <= null_vec(label_size -1 downto 1)&'1';
                                alu_cin <= '0'; 
                                alu_sel <= '1';
                                sub_state <= sub_state_2;
                            when others =>
                                num <= alu_out;
                                ready_signal <= '1';
                                state <= fetch_neuron_weights;
                                sub_state <= sub_state_1;
                        end case;         
                    when idle => 
                        state <= fetch_neuron_weights;
                end case ;
            end if;
        end if ;
    end process ; 
    specialregfile : entity work.special_register_file generic map ( n , ram_size , address_size ) port map ( clk , clk_inv , rst ,  enable_mar_in , enable_mdr_in , enable_mdr_out , enable_write , bi_bus );
    labelsregfile  : entity work.label_register_file generic map ( n ) port map ( clk , rst , enable_decoder_src , enable_decoder_dst , sel_src, sel_dst , bi_bus );
    alu_subtractor_adder : entity work.alu generic map ( label_size ) port map ( alu_inp1 , alu_inp2 , alu_sel , alu_cin , alu_out , alu_cout );
end a_controller;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
entity controller is
    generic (
        n              : integer := 256;
        ram_size        : integer := 64;
        address_size : integer := 8 
    );
    port (
        clk            : in    std_logic; 
        clk_inv      : in    std_logic; 
        rst            : in    std_logic;
        initiate       : inout std_logic;
        ready_signal   : out   std_logic;   
        bus_left        : inout std_logic_vector(n-1 downto 0);
        bus_right      : inout std_logic_vector(n-1 downto 0)
    );
end entity controller;

architecture a_controller of controller is

    type state_type is ( idle , prepare_labels , fetch_neuron , fetch_weights , ready ); -- our fsm.    

    -- idle : state that make the fsm waiting to begin.
    -- prepare_labels : state to prepare bias registers with initial values ( latched from memory in specific location ).
    -- fetch_neuron : state to fetch neuron from the memory.
    -- fetch_weights : state to fetch all weight (note: the weights will be on mdr all the time).
    -- ready : state whose job is to rise a signal to booth's algorithm to start multipication.

    signal enable_decoder_src     : std_logic; -- enable the source decoder.
    signal enable_decoder_dst     : std_logic; -- enable the destination decoder.
    signal enable_mar_in          : std_logic; -- enable mar.
    signal enable_mdr_in          : std_logic; -- enable mdr to put data in it.
    signal enable_neuron_in       : std_logic; -- enable neuron register.
    signal enable_write           : std_logic; -- write signal to memory to enable to write the final result into ram.
    signal enable_mdr_out         : std_logic; -- enable mdr to latch its data into bus.
    signal enable_neuron_out      : std_logic; -- enable neuron to latch its data into bus.

    signal sel_src : std_logic_vector(3 downto 0); -- selector for the souce decoder.
    signal sel_dst : std_logic_vector(3 downto 0); -- selector for the destination decoder.

    signal num : std_logic_vector( 15 downto 0 ); -- number of neurons.

    signal state : state_type := idle;      -- main signal of fsm ( this is the main state ).
    signal next_state : state_type := idle; -- signal to avoid infinite loop.
    
    -- begin masterpieces :v

begin
    process(clk , state)
    begin
        if (rising_edge(clk) and initiate = '1') then
            ready_signal <= '0';
            initiate <= '0';
            next_state <= prepare_labels;
        elsif (rising_edge(clk)) then
            case( state ) is
                when prepare_labels =>
                    -- prepare label registers.
                    next_state <= fetch_neuron;
                when fetch_neuron =>
                    -- prepare neuron register.
                    next_state <= fetch_weights;
                when fetch_weights =>
                    -- prepare weights (will be in the mdr). 
                    next_state <= ready;
                when ready =>
                    -- rise a signal to booth's algorithm to start multipication.
                    ready_signal <= '1';
                    next_state <= idle;
                when others =>
                    next_state <= idle;
            end case ;
	end if ;
        end process;
        state <= next_state;
        
        -- ics
        specialregfile : entity work.special_register_file generic map ( n , ram_size , address_size ) port map ( clk , enable_mar_in , enable_mdr_in , enable_neuron_in , enable_mdr_out , enable_neuron_out ,  enable_write , rst ,  clk_inv, bus_left , bus_right );
        labelsregfile  : entity work.label_register_file generic map ( n ) port map ( clk , rst , enable_decoder_src , enable_decoder_dst , sel_src, sel_dst , bus_left , bus_right );
end a_controller;
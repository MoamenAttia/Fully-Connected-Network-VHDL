library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
Entity Controller is
    generic ( n : integer := 256; ramSize : integer := 64; MarAddressSize : integer := 8 );
    port(
    initiate , clk ,  resume , clkInv , rst : in std_logic;
    readySignal : out std_logic;   
    busLeft , busRight  : inout std_logic_vector(n-1 downto 0));
End entity Controller;

Architecture a_Controller of Controller is

    type state_type IS ( idle , prepLab , fetchNeuron , fetchWeights , ready ); -- our FSM.    

    -- idle : state that make the fsm waiting to begin.
    -- prepLab : state to prepare bias registers with initial values ( latched from memory in specific location ).
    -- fetchNeuron : state to fetchNeuron from the memory.
    -- fetchWeights : state to fetch all weight (note: the weights will be on MDR all the time).
    -- ready : state whose job is to rise a signal to Booth's Algorithm to start multipication.
    
    signal decoder_en_src   : std_logic; -- enable the source decoder.
    signal decoder_en_dst   : std_logic; -- enable the destination decoder.
    signal enMARIn          : std_logic; -- enable MAR.
    signal enMDRIn          : std_logic; -- enable MDR to put data in it.
    signal enNeuronIn       : std_logic; -- enable Neuron Register.
    signal writeEnable      : std_logic; -- write signal to memory to enable to write the final result into ram.
    signal enMDROut         : std_logic; -- enable MDR to latch its data into bus.
    signal enNeuronOut      : std_logic; -- enable Neuron to latch its data into bus.

    signal sel_src : std_logic_vector(3 downto 0); -- selector for the souce decoder.
    signal sel_dst : std_logic_vector(3 downto 0); -- selector for the destination decoder.

    signal num : std_logic_vector( 15 downto 0 ); -- number of neurons.

    signal state : state_type := idle; -- main signal of FSM ( this is the main state ).
    signal next_state : state_type := idle; -- signal to avoid infinite loop.
    
    -- begin masterpieces :V

begin
    process(clk , state)
    begin
        if (rising_edge(clk) and initiate = '1') then
            readySignal <= '0';
            initiate <= '0';
            next_state <= prepLab;
        elsif (rising_edge(clk)) then
            case( state ) is
                when prepLab =>
                    -- prepare label registers.
                    next_state <= fetchNeuron;
                when fetchNeuron =>
                    -- prepare neuron register.
                    next_state <= fetchWeights;
                when fetchWeights =>
                    -- prepare weights (will be in the MDR). 
                    next_state <= ready;
                when ready =>
                    -- rise a signal to Booth's Algorithm to start multipication.
                    readySignal <= '1';
                    next_state <= idle;
                when others =>
                    next_state <= idle;
            end case ;
	end if ;
        end process;
        state <= next_state;
        -- specialRegFile : entity work.SpecialRegisterFile generic map ( n , ramSize , MarAddressSize ) port map ( clk , enMARIn , enMDRIn , enNeuronIn , enMDROut , enNeuronOut ,  writeEnable , clkInv , rst ,  busLeft , busRight );
        -- labelsRegFile  : entity work.LabelRegisterFile generic map ( n ) port map ( clk , rst , decoder_en_src , decoder_en_dst , sel_src, sel_dst , busLeft , busRight );
End a_Controller;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

Entity SpecialRegisterFile is
  generic ( n : integer := 256; ramSize : integer := 64; MarAddressSize : integer := 8 );
    Port (
        clk , enMARIn , enMDRIn , enNeuronIn , enMDROut , enNeuronOut ,  writeEnable , clkInv , rst : in std_logic;
        busLeft , busRight : inout std_logic_vector(n-1 downto 0));
End entity SpecialRegisterFile;

Architecture a_SpecialRegisterFile of SpecialRegisterFile is
    signal inMDR , MDRout , MARout , ne: std_logic_vector(n-1 downto 0);

    begin
        MAR    : entity work.nDFF generic map (n) port map ( clk , rst , enMARIn , busLeft , MARout );

        MDR    : entity work.nDFF generic map (n) port map ( clk , rst , enMDRIn , inMDR , MDRout );
        tri_state_mdr_bus : entity word.TriState generic map ( n ) port map ( enMDROut , MDRout , busRight );

        Neuron : entity work.nDFF generic map (n) port map ( clk , rst , enNeuronIn , busLeft , neuronOut );
        tri_state_neuron_bus : entity word.TriState generic map ( n ) port map ( enNeuronOut , neuronOut , busRight );
        
        inMDR <= busLeft when writeEnable = '0' else dataOut;
        myRama : entity work.myRam generic map ( n , ramSize , MarAddressSize ) port map ( clkInv , writeEnable , MARout , MDRout , inMDR );
        
End a_SpecialRegisterFile;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

Entity Controller is
  generic ( n : integer := 256; ramSize : integer := 64; MarAddressSize : integer := 8 );
    port(
        initiate , clk ,  resume , decoder_en_src , decoder_en_dst , enMARIn , enMDRIn , enNeuronIn , enMDROut , enNeuronOut ,  writeEnable , clkInv , rst : in std_logic;
        sel_src, sel_dst : in std_logic_vector(3 downto 0);
        busLeft , busRight : inout std_logic_vector(n-1 downto 0)
    );
End entity Controller;

Architecture a_Controller of Controller is
    begin

End a_Controller;
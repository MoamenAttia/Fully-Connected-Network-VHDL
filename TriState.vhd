library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity TriState is
  Generic ( n : integer := 32);
    Port ( 
           tri_enable : in  STD_LOGIC;
           tri_input  : in  STD_LOGIC_VECTOR (n-1 downto 0);
           tri_output : out STD_LOGIC_VECTOR (n-1 downto 0));
End TriState;

Architecture a_tri_state of TriState is
Begin
    tri_output <= tri_input when (tri_enable = '1') 
                  else (others => 'Z');
End a_tri_state;
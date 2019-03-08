LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY N_Dff IS
GENERIC ( n : integer := 32);
  PORT( Clk,Rst,En  : IN  std_logic;
        d           : IN  std_logic_vector(n-1 DOWNTO 0);
        q           : OUT std_logic_vector(n-1 DOWNTO 0));
END N_Dff;

architecture a_nDFF of N_Dff is
  begin
    loop1: for i in 0 to n-1 
      Generate
        fx:entity work.Dff port map( d(i) , clk , rst , en , q(i) );
      end Generate;
end a_nDFF;
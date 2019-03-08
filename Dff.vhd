library ieee;
use ieee.std_logic_1164.all;

entity Dff is
    port ( 
      d   : in  std_logic;
      clk : in  std_logic;
      rst : in  std_logic;
      en  : in  std_logic;
      q   : out std_logic
    );
end entity Dff;

Architecture a_Dff of Dff is
  Begin
    Process(clk , rst , en )
      Begin
        if(rst = '1') then
           q <= '0';
        elsif rising_edge(clk) and en = '1' then     
          q <= d;
        End if;
    End process;
End a_Dff;

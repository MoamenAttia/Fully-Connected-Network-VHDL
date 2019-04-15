library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Utiles.ALL;

entity TestnMax is
end TestnMax;

architecture TestBenchArch of TestnMax is
  signal inputArrayM : genericArrayofVector16bit;
  signal inputArrayR : genericArrayofVector16bit;
  signal ResultArray : genericArrayofVector16bit;
  signal M,R::std_logic_vector(15 downto 0);
  signal result :std_logic_vector(31 downto 0);
  signal clk,set,done,rst : std_logic;
begin
  maxEnt : entity work.booth_integration generic map(16) port map (set,clk,rst,M,R,result); --modified

  process
  begin
    inputArrayM <= 
        ( x"5d1b", x"8e53", x"e3b9", x"2ec0", x"50af", x"afaf", x"bdc7", x"c17d", x"3e0d", x"fe29",x"7eff", x"5d58", x"aca3", x"eb1e", x"3932", x"056c", x"7a2b", x"d391", x"43ad", x"f8b7", x"b970", x"6b58", x"b27e", x"a8c4", x"991d", x"7f48", x"fb47", x"0fb1", x"5c28", x"25a3", x"edb1", x"3668", x"2364", x"d040", x"575b", x"01b8", x"9e3b", x"b4de", x"2289", x"0ee3",x"28f4", x"3780", x"29ff", x"fd3f", x"63a6", x"9a86", x"3299", x"d057", x"5a7a", x"7472", x"a91f", x"9879", x"bfd7", x"1f82", x"9666", x"3227", x"5d2d", x"986b", x"f17a", x"e7f7", x"54ee", x"6891", x"db04", x"be1f", x"320d", x"231c", x"24a7", x"7455", x"24f9", x"e7d7",x"5c51", x"c817", x"d077", x"18da", x"82ca", x"5e19", x"e410", x"bb24", x"3152", x"baf2",x"2b51", x"47b1", x"dc9e", x"63e1", x"431b", x"aa50", x"20f6", x"d449", x"80f9", x"75c5", x"55c9", x"3a2a", x"a645", x"f583", x"55db", x"7927", x"1c05", x"c4ad", x"e74f", x"0f2e");

    inputArrayR <= 
        ( x"5d1b", x"8e53", x"e3b9", x"2ec0", x"50af", x"afaf", x"bdc7", x"c17d", x"3e0d", x"fe29",x"7eff", x"5d58", x"aca3", x"eb1e", x"3932", x"056c", x"7a2b", x"d391", x"43ad", x"f8b7", x"b970", x"6b58", x"b27e", x"a8c4", x"991d", x"7f48", x"fb47", x"0fb1", x"5c28", x"25a3", x"edb1", x"3668", x"2364", x"d040", x"575b", x"01b8", x"9e3b", x"b4de", x"2289", x"0ee3",x"28f4", x"3780", x"29ff", x"fd3f", x"63a6", x"9a86", x"3299", x"d057", x"5a7a", x"7472", x"a91f", x"9879", x"bfd7", x"1f82", x"9666", x"3227", x"5d2d", x"986b", x"f17a", x"e7f7", x"54ee", x"6891", x"db04", x"be1f", x"320d", x"231c", x"24a7", x"7455", x"24f9", x"e7d7",x"5c51", x"c817", x"d077", x"18da", x"82ca", x"5e19", x"e410", x"bb24", x"3152", x"baf2",x"2b51", x"47b1", x"dc9e", x"63e1", x"431b", x"aa50", x"20f6", x"d449", x"80f9", x"75c5", x"55c9", x"3a2a", x"a645", x"f583", x"55db", x"7927", x"1c05", x"c4ad", x"e74f", x"0f2e");

	ResultArray <= 
			( x"5d1b", x"8e53", x"e3b9", x"2ec0", x"50af", x"afaf", x"bdc7", x"c17d", x"3e0d", x"fe29",x"7eff", x"5d58", x"aca3", x"eb1e", x"3932", x"056c", x"7a2b", x"d391", x"43ad", x"f8b7", x"b970", x"6b58", x"b27e", x"a8c4", x"991d", x"7f48", x"fb47", x"0fb1", x"5c28", x"25a3", x"edb1", x"3668", x"2364", x"d040", x"575b", x"01b8", x"9e3b", x"b4de", x"2289", x"0ee3",x"28f4", x"3780", x"29ff", x"fd3f", x"63a6", x"9a86", x"3299", x"d057", x"5a7a", x"7472", x"a91f", x"9879", x"bfd7", x"1f82", x"9666", x"3227", x"5d2d", x"986b", x"f17a", x"e7f7", x"54ee", x"6891", x"db04", x"be1f", x"320d", x"231c", x"24a7", x"7455", x"24f9", x"e7d7",x"5c51", x"c817", x"d077", x"18da", x"82ca", x"5e19", x"e410", x"bb24", x"3152", x"baf2",x"2b51", x"47b1", x"dc9e", x"63e1", x"431b", x"aa50", x"20f6", x"d449", x"80f9", x"75c5", x"55c9", x"3a2a", x"a645", x"f583", x"55db", x"7927", x"1c05", x"c4ad", x"e74f", x"0f2e");    

    set <= '0';
    rst<='1';
    
    wait for 100 ns;
    rst<='0';
    wait for 100 ns;
    l1: for i in 1 downto 0 loop
          M <= "0000000111110100";
		  R <= "0000000011001000";
          set <= '1';
          wait for 2000 ns;  --modified
          assert result = "00000000000000011000011010100000"
          report "Fail out label "
          severity error;
          set <= '0';
          wait for 100 ns;
    end loop;
   report "TestDone";
   wait;
  end process;

  process
  begin
    clk <= '0';
    wait for 50 ns;
    clk <= '1';
    wait for 50 ns;
  end process;
end TestBenchArch;


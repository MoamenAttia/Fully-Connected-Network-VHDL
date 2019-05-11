


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test is
    port (
        clk            : in    std_logic; 
        rst            : in    std_logic
 );
end entity test;

architecture a_test of test is
signal initiate : std_logic;
signal enable_read : std_logic;
signal address : std_logic_vector(15 downto 0);
signal data_out : std_logic_vector(255 downto 0);
signal res	: std_logic_vector(3 downto 0);
signal done	: std_logic;
signal neuron_address : std_logic_vector(15 downto 0);


begin 

test_controller: entity work.FC_controller port map(
	clk,
	rst,
	initiate,
	enable_read,
	address,
	data_out,
	res,
	done

);
end a_test;


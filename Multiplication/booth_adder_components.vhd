LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY booth_adder_components IS
Generic (n:integer :=8);
	PORT (set : IN  std_logic;
	      neuron : in std_logic_vector(n-1 downto 0);
	      weight_0 : in std_logic_vector(n-1 downto 0);
              weight_1 : in std_logic_vector(n-1 downto 0);
              weight_2 : in std_logic_vector(n-1 downto 0);
              weight_3 : in std_logic_vector(n-1 downto 0);
              weight_4 : in std_logic_vector(n-1 downto 0);
              weight_5 : in std_logic_vector(n-1 downto 0);
              weight_6 : in std_logic_vector(n-1 downto 0);
              weight_7 : in std_logic_vector(n-1 downto 0);
	      weight_8 : in std_logic_vector(n-1 downto 0);
              weight_9 : in std_logic_vector(n-1 downto 0);
	      rst: in std_logic ; 
              clk : in std_logic          
 );
END booth_adder_components;

ARCHITECTURE my_booth_adder_components OF booth_adder_components IS
signal booth_integration_output_0 : std_logic_vector (2*n-1 downto 0);
signal booth_integration_output_1 : std_logic_vector (2*n-1 downto 0);
signal booth_integration_output_2 : std_logic_vector (2*n-1 downto 0);
begin
booth_integrtaion_0:entity work.booth_integration  generic map (n)port map ( set, clk , rst ,neuron,weight_0,booth_integration_output_0);
booth_integrtaion_1:entity work.booth_integration  generic map (n)port map ( set, clk , rst ,neuron,weight_1,booth_integration_output_1);
booth_integrtaion_2:entity work.booth_integration  generic map (n)port map ( set, clk , rst ,neuron,weight_2,booth_integration_output_2);

END my_booth_adder_components;

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
signal booth_integration_output_3 : std_logic_vector (2*n-1 downto 0);
signal booth_integration_output_4 : std_logic_vector (2*n-1 downto 0);
signal booth_integration_output_5 : std_logic_vector (2*n-1 downto 0);
signal booth_integration_output_6 : std_logic_vector (2*n-1 downto 0);
signal booth_integration_output_7 : std_logic_vector (2*n-1 downto 0);
signal booth_integration_output_8 : std_logic_vector (2*n-1 downto 0);
signal booth_integration_output_9 : std_logic_vector (2*n-1 downto 0);
signal adder_input_reg  : std_logic_vector (2*n-1 downto 0);
signal adder_output : std_logic_vector (2*n-1 downto 0);
signal adder_input_mul : std_logic_vector (2*n-1 downto 0);
signal temp_cout : std_logic;
signal shift_reg_output : std_logic_vector(n+2 downto 0);
begin
booth_integrtaion_0:entity work.booth_integration  generic map (n)port map ( set, clk , rst ,neuron,weight_0,booth_integration_output_0);
--booth_integrtaion_1:entity work.booth_integration  generic map (n)port map ( set, clk , rst ,neuron,weight_1,booth_integration_output_1);
--booth_integrtaion_2:entity work.booth_integration  generic map (n)port map ( set, clk , rst ,neuron,weight_2,booth_integration_output_2);
--booth_integrtaion_3:entity work.booth_integration  generic map (n)port map ( set, clk , rst ,neuron,weight_3,booth_integration_output_3);
--booth_integrtaion_4:entity work.booth_integration  generic map (n)port map ( set, clk , rst ,neuron,weight_4,booth_integration_output_4);
--booth_integrtaion_5:entity work.booth_integration  generic map (n)port map ( set, clk , rst ,neuron,weight_5,booth_integration_output_5);
--booth_integrtaion_6:entity work.booth_integration  generic map (n)port map ( set, clk , rst ,neuron,weight_6,booth_integration_output_6);
--booth_integrtaion_7:entity work.booth_integration  generic map (n)port map ( set, clk , rst ,neuron,weight_7,booth_integration_output_7);
--booth_integrtaion_8:entity work.booth_integration  generic map (n)port map ( set, clk , rst ,neuron,weight_8,booth_integration_output_8);
--booth_integrtaion_9:entity work.booth_integration  generic map (n)port map ( set, clk , rst ,neuron,weight_9,booth_integration_output_9);
adder_input_mul <= booth_integration_output_0;
test:entity work.my_nDFF  generic map (2*n) port map (clk,rst,adder_output,adder_input_reg,shift_reg_output(n+1));
adder:entity work.nadder  generic map (2*n) port map (adder_input_mul  ,adder_input_reg  , '0' ,adder_output,temp_cout);
shift_Reg:entity work.shift_reg  generic map (n+3) port map ( set, clk , rst ,shift_reg_output);
END my_booth_adder_components;

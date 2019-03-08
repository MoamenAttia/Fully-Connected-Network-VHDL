library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity special_register_file is
  generic ( n : integer := 256; ram_size : integer := 64; address_size : integer := 8 );
    port (
      clk               : in std_logic;
      clk_inv           : in std_logic;
      rst               : in std_logic;
      enable_mar_in     : in std_logic;
      enable_mdr_in     : in std_logic;
      enable_neuron_in  : in std_logic;
      enable_mdr_out    : in std_logic;
      enable_neuron_out : in std_logic;
      enable_write      : in std_logic;
      bus_left          : inout std_logic_vector(n-1 downto 0);
      bus_right         : inout std_logic_vector(n-1 downto 0)
    );
end entity special_register_file;

architecture a_special_register_file of special_register_file is
    signal mdr_input  : std_logic_vector(n-1 downto 0);
    signal mdr_out    : std_logic_vector(n-1 downto 0);
    signal data_out   : std_logic_vector(n-1 downto 0);
    signal neuron_out : std_logic_vector(n-1 downto 0);
    signal mar_out    : std_logic_vector(address_size - 1 downto 0);
    begin
        mar    : entity work.N_Dff generic map (address_size) port map ( clk , rst , enable_mar_in , bus_left(address_size-1 downto 0) , mar_out );

        mdr    : entity work.N_Dff generic map (n) port map ( clk , rst , enable_mdr_in , mdr_input , mdr_out );
        tri_state_mdr_bus : entity work.tri_state generic map ( n ) port map ( enable_mdr_out , mdr_out , bus_right );

        neuron : entity work.N_Dff generic map (n) port map ( clk , rst , enable_neuron_in , bus_left , neuron_out );
        tri_state_neuron_bus : entity work.tri_state generic map ( n ) port map ( enable_neuron_out , neuron_out , bus_right );
        
        mdr_input <= bus_left when enable_write = '0' else data_out;
        my_ram : entity work.ram generic map ( n , ram_size , address_size ) port map ( clk_inv , enable_write , mar_out , mdr_out , data_out );
        
end a_special_register_file;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity label_register_file is
  generic ( n : integer := 256 );
    port ( 
        clk : in std_logic;
        rst : in std_logic;
        enable_decoder_src : in std_logic;
        enable_decoder_dst : in std_logic;
        sel_src : in std_logic_vector(3 downto 0);
        sel_dst : in std_logic_vector(3 downto 0);
        bi_bus  : inout std_logic_vector (n-1 downto 0)
    );
end entity label_register_file;

architecture a_label_register_file of label_register_file is

    signal lab1_out  : std_logic_vector(15 downto 0);
    signal lab2_out  : std_logic_vector(15 downto 0);
    signal lab3_out  : std_logic_vector(15 downto 0);
    signal lab4_out  : std_logic_vector(15 downto 0);
    signal lab5_out  : std_logic_vector(15 downto 0);
    signal lab6_out  : std_logic_vector(15 downto 0);
    signal lab7_out  : std_logic_vector(15 downto 0);
    signal lab8_out  : std_logic_vector(15 downto 0);
    signal lab9_out  : std_logic_vector(15 downto 0);
    signal lab10_out : std_logic_vector(15 downto 0);
    
    signal decoder_out_dst : std_logic_vector ( 15 downto 0 );
    signal decoder_out_src : std_logic_vector ( 15 downto 0 );
    
    begin
      
    dst_decoder: entity work.decoder4x16 port map ( sel_dst , decoder_out_dst , enable_decoder_dst );
    src_decoder : entity work.decoder4x16 port map ( sel_src  , decoder_out_src  , enable_decoder_src  );
    
    label1  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(0) , bi_bus(15 downto 0) , lab1_out );
    tri_state_label1 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(0) , lab1_out , bi_bus(15 downto 0) );
    
    label2  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(1) , bi_bus(31 downto 16) , lab2_out );
    tri_state_label2 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(1) , lab2_out , bi_bus(31 downto 16) );
    
    label3  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(2) , bi_bus(47 downto 32) , lab3_out );
    tri_state_label3 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(2) , lab3_out , bi_bus(47 downto 32) );
    
    label4  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(3) , bi_bus(63 downto 48) , lab4_out );
    tri_state_label4 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(3) , lab4_out , bi_bus(63 downto 48) );
    
    label5  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(4) , bi_bus(79 downto 64) , lab5_out );
    tri_state_label5 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(4) , lab5_out , bi_bus(79 downto 64) );
    
    label6  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(5) , bi_bus(95 downto 80) , lab6_out );
    tri_state_label6 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(5) , lab6_out , bi_bus(95 downto 80) );
    
    label7  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(6) , bi_bus(111 downto 96) , lab7_out );
    tri_state_label7 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(6) , lab7_out , bi_bus(111 downto 96) );
    
    label8  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(7) , bi_bus(127 downto 112) , lab8_out );
    tri_state_label8 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(7) , lab8_out , bi_bus(127 downto 112) );
    
    label9  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(8) , bi_bus(143 downto 128) , lab9_out );
    tri_state_label9 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(8) , lab9_out , bi_bus(143 downto 128) );
    
    label10 : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(9) , bi_bus(159 downto 144) , lab10_out );
    tri_state_label10: entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(9) , lab10_out , bi_bus(159 downto 144) );

end a_label_register_file;
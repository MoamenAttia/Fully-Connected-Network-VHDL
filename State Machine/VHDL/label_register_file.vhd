library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity label_register_file is
    port ( 
        clk : in std_logic;
        rst : in std_logic;
        enable_decoder_src : in std_logic;
        enable_decoder_dst : in std_logic;
        sel_src : in std_logic_vector(3 downto 0);
        sel_dst : in std_logic_vector(3 downto 0);
        mdr_data  : in std_logic_vector (255 downto 0);

        ---------------- Labels Ports --------------------------
        label_1_output : out std_logic_vector(15 downto 0);
        label_2_output : out std_logic_vector(15 downto 0);
        label_3_output : out std_logic_vector(15 downto 0);
        label_4_output : out std_logic_vector(15 downto 0);
        label_5_output : out std_logic_vector(15 downto 0);
        label_6_output : out std_logic_vector(15 downto 0);
        label_7_output : out std_logic_vector(15 downto 0);
        label_8_output : out std_logic_vector(15 downto 0);
        label_9_output : out std_logic_vector(15 downto 0);
        label_10_output: out std_logic_vector(15 downto 0)
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
    
    label1  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(0) , mdr_data(15 downto 0) , lab1_out );
    tri_state_label1 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(0) , lab1_out , label_1_output );
    
    label2  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(1) , mdr_data(31 downto 16) , lab2_out );
    tri_state_label2 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(1) , lab2_out , label_2_output );
    
    label3  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(2) , mdr_data(47 downto 32) , lab3_out );
    tri_state_label3 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(2) , lab3_out , label_3_output );
    
    label4  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(3) , mdr_data(63 downto 48) , lab4_out );
    tri_state_label4 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(3) , lab4_out , label_4_output );
    
    label5  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(4) , mdr_data(79 downto 64) , lab5_out );
    tri_state_label5 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(4) , lab5_out , label_5_output );
    
    label6  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(5) , mdr_data(95 downto 80) , lab6_out );
    tri_state_label6 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(5) , lab6_out , label_6_output );
    
    label7  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(6) , mdr_data(111 downto 96) , lab7_out );
    tri_state_label7 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(6) , lab7_out , label_7_output );
    
    label8  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(7) , mdr_data(127 downto 112) , lab8_out );
    tri_state_label8 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(7) , lab8_out , label_8_output );
    
    label9  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(8) , mdr_data(143 downto 128) , lab9_out );
    tri_state_label9 : entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(8) , lab9_out , label_9_output );
    
    label10 : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(9) , mdr_data(159 downto 144) , lab10_out );
    tri_state_label10: entity work.tri_state generic map ( 16 ) port map ( decoder_out_src(9) , lab10_out , label_10_output );

end a_label_register_file;

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
        label_1_output : inout std_logic_vector(15 downto 0);
        label_2_output : inout std_logic_vector(15 downto 0);
        label_3_output : inout std_logic_vector(15 downto 0);
        label_4_output : inout std_logic_vector(15 downto 0);
        label_5_output : inout std_logic_vector(15 downto 0);
        label_6_output : inout std_logic_vector(15 downto 0);
        label_7_output : inout std_logic_vector(15 downto 0);
        label_8_output : inout std_logic_vector(15 downto 0);
        label_9_output : inout std_logic_vector(15 downto 0);
        label_10_output: inout std_logic_vector(15 downto 0);

	decoder_output : inout std_logic_vector(15 downto 0)
       );
end entity label_register_file;

architecture a_label_register_file of label_register_file is
    
    signal decoder_out_dst : std_logic_vector ( 15 downto 0 );
    signal decoder_out_src : std_logic_vector ( 15 downto 0 );
    
    begin


    -- to be deleted
    decoder_output <= decoder_out_dst;
      
    dst_decoder: entity work.decoder4x16 port map ( sel_dst , decoder_out_dst , enable_decoder_dst );
    src_decoder : entity work.decoder4x16 port map ( sel_src  , decoder_out_src  , enable_decoder_src  );

	
    
    label1  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(0) , mdr_data(15 downto 0)    , label_1_output  );
    label2  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(1) , mdr_data(31 downto 16)   , label_2_output  );
    label3  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(2) , mdr_data(47 downto 32)   , label_3_output  );
    label4  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(3) , mdr_data(63 downto 48)   , label_4_output  );
    label5  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(4) , mdr_data(79 downto 64)   , label_5_output  );
    label6  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(5) , mdr_data(95 downto 80)   , label_6_output  );
    label7  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(6) , mdr_data(111 downto 96)  , label_7_output  );
    label8  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(7) , mdr_data(127 downto 112) , label_8_output  );
    label9  : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(8) , mdr_data(143 downto 128) , label_9_output  );
    label10 : entity work.n_dff generic map ( 16 ) port map ( clk , rst , decoder_out_dst(9) , mdr_data(159 downto 144) , label_10_output );


end a_label_register_file;

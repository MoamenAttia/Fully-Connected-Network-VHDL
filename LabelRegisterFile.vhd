library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

Entity LabelRegisterFile is
  generic ( n : integer := 256; );
    port( clk : in std_logic;
        rst : in std_logic;
        decoderSrcEn , decoderDstEn : in std_logic;
        sel_src, sel_dst : in std_logic_vector( 3 downto 0 );
        busLeft , busRight : inout std_logic_vector(n-1 downto 0));
End entity LabelRegisterFile;

Architecture a_LabelRegisterFile of LabelRegisterFile is
    signal lab1_out , lab2_out , lab3_out  , lab4_out  , lab5_out  , lab6_out , lab7_out , lab8_out , lab9_out , lab10_out : std_logic_vector(n-1 downto 0);
    signal decoder_out_dst , decoder_out_src: std_logic_vector ( 15 downto 0 );
    
    begin

    dst_decoder: entity work.decoder4x16 port map ( sel_dst , decoder_out_dst , decoderdstEn );
    src_decoder : entity work.decoder4x16 port map ( sel_src  , decoder_out_src  , decoderSrcEn  );

    Label1  : entity work.N_Dff generic map ( n ) port map ( clk , rst , decoder_out_dst(0) , busLeft , lab1_out );
    tri_state_label1 : entity work.TriState generic map ( n ) port map ( decoder_out_src(0) , lab1_out , busRight );

    Label2  : entity work.N_Dff generic map ( n ) port map ( clk , rst , decoder_out_dst(1) , busLeft , lab2_out );
    tri_state_label2 : entity work.TriState generic map ( n ) port map ( decoder_out_src(1) , lab2_out , busRight );
    
    Label3  : entity work.N_Dff generic map ( n ) port map ( clk , rst , decoder_out_dst(2) , busLeft , lab3_out );
    tri_state_label3 : entity work.TriState generic map ( n ) port map ( decoder_out_src(2) , lab3_out , busRight );
    
    Label4  : entity work.N_Dff generic map ( n ) port map ( clk , rst , decoder_out_dst(3) , busLeft , lab4_out );
    tri_state_label4 : entity work.TriState generic map ( n ) port map ( decoder_out_src(3) , lab4_out , busRight );
    
    Label5  : entity work.N_Dff generic map ( n ) port map ( clk , rst , decoder_out_dst(4) , busLeft , lab5_out );
    tri_state_label5 : entity work.TriState generic map ( n ) port map ( decoder_out_src(4) , lab5_out , busRight );
    
    Label6  : entity work.N_Dff generic map ( n ) port map ( clk , rst , decoder_out_dst(5) , busLeft , lab6_out );
    tri_state_label6 : entity work.TriState generic map ( n ) port map ( decoder_out_src(5) , lab6_out , busRight );
    
    Label7  : entity work.N_Dff generic map ( n ) port map ( clk , rst , decoder_out_dst(6) , busLeft , lab7_out );
    tri_state_label7 : entity work.TriState generic map ( n ) port map ( decoder_out_src(6) , lab7_out , busRight );
    
    Label8  : entity work.N_Dff generic map ( n ) port map ( clk , rst , decoder_out_dst(7) , busLeft , lab8_out );
    tri_state_label8 : entity work.TriState generic map ( n ) port map ( decoder_out_src(7) , lab8_out , busRight );
    
    Label9  : entity work.N_Dff generic map ( n ) port map ( clk , rst , decoder_out_dst(8) , busLeft , lab9_out );
    tri_state_label9 : entity work.TriState generic map ( n ) port map ( decoder_out_src(8) , lab9_out , busRight );
    
    Label10 : entity work.N_Dff generic map ( n ) port map ( clk , rst , decoder_out_dst(9) , busLeft , lab10_out );
    tri_state_label10: entity work.TriState generic map ( n ) port map ( decoder_out_src(9) , lab10_out , busRight );
    

    End a_LabelRegisterFile;
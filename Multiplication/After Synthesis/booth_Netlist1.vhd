
-- 
-- Definition of  booth_integration
-- 
--      Sun Apr 14 17:25:05 2019
--      
--      LeonardoSpectrum Level 3, 2018a.2
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.adk_components.all;

entity booth_integration is
   port (
      set : IN std_logic ;
      clk : IN std_logic ;
      rst : IN std_logic ;
      M : IN std_logic_vector (7 DOWNTO 0) ;
      R : IN std_logic_vector (7 DOWNTO 0) ;
      booth_output : OUT std_logic_vector (15 DOWNTO 0)) ;
end booth_integration ;

architecture my_booth_integration of booth_integration is
   signal booth_output_14_EXMPLR, booth_output_13_EXMPLR, 
      booth_output_12_EXMPLR, booth_output_11_EXMPLR, booth_output_10_EXMPLR, 
      booth_output_9_EXMPLR, booth_output_8_EXMPLR, booth_output_7_EXMPLR, 
      booth_output_6_EXMPLR, booth_output_5_EXMPLR, booth_output_4_EXMPLR, 
      booth_output_3_EXMPLR, booth_output_2_EXMPLR, booth_output_1_EXMPLR, 
      booth_output_0_EXMPLR, shift_reg_output_5, shift_Reg_en, NOT_set, 
      shift_Reg_count_5, shift_Reg_output_4, shift_Reg_count_4, 
      shift_Reg_output_3, shift_Reg_count_3, shift_Reg_output_2, 
      shift_Reg_count_2, shift_Reg_output_1, shift_Reg_count_1, 
      shift_Reg_count_0, nx273, nx275, nx279, nx282, nx68, nx72, nx76, nx80, 
      nx88, nx92, nx283, nx102, nx104, nx106, nx128, nx136, nx154, nx156, 
      nx158, nx180, nx188, nx196, nx206, nx208, nx210, nx224, nx234, nx236, 
      nx242, nx248, nx256, nx268, nx280, nx292, nx304, nx316, nx328, nx340, 
      nx400, nx414, nx291, nx297, nx311, nx321, nx331, nx341, nx351, nx361, 
      nx371, nx381, nx391, nx401, nx411, nx421, nx431, nx441, nx451, nx461, 
      nx471, nx481, nx491, nx501, nx511, nx521, nx531, nx541, nx551, nx561, 
      nx571, nx638, nx649, nx650, nx653, nx658, nx660, nx666, nx668, nx671, 
      nx675, nx681, nx683, nx687, nx690, nx694, nx696, nx700, nx703, nx706, 
      nx709, nx711, nx713, nx718, nx720, nx723, nx726, nx729, nx733, nx735, 
      nx739, nx742, nx745, nx747, nx752, nx754, nx757, nx760, nx763, nx765, 
      nx771, nx773, nx789, nx795, nx799, nx801, nx807, nx809, nx811, nx813, 
      nx815: std_logic ;

begin
   booth_output(15) <= booth_output_14_EXMPLR ;
   booth_output(14) <= booth_output_14_EXMPLR ;
   booth_output(13) <= booth_output_13_EXMPLR ;
   booth_output(12) <= booth_output_12_EXMPLR ;
   booth_output(11) <= booth_output_11_EXMPLR ;
   booth_output(10) <= booth_output_10_EXMPLR ;
   booth_output(9) <= booth_output_9_EXMPLR ;
   booth_output(8) <= booth_output_8_EXMPLR ;
   booth_output(7) <= booth_output_7_EXMPLR ;
   booth_output(6) <= booth_output_6_EXMPLR ;
   booth_output(5) <= booth_output_5_EXMPLR ;
   booth_output(4) <= booth_output_4_EXMPLR ;
   booth_output(3) <= booth_output_3_EXMPLR ;
   booth_output(2) <= booth_output_2_EXMPLR ;
   booth_output(1) <= booth_output_1_EXMPLR ;
   booth_output(0) <= booth_output_0_EXMPLR ;
   p_Reg_loop1_1_fx_reg_q : dffr port map ( Q=>booth_output_0_EXMPLR, QB=>
      OPEN, D=>nx551, CLK=>clk, R=>rst);
   p_Reg_loop1_2_fx_reg_q : dffr port map ( Q=>booth_output_1_EXMPLR, QB=>
      OPEN, D=>nx541, CLK=>clk, R=>rst);
   p_Reg_loop1_3_fx_reg_q : dffr port map ( Q=>booth_output_2_EXMPLR, QB=>
      OPEN, D=>nx531, CLK=>clk, R=>rst);
   p_Reg_loop1_4_fx_reg_q : dffr port map ( Q=>booth_output_3_EXMPLR, QB=>
      OPEN, D=>nx521, CLK=>clk, R=>rst);
   p_Reg_loop1_5_fx_reg_q : dffr port map ( Q=>booth_output_4_EXMPLR, QB=>
      OPEN, D=>nx511, CLK=>clk, R=>rst);
   p_Reg_loop1_6_fx_reg_q : dffr port map ( Q=>booth_output_5_EXMPLR, QB=>
      OPEN, D=>nx501, CLK=>clk, R=>rst);
   p_Reg_loop1_7_fx_reg_q : dffr port map ( Q=>booth_output_6_EXMPLR, QB=>
      OPEN, D=>nx491, CLK=>clk, R=>rst);
   p_Reg_loop1_8_fx_reg_q : dffr port map ( Q=>booth_output_7_EXMPLR, QB=>
      OPEN, D=>nx481, CLK=>clk, R=>rst);
   ix249 : xnor2 port map ( Y=>nx248, A0=>booth_output_8_EXMPLR, A1=>nx653);
   p_Reg_loop1_9_fx_reg_q : dffr port map ( Q=>booth_output_8_EXMPLR, QB=>
      OPEN, D=>nx471, CLK=>clk, R=>rst);
   shift_Reg_Reg_loop1_0_fx_reg_q : dffr port map ( Q=>OPEN, QB=>nx649, D=>
      nx311, CLK=>clk, R=>rst);
   shift_Reg_reg_count_0 : dffs_ni port map ( Q=>shift_Reg_count_0, QB=>OPEN, 
      D=>nx297, CLK=>clk, S=>NOT_set);
   shift_Reg_Reg_loop1_5_fx_reg_q : dffr port map ( Q=>shift_reg_output_5, 
      QB=>OPEN, D=>nx411, CLK=>clk, R=>rst);
   shift_Reg_reg_count_5 : dffr port map ( Q=>shift_Reg_count_5, QB=>OPEN, D
      =>nx401, CLK=>clk, R=>NOT_set);
   shift_Reg_Reg_loop1_4_fx_reg_q : dffr port map ( Q=>shift_Reg_output_4, 
      QB=>OPEN, D=>nx391, CLK=>clk, R=>rst);
   shift_Reg_reg_count_4 : dffr port map ( Q=>shift_Reg_count_4, QB=>OPEN, D
      =>nx381, CLK=>clk, R=>NOT_set);
   shift_Reg_Reg_loop1_3_fx_reg_q : dffr port map ( Q=>shift_Reg_output_3, 
      QB=>OPEN, D=>nx371, CLK=>clk, R=>rst);
   shift_Reg_reg_count_3 : dffr port map ( Q=>shift_Reg_count_3, QB=>OPEN, D
      =>nx361, CLK=>clk, R=>NOT_set);
   shift_Reg_Reg_loop1_2_fx_reg_q : dffr port map ( Q=>shift_Reg_output_2, 
      QB=>OPEN, D=>nx351, CLK=>clk, R=>rst);
   shift_Reg_reg_count_2 : dffr port map ( Q=>shift_Reg_count_2, QB=>OPEN, D
      =>nx341, CLK=>clk, R=>NOT_set);
   shift_Reg_Reg_loop1_1_fx_reg_q : dffr port map ( Q=>shift_Reg_output_1, 
      QB=>OPEN, D=>nx331, CLK=>clk, R=>rst);
   shift_Reg_reg_count_1 : dffr port map ( Q=>shift_Reg_count_1, QB=>OPEN, D
      =>nx321, CLK=>clk, R=>NOT_set);
   ix634 : inv02 port map ( Y=>NOT_set, A=>set);
   shift_Reg_reg_en : dffs_ni port map ( Q=>shift_Reg_en, QB=>nx638, D=>
      nx291, CLK=>clk, S=>NOT_set);
   ix651 : xnor2 port map ( Y=>nx650, A0=>nx273, A1=>nx236);
   ix363 : nor02ii port map ( Y=>nx273, A0=>nx653, A1=>booth_output_8_EXMPLR
   );
   ix654 : oai21 port map ( Y=>nx653, A0=>nx88, A1=>nx283, B0=>R(0));
   ix562 : oai21 port map ( Y=>nx561, A0=>nx658, A1=>nx799, B0=>nx660);
   p_Reg_loop1_0_fx_reg_q : dffr port map ( Q=>OPEN, QB=>nx658, D=>nx561, 
      CLK=>clk, R=>rst);
   ix661 : nand03 port map ( Y=>nx660, A0=>nx807, A1=>booth_output_0_EXMPLR, 
      A2=>nx799);
   ix357 : nor02_2x port map ( Y=>nx283, A0=>nx658, A1=>
      booth_output_0_EXMPLR);
   ix462 : oai21 port map ( Y=>nx461, A0=>nx666, A1=>nx799, B0=>nx668);
   p_Reg_loop1_10_fx_reg_q : dffr port map ( Q=>booth_output_9_EXMPLR, QB=>
      nx666, D=>nx461, CLK=>clk, R=>rst);
   ix669 : nand03 port map ( Y=>nx668, A0=>nx807, A1=>nx210, A2=>nx813);
   ix211 : xnor2 port map ( Y=>nx210, A0=>nx671, A1=>nx208);
   ix672 : aoi22 port map ( Y=>nx671, A0=>nx234, A1=>booth_output_9_EXMPLR, 
      B0=>nx273, B1=>nx236);
   ix225 : nand02 port map ( Y=>nx224, A0=>R(1), A1=>R(0));
   ix676 : or02 port map ( Y=>nx675, A0=>R(0), A1=>R(1));
   ix209 : xnor2 port map ( Y=>nx208, A0=>booth_output_10_EXMPLR, A1=>nx771
   );
   p_Reg_loop1_11_fx_reg_q : dffr port map ( Q=>booth_output_10_EXMPLR, QB=>
      OPEN, D=>nx451, CLK=>clk, R=>rst);
   ix682 : xnor2 port map ( Y=>nx681, A0=>nx683, A1=>nx690);
   ix684 : aoi22 port map ( Y=>nx683, A0=>nx206, A1=>booth_output_10_EXMPLR, 
      B0=>nx275, B1=>nx208);
   ix197 : oai21 port map ( Y=>nx196, A0=>R(0), A1=>R(1), B0=>R(2));
   ix442 : oai21 port map ( Y=>nx441, A0=>nx694, A1=>nx799, B0=>nx696);
   p_Reg_loop1_12_fx_reg_q : dffr port map ( Q=>booth_output_11_EXMPLR, QB=>
      nx694, D=>nx441, CLK=>clk, R=>rst);
   ix697 : nand03 port map ( Y=>nx696, A0=>nx807, A1=>nx158, A2=>nx813);
   ix159 : xnor2 port map ( Y=>nx158, A0=>nx279, A1=>nx713);
   ix381 : oai21 port map ( Y=>nx279, A0=>nx683, A1=>nx690, B0=>nx700);
   ix701 : nand02 port map ( Y=>nx700, A0=>nx180, A1=>booth_output_11_EXMPLR
   );
   ix181 : oai32 port map ( Y=>nx180, A0=>nx703, A1=>nx706, A2=>nx72, B0=>
      nx709, B1=>nx711);
   ix704 : nor02ii port map ( Y=>nx703, A0=>nx68, A1=>R(3));
   ix69 : nor03_2x port map ( Y=>nx68, A0=>R(2), A1=>R(0), A2=>R(1));
   ix707 : nand02 port map ( Y=>nx706, A0=>nx658, A1=>booth_output_0_EXMPLR
   );
   ix73 : nor04 port map ( Y=>nx72, A0=>R(3), A1=>R(2), A2=>R(0), A3=>R(1));
   ix710 : inv01 port map ( Y=>nx709, A=>R(3));
   ix714 : xnor2 port map ( Y=>nx713, A0=>booth_output_12_EXMPLR, A1=>nx154
   );
   p_Reg_loop1_13_fx_reg_q : dffr port map ( Q=>booth_output_12_EXMPLR, QB=>
      OPEN, D=>nx431, CLK=>clk, R=>rst);
   ix719 : xnor2 port map ( Y=>nx718, A0=>nx720, A1=>nx729);
   ix721 : aoi22 port map ( Y=>nx720, A0=>nx154, A1=>booth_output_12_EXMPLR, 
      B0=>nx279, B1=>nx156);
   ix155 : oai32 port map ( Y=>nx154, A0=>nx723, A1=>nx706, A2=>nx76, B0=>
      nx726, B1=>nx711);
   ix724 : nor02ii port map ( Y=>nx723, A0=>nx72, A1=>R(4));
   ix77 : nor02ii port map ( Y=>nx76, A0=>R(4), A1=>nx72);
   ix727 : inv01 port map ( Y=>nx726, A=>R(4));
   ix422 : oai21 port map ( Y=>nx421, A0=>nx733, A1=>nx799, B0=>nx735);
   p_Reg_loop1_14_fx_reg_q : dffr port map ( Q=>booth_output_13_EXMPLR, QB=>
      nx733, D=>nx421, CLK=>clk, R=>rst);
   ix736 : nand03 port map ( Y=>nx735, A0=>nx807, A1=>nx106, A2=>nx799);
   ix107 : xnor2 port map ( Y=>nx106, A0=>nx282, A1=>nx747);
   ix393 : oai21 port map ( Y=>nx282, A0=>nx720, A1=>nx729, B0=>nx739);
   ix740 : nand02 port map ( Y=>nx739, A0=>nx128, A1=>booth_output_13_EXMPLR
   );
   ix129 : oai32 port map ( Y=>nx128, A0=>nx742, A1=>nx706, A2=>nx80, B0=>
      nx745, B1=>nx711);
   ix743 : nor02ii port map ( Y=>nx742, A0=>nx76, A1=>R(5));
   ix81 : nor02ii port map ( Y=>nx80, A0=>R(5), A1=>nx76);
   ix746 : inv01 port map ( Y=>nx745, A=>R(5));
   ix748 : xnor2 port map ( Y=>nx747, A0=>booth_output_14_EXMPLR, A1=>nx102
   );
   p_Reg_loop1_15_fx_reg_q : dffr port map ( Q=>booth_output_14_EXMPLR, QB=>
      OPEN, D=>nx571, CLK=>clk, R=>rst);
   ix753 : xnor2 port map ( Y=>nx752, A0=>nx754, A1=>nx763);
   ix755 : aoi22 port map ( Y=>nx754, A0=>nx102, A1=>booth_output_14_EXMPLR, 
      B0=>nx282, B1=>nx104);
   ix103 : oai32 port map ( Y=>nx102, A0=>nx757, A1=>nx706, A2=>nx92, B0=>
      nx760, B1=>nx711);
   ix758 : nor02ii port map ( Y=>nx757, A0=>nx80, A1=>R(6));
   ix93 : nor02ii port map ( Y=>nx92, A0=>R(6), A1=>nx80);
   ix761 : inv01 port map ( Y=>nx760, A=>R(6));
   ix764 : xor2 port map ( Y=>nx763, A0=>booth_output_14_EXMPLR, A1=>nx765);
   ix766 : aoi22 port map ( Y=>nx765, A0=>R(7), A1=>nx283, B0=>nx88, B1=>
      nx400);
   ix401 : xnor2 port map ( Y=>nx400, A0=>R(7), A1=>nx92);
   ix772 : aoi32 port map ( Y=>nx771, A0=>nx196, A1=>nx88, A2=>nx687, B0=>
      R(2), B1=>nx283);
   ix774 : aoi32 port map ( Y=>nx773, A0=>nx224, A1=>nx88, A2=>nx675, B0=>
      R(1), B1=>nx283);
   ix236 : inv01 port map ( Y=>nx234, A=>nx773);
   ix207 : inv01 port map ( Y=>nx206, A=>nx771);
   ix157 : inv01 port map ( Y=>nx156, A=>nx713);
   ix105 : inv01 port map ( Y=>nx104, A=>nx747);
   ix712 : inv01 port map ( Y=>nx711, A=>nx283);
   ix89 : inv01 port map ( Y=>nx88, A=>nx706);
   ix688 : inv01 port map ( Y=>nx687, A=>nx68);
   ix369 : inv01 port map ( Y=>nx275, A=>nx671);
   ix788 : inv02 port map ( Y=>nx789, A=>nx813);
   ix794 : inv02 port map ( Y=>nx795, A=>nx649);
   ix798 : inv02 port map ( Y=>nx799, A=>shift_reg_output_5);
   ix800 : inv02 port map ( Y=>nx801, A=>shift_reg_output_5);
   ix552 : mux21_ni port map ( Y=>nx551, A0=>booth_output_0_EXMPLR, A1=>
      nx340, S0=>nx813);
   ix341 : mux21_ni port map ( Y=>nx340, A0=>M(0), A1=>booth_output_1_EXMPLR, 
      S0=>nx807);
   ix542 : mux21_ni port map ( Y=>nx541, A0=>booth_output_1_EXMPLR, A1=>
      nx328, S0=>nx813);
   ix329 : mux21_ni port map ( Y=>nx328, A0=>M(1), A1=>booth_output_2_EXMPLR, 
      S0=>nx807);
   ix532 : mux21_ni port map ( Y=>nx531, A0=>booth_output_2_EXMPLR, A1=>
      nx316, S0=>nx813);
   ix317 : mux21_ni port map ( Y=>nx316, A0=>M(2), A1=>booth_output_3_EXMPLR, 
      S0=>nx807);
   ix522 : mux21_ni port map ( Y=>nx521, A0=>booth_output_3_EXMPLR, A1=>
      nx304, S0=>nx813);
   ix305 : mux21_ni port map ( Y=>nx304, A0=>M(3), A1=>booth_output_4_EXMPLR, 
      S0=>nx809);
   ix512 : mux21_ni port map ( Y=>nx511, A0=>booth_output_4_EXMPLR, A1=>
      nx292, S0=>nx815);
   ix293 : mux21_ni port map ( Y=>nx292, A0=>M(4), A1=>booth_output_5_EXMPLR, 
      S0=>nx809);
   ix502 : mux21_ni port map ( Y=>nx501, A0=>booth_output_5_EXMPLR, A1=>
      nx280, S0=>nx815);
   ix281 : mux21_ni port map ( Y=>nx280, A0=>M(5), A1=>booth_output_6_EXMPLR, 
      S0=>nx809);
   ix492 : mux21_ni port map ( Y=>nx491, A0=>booth_output_6_EXMPLR, A1=>
      nx268, S0=>nx815);
   ix269 : mux21_ni port map ( Y=>nx268, A0=>M(6), A1=>booth_output_7_EXMPLR, 
      S0=>nx809);
   ix482 : mux21_ni port map ( Y=>nx481, A0=>booth_output_7_EXMPLR, A1=>
      nx256, S0=>nx815);
   ix257 : mux21_ni port map ( Y=>nx256, A0=>M(7), A1=>nx248, S0=>nx809);
   ix472 : mux21_ni port map ( Y=>nx471, A0=>booth_output_8_EXMPLR, A1=>
      nx242, S0=>nx815);
   ix243 : nor02ii port map ( Y=>nx242, A0=>nx650, A1=>nx809);
   ix312 : mux21_ni port map ( Y=>nx311, A0=>shift_Reg_count_0, A1=>nx795, 
      S0=>nx638);
   ix298 : and02 port map ( Y=>nx297, A0=>shift_reg_output_5, A1=>
      shift_Reg_count_0);
   ix412 : mux21_ni port map ( Y=>nx411, A0=>shift_Reg_count_5, A1=>nx789, 
      S0=>nx638);
   ix402 : mux21_ni port map ( Y=>nx401, A0=>shift_Reg_count_5, A1=>
      shift_Reg_output_4, S0=>nx815);
   ix392 : mux21_ni port map ( Y=>nx391, A0=>shift_Reg_count_4, A1=>
      shift_Reg_output_4, S0=>nx638);
   ix382 : mux21_ni port map ( Y=>nx381, A0=>shift_Reg_count_4, A1=>
      shift_Reg_output_3, S0=>nx815);
   ix372 : mux21_ni port map ( Y=>nx371, A0=>shift_Reg_count_3, A1=>
      shift_Reg_output_3, S0=>nx638);
   ix362 : mux21_ni port map ( Y=>nx361, A0=>shift_Reg_count_3, A1=>
      shift_Reg_output_2, S0=>nx801);
   ix352 : mux21_ni port map ( Y=>nx351, A0=>shift_Reg_count_2, A1=>
      shift_Reg_output_2, S0=>nx638);
   ix342 : mux21_ni port map ( Y=>nx341, A0=>shift_Reg_count_2, A1=>
      shift_Reg_output_1, S0=>nx801);
   ix332 : mux21_ni port map ( Y=>nx331, A0=>shift_Reg_count_1, A1=>
      shift_Reg_output_1, S0=>nx638);
   ix322 : mux21_ni port map ( Y=>nx321, A0=>shift_Reg_count_1, A1=>nx795, 
      S0=>nx801);
   ix292 : or02 port map ( Y=>nx291, A0=>shift_Reg_en, A1=>nx801);
   ix237 : xor2 port map ( Y=>nx236, A0=>nx666, A1=>nx773);
   ix452 : mux21_ni port map ( Y=>nx451, A0=>booth_output_10_EXMPLR, A1=>
      nx188, S0=>nx801);
   ix189 : nor02ii port map ( Y=>nx188, A0=>nx681, A1=>nx809);
   ix691 : xor2 port map ( Y=>nx690, A0=>nx694, A1=>nx180);
   ix432 : mux21_ni port map ( Y=>nx431, A0=>booth_output_12_EXMPLR, A1=>
      nx136, S0=>nx801);
   ix137 : nor02ii port map ( Y=>nx136, A0=>nx718, A1=>nx811);
   ix730 : xor2 port map ( Y=>nx729, A0=>nx733, A1=>nx128);
   ix572 : mux21_ni port map ( Y=>nx571, A0=>booth_output_14_EXMPLR, A1=>
      nx414, S0=>nx801);
   ix415 : nor02ii port map ( Y=>nx414, A0=>nx752, A1=>nx811);
   ix806 : inv02 port map ( Y=>nx807, A=>nx795);
   ix808 : inv02 port map ( Y=>nx809, A=>nx795);
   ix810 : inv02 port map ( Y=>nx811, A=>nx795);
   ix812 : inv02 port map ( Y=>nx813, A=>shift_reg_output_5);
   ix814 : inv02 port map ( Y=>nx815, A=>shift_reg_output_5);
end my_booth_integration ;



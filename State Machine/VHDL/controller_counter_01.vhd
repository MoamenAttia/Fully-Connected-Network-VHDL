
-- 
-- Definition of  controller
-- 
--      Tue Apr 16 00:30:59 2019
--      
--      LeonardoSpectrum Level 3, 2018a.2
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.adk_components.all;

entity controller is
   port (
      clk : IN std_logic ;
      clk_inv : IN std_logic ;
      rst : IN std_logic ;
      initiate : INOUT std_logic ;
      ready_signal : INOUT std_logic ;
      enable_mar_in : INOUT std_logic ;
      enable_mdr_in : INOUT std_logic ;
      enable_mdr_out : INOUT std_logic ;
      enable_write : INOUT std_logic ;
      mdr_data_out : INOUT std_logic_vector (255 DOWNTO 0) ;
      label_1_output : INOUT std_logic_vector (15 DOWNTO 0) ;
      label_2_output : INOUT std_logic_vector (15 DOWNTO 0) ;
      label_3_output : INOUT std_logic_vector (15 DOWNTO 0) ;
      label_4_output : INOUT std_logic_vector (15 DOWNTO 0) ;
      label_5_output : INOUT std_logic_vector (15 DOWNTO 0) ;
      label_6_output : INOUT std_logic_vector (15 DOWNTO 0) ;
      label_7_output : INOUT std_logic_vector (15 DOWNTO 0) ;
      label_8_output : INOUT std_logic_vector (15 DOWNTO 0) ;
      label_9_output : INOUT std_logic_vector (15 DOWNTO 0) ;
      label_10_output : INOUT std_logic_vector (15 DOWNTO 0) ;
      sel_dst : INOUT std_logic_vector (3 DOWNTO 0) ;
      enable_decoder_dst : INOUT std_logic ;
      decoder_out_dst : INOUT std_logic_vector (15 DOWNTO 0) ;
      state : INOUT std_logic_vector (2 DOWNTO 0) ;
      sub_state : INOUT std_logic_vector (2 DOWNTO 0)) ;
end controller ;

architecture a_controller of controller is
   signal nx10143, nx4, nx12, num_out_0, nx10144, nx10145, nx10146, nx18, 
      nx10147, nx10148, nx42, nx10149, nx10150, nx10151, nx48, nx60, nx64, 
      nx70, nx80, nx86, nx92, nx98, num_in_0, nx122, nx10152, nx156, nx10153, 
      nx160, nx166, alu_inp1_0, address_out_0, address_in_0, nx214, nx224, 
      nx230, nx236, nx252, nx276, num_out_1, num_in_1, nx292, alu_inp1_1, 
      address_out_1, address_in_1, nx10155, nx294, nx310, nx318, num_out_2, 
      num_in_2, alu_inp1_2, address_out_2, address_in_2, nx346, nx362, nx378, 
      num_out_3, num_in_3, nx394, alu_inp1_3, address_out_3, address_in_3, 
      nx10157, nx396, nx412, nx420, num_out_4, num_in_4, alu_inp1_4, 
      address_out_4, address_in_4, nx450, nx466, nx482, num_out_5, num_in_5, 
      nx498, alu_inp1_5, address_out_5, address_in_5, nx10159, nx500, nx516, 
      nx524, num_out_6, num_in_6, alu_inp1_6, address_out_6, address_in_6, 
      nx552, nx568, nx584, num_out_7, num_in_7, nx600, alu_inp1_7, 
      address_out_7, address_in_7, nx10161, nx602, nx618, nx658, nx702, 
      nx722, nx754, nx1412, nx1420, nx1428, nx1440, nx1452, nx1474, nx10168, 
      nx10178, nx10188, nx10198, nx10208, nx10218, nx10228, nx10238, nx10248, 
      nx10258, nx10268, nx10278, nx10288, nx10298, nx10308, nx10318, nx10328, 
      nx10338, nx10348, nx10358, nx10368, nx10378, nx10388, nx10398, nx10408, 
      nx10418, nx10428, nx10438, nx10448, nx10458, nx10468, nx10478, nx10488, 
      nx10498, nx10508, nx10518, nx10528, nx10538, nx10548, nx10558, nx10568, 
      nx10578, nx10588, nx10598, nx10608, nx10618, nx10628, nx10638, nx10648, 
      nx10658, nx10668, nx10678, nx10688, nx10698, nx10708, nx10718, nx10728, 
      nx10738, nx10748, nx10758, nx10768, nx10778, nx10788, nx10798, nx10808, 
      nx10818, nx10828, nx10838, nx10848, nx10858, nx10868, nx10878, nx10888, 
      nx10898, nx10908, nx10918, nx10928, nx10938, nx10948, nx10958, nx10968, 
      nx10978, nx10988, nx10998, nx11008, nx11018, nx11028, nx11038, nx11048, 
      nx11058, nx11068, nx11078, nx11088, nx11098, nx11108, nx11118, nx11128, 
      nx11138, nx11148, nx11158, nx11168, nx11178, nx11188, nx11198, nx11208, 
      nx11218, nx11228, nx11238, nx11248, nx11258, nx11268, nx11278, nx11288, 
      nx11298, nx11308, nx11318, nx11328, nx11338, nx11348, nx11358, nx11368, 
      nx11378, nx11388, nx11398, nx11408, nx11418, nx11428, nx11438, nx11448, 
      nx11458, nx11468, nx11478, nx11488, nx11498, nx11508, nx11518, nx11528, 
      nx11538, nx11548, nx11558, nx11568, nx11578, nx11588, nx11598, nx11608, 
      nx11618, nx11628, nx11638, nx11648, nx11658, nx11668, nx11678, nx11688, 
      nx11698, nx11708, nx11718, nx11728, nx11738, nx11748, nx11758, nx11768, 
      nx11778, nx11788, nx11798, nx11808, nx11818, nx11828, nx11838, nx11848, 
      nx11858, nx11868, nx11878, nx11888, nx11898, nx11908, nx11918, nx11928, 
      nx11938, nx11948, nx11958, nx11968, nx11978, nx11988, nx11998, nx12008, 
      nx12018, nx12028, nx12038, nx12048, nx12058, nx12068, nx12078, nx12088, 
      nx12098, nx12108, nx12118, nx12128, nx12138, nx12148, nx12158, nx12168, 
      nx12178, nx12188, nx12198, nx12208, nx12218, nx12228, nx12238, nx12248, 
      nx12258, nx12268, nx12278, nx12288, nx12298, nx12308, nx12319, nx12326, 
      nx12332, nx12337, nx12339, nx12357, nx12362, nx12364, nx12371, nx12373, 
      nx12376, nx12379, nx12384, nx12388, nx12391, nx12393, nx12395, nx12397, 
      nx12399, nx12405, nx12409, nx12418, nx12434, nx12438, nx12442, nx12445, 
      nx12450, nx12452, nx12460, nx12463, nx12465, nx12467, nx12475, nx12477, 
      nx12481, nx12483, nx12495, nx12497, nx12507, nx12520, nx12521, nx12534, 
      nx12539, nx12542, nx12554, nx12558, nx12561, nx12571, nx12584, nx12585, 
      nx12587, nx12599, nx12609, nx12622, nx12623, nx12636, nx12640, nx12642, 
      nx12648, nx12656, nx13142, nx13148, nx13151, nx13158, nx13167, nx13169, 
      nx13171, nx13173, nx13175, nx13177, nx13181, nx13227, nx13229, nx13231, 
      nx13233, nx13235, nx13237, nx13239, nx13241, nx13243, nx13247, nx13249, 
      nx13251, nx13253, nx13255, nx13257, nx13259, nx13261, nx13263, nx13265, 
      nx13271, nx13273, nx13275, nx13277, nx13279, nx13281, nx13283, nx13285, 
      nx13287, nx13289, nx13291, nx13293, nx13295, nx13297, nx13299, nx13301, 
      nx13303, nx13305, nx13307, nx13309, nx13311, nx13313, nx13315, nx13317, 
      nx13319, nx13321, nx13323, nx13325, nx13327, nx13329, nx13331, nx13333, 
      nx13335, nx13337, nx13339, nx13341, nx13347, nx13349, nx13351, nx13353, 
      nx13355: std_logic ;
signal address_out : std_logic_vector(7 downto 0);

begin
   enable_write <= initiate ;
   sel_dst(2) <= sel_dst(3) ;
   sel_dst(1) <= sel_dst(3) ;
   sel_dst(0) <= sel_dst(3) ;
   enable_decoder_dst <= sel_dst(3) ;
   decoder_out_dst(15) <= sel_dst(3) ;
   decoder_out_dst(14) <= sel_dst(3) ;
   decoder_out_dst(13) <= sel_dst(3) ;
   decoder_out_dst(12) <= sel_dst(3) ;
   decoder_out_dst(11) <= sel_dst(3) ;
   decoder_out_dst(10) <= sel_dst(3) ;
   decoder_out_dst(9) <= sel_dst(3) ;
   decoder_out_dst(8) <= sel_dst(3) ;
   decoder_out_dst(7) <= sel_dst(3) ;
   decoder_out_dst(6) <= sel_dst(3) ;
   decoder_out_dst(5) <= sel_dst(3) ;
   decoder_out_dst(4) <= sel_dst(3) ;
   decoder_out_dst(3) <= sel_dst(3) ;
   decoder_out_dst(2) <= sel_dst(3) ;
   decoder_out_dst(1) <= sel_dst(3) ;
   decoder_out_dst(0) <= sel_dst(3) ;
   ix9809 : fake_gnd port map ( Y=>initiate);
   reg_enable_decoder_dst : dffr port map ( Q=>sel_dst(3), QB=>OPEN, D=>
      nx10678, CLK=>clk, R=>rst);
   ix10679 : mux21_ni port map ( Y=>nx10678, A0=>nx13181, A1=>nx64, S0=>
      nx754);
   ix10669 : mux21_ni port map ( Y=>nx10668, A0=>state(0), A1=>nx722, S0=>
      nx10143);
   ix723 : oai321 port map ( Y=>nx722, A0=>nx10145, A1=>nx92, A2=>nx12640, 
      B0=>nx13175, B1=>nx12319, C0=>nx12642);
   ix651 : nand02 port map ( Y=>nx10147, A0=>nx12326, A1=>nx12399);
   ix12327 : nor04 port map ( Y=>nx12326, A0=>num_out_7, A1=>num_out_6, A2=>
      num_out_5, A3=>num_out_4);
   num_loop1_7_fx_reg_q : dffr port map ( Q=>num_out_7, QB=>OPEN, D=>nx10638, 
      CLK=>clk, R=>rst);
   ix10629 : mux21 port map ( Y=>nx10628, A0=>nx12332, A1=>nx12636, S0=>
      nx13257);
   ix12333 : aoi22 port map ( Y=>nx12332, A0=>mdr_data_out(7), A1=>nx13231, 
      B0=>nx10161, B1=>nx13229);
   ix10659 : oai21 port map ( Y=>nx10658, A0=>nx12337, A1=>nx10147, B0=>
      nx13283);
   ix10649 : mux21_ni port map ( Y=>nx10648, A0=>nx13171, A1=>nx658, S0=>
      nx10143);
   reg_state_1 : dffr port map ( Q=>state(1), QB=>nx12339, D=>nx10648, CLK=>
      clk, R=>rst);
   ix659 : ao221 port map ( Y=>nx658, A0=>nx13175, A1=>nx10150, B0=>nx12, B1
      =>nx10147, C0=>nx13227);
   ix10189 : mux21_ni port map ( Y=>nx10188, A0=>nx13175, A1=>nx70, S0=>nx42
   );
   ix71 : nor03_2x port map ( Y=>nx70, A0=>nx13167, A1=>nx13171, A2=>nx60);
   ix61 : nand03 port map ( Y=>nx60, A0=>sub_state(1), A1=>nx12376, A2=>
      sub_state(0));
   reg_sub_state_1 : dffr port map ( Q=>sub_state(1), QB=>OPEN, D=>nx10198, 
      CLK=>clk, R=>rst);
   ix10199 : mux21_ni port map ( Y=>nx10198, A0=>sub_state(1), A1=>nx98, S0
      =>nx42);
   ix99 : aoi221 port map ( Y=>nx98, A0=>state(0), A1=>nx13171, B0=>nx86, B1
      =>nx80, C0=>nx13167);
   reg_sub_state_0 : dffr port map ( Q=>sub_state(0), QB=>nx12371, D=>
      nx10178, CLK=>clk, R=>rst);
   ix10179 : mux21_ni port map ( Y=>nx10178, A0=>sub_state(0), A1=>nx48, S0
      =>nx42);
   ix49 : oai21 port map ( Y=>nx48, A0=>nx12357, A1=>nx10151, B0=>nx12362);
   ix12363 : nand02 port map ( Y=>nx12362, A0=>nx12364, A1=>nx13227);
   ix12365 : nor03_2x port map ( Y=>nx12364, A0=>sub_state(0), A1=>nx13175, 
      A2=>sub_state(1));
   reg_state_2 : dffr port map ( Q=>state(2), QB=>OPEN, D=>nx10658, CLK=>clk, 
      R=>rst);
   ix81 : nand02 port map ( Y=>nx80, A0=>nx12373, A1=>sub_state(1));
   reg_sub_state_2 : dffr port map ( Q=>sub_state(2), QB=>nx12376, D=>
      nx10188, CLK=>clk, R=>rst);
   reg_state_0 : dffr port map ( Q=>state(0), QB=>nx12379, D=>nx10668, CLK=>
      clk, R=>rst);
   ix629 : xnor2 port map ( Y=>nx10161, A0=>nx600, A1=>nx12623);
   ix601 : oai22 port map ( Y=>nx600, A0=>nx12384, A1=>nx12599, B0=>nx13299, 
      B1=>nx12622);
   ix12385 : aoi22 port map ( Y=>nx12384, A0=>nx13235, A1=>alu_inp1_5, B0=>
      nx498, B1=>nx524);
   ix12389 : nand03 port map ( Y=>nx12388, A0=>nx156, A1=>nx12445, A2=>
      nx12542);
   ix157 : aoi22 port map ( Y=>nx156, A0=>nx80, A1=>nx10152, B0=>nx12, B1=>
      nx12391);
   ix12392 : nand02 port map ( Y=>nx12391, A0=>nx12393, A1=>nx12395);
   ix12394 : nor03_2x port map ( Y=>nx12393, A0=>sub_state(1), A1=>nx13175, 
      A2=>nx12371);
   ix12396 : oai21 port map ( Y=>nx12395, A0=>nx12397, A1=>ready_signal, B0
      =>nx12);
   ix12400 : nor04 port map ( Y=>nx12399, A0=>num_out_3, A1=>num_out_2, A2=>
      num_out_1, A3=>num_out_0);
   num_loop1_3_fx_reg_q : dffr port map ( Q=>num_out_3, QB=>OPEN, D=>nx10438, 
      CLK=>clk, R=>rst);
   ix10429 : mux21 port map ( Y=>nx10428, A0=>nx12405, A1=>nx12534, S0=>
      nx13255);
   ix12406 : aoi22 port map ( Y=>nx12405, A0=>mdr_data_out(3), A1=>nx13231, 
      B0=>nx10157, B1=>nx13227);
   ix423 : xnor2 port map ( Y=>nx10157, A0=>nx394, A1=>nx12521);
   ix395 : oai22 port map ( Y=>nx394, A0=>nx12409, A1=>nx12497, B0=>nx13299, 
      B1=>nx12520);
   ix12410 : aoi22 port map ( Y=>nx12409, A0=>nx13235, A1=>alu_inp1_1, B0=>
      nx292, B1=>nx318);
   reg_alu_inp1_1 : dff port map ( Q=>alu_inp1_1, QB=>OPEN, D=>nx10318, CLK
      =>clk);
   ix10319 : mux21_ni port map ( Y=>nx10318, A0=>nx310, A1=>alu_inp1_1, S0=>
      nx13241);
   num_loop1_1_fx_reg_q : dffr port map ( Q=>num_out_1, QB=>OPEN, D=>nx10338, 
      CLK=>clk, R=>rst);
   ix10329 : mux21 port map ( Y=>nx10328, A0=>nx12418, A1=>nx12483, S0=>
      nx13255);
   ix12419 : aoi22 port map ( Y=>nx12418, A0=>mdr_data_out(1), A1=>nx13231, 
      B0=>nx10155, B1=>nx13227);
   ix321 : xnor2 port map ( Y=>nx10155, A0=>nx292, A1=>nx12481);
   reg_alu_inp1_0 : dff port map ( Q=>alu_inp1_0, QB=>OPEN, D=>nx10258, CLK
      =>clk);
   ix10259 : mux21_ni port map ( Y=>nx10258, A0=>nx252, A1=>alu_inp1_0, S0=>
      nx13241);
   num_loop1_0_fx_reg_q : dffr port map ( Q=>num_out_0, QB=>OPEN, D=>nx10288, 
      CLK=>clk, R=>rst);
   reg_num_in_0 : dff port map ( Q=>num_in_0, QB=>OPEN, D=>nx10278, CLK=>clk
   );
   ix10279 : mux21_ni port map ( Y=>nx10278, A0=>nx276, A1=>num_in_0, S0=>
      nx13255);
   ix10269 : nand02 port map ( Y=>nx10268, A0=>nx12438, A1=>nx13241);
   reg_alu_inp2_0 : dff port map ( Q=>OPEN, QB=>nx12438, D=>nx10268, CLK=>
      clk);
   ix12443 : nand03 port map ( Y=>nx12442, A0=>nx122, A1=>nx12445, A2=>
      nx12362);
   ix12446 : inv01 port map ( Y=>nx12445, A=>rst);
   ix10209 : nand02 port map ( Y=>nx10208, A0=>nx13287, A1=>nx12452);
   reg_enable_num : dffr port map ( Q=>OPEN, QB=>nx12450, D=>nx10208, CLK=>
      clk, R=>rst);
   ix12453 : nand02 port map ( Y=>nx12452, A0=>nx13231, A1=>nx12364);
   address_loop1_0_fx_reg_q : dffr port map ( Q=>address_out_0, QB=>OPEN, D
      =>nx10248, CLK=>clk, R=>rst);
   reg_address_in_0 : dffr port map ( Q=>address_in_0, QB=>OPEN, D=>nx10238, 
      CLK=>clk, R=>rst);
   ix10239 : mux21_ni port map ( Y=>nx10238, A0=>address_in_0, A1=>nx236, S0
      =>nx13303);
   ix237 : nor02_2x port map ( Y=>nx236, A0=>nx12434, A1=>nx13291);
   ix12464 : aoi32 port map ( Y=>nx12463, A0=>nx12395, A1=>nx12465, A2=>
      nx12467, B0=>nx214, B1=>nx224);
   ix215 : oai21 port map ( Y=>nx214, A0=>nx80, A1=>nx10145, B0=>nx12);
   ix225 : oai21 port map ( Y=>nx224, A0=>nx10150, A1=>nx10146, B0=>nx60);
   ix10229 : nand02 port map ( Y=>nx10228, A0=>nx13295, A1=>nx12477);
   reg_enable_address : dff port map ( Q=>OPEN, QB=>nx12475, D=>nx10228, CLK
      =>clk);
   ix12478 : nand03 port map ( Y=>nx12477, A0=>nx12393, A1=>nx12445, A2=>
      nx13231);
   reg_num_in_1 : dff port map ( Q=>num_in_1, QB=>nx12483, D=>nx10328, CLK=>
      clk);
   address_loop1_1_fx_reg_q : dffr port map ( Q=>address_out_1, QB=>OPEN, D
      =>nx10308, CLK=>clk, R=>rst);
   reg_address_in_1 : dffr port map ( Q=>address_in_1, QB=>OPEN, D=>nx10298, 
      CLK=>clk, R=>rst);
   ix10299 : mux21_ni port map ( Y=>nx10298, A0=>address_in_1, A1=>nx294, S0
      =>nx13303);
   ix295 : nor02ii port map ( Y=>nx294, A0=>nx13291, A1=>nx10155);
   reg_alu_sel : dff port map ( Q=>OPEN, QB=>nx12495, D=>nx10218, CLK=>clk);
   reg_alu_inp1_2 : dff port map ( Q=>alu_inp1_2, QB=>nx12520, D=>nx10368, 
      CLK=>clk);
   ix10369 : mux21_ni port map ( Y=>nx10368, A0=>nx362, A1=>alu_inp1_2, S0=>
      nx13241);
   num_loop1_2_fx_reg_q : dffr port map ( Q=>num_out_2, QB=>OPEN, D=>nx10388, 
      CLK=>clk, R=>rst);
   reg_num_in_2 : dff port map ( Q=>num_in_2, QB=>OPEN, D=>nx10378, CLK=>clk
   );
   ix10379 : mux21_ni port map ( Y=>nx10378, A0=>nx378, A1=>num_in_2, S0=>
      nx13255);
   ix12508 : xnor2 port map ( Y=>nx12507, A0=>nx12409, A1=>nx12497);
   address_loop1_2_fx_reg_q : dffr port map ( Q=>address_out_2, QB=>OPEN, D
      =>nx10358, CLK=>clk, R=>rst);
   reg_address_in_2 : dffr port map ( Q=>address_in_2, QB=>OPEN, D=>nx10348, 
      CLK=>clk, R=>rst);
   ix10349 : mux21_ni port map ( Y=>nx10348, A0=>address_in_2, A1=>nx346, S0
      =>nx13303);
   ix347 : nor02_2x port map ( Y=>nx346, A0=>nx12507, A1=>nx13291);
   reg_alu_inp1_3 : dff port map ( Q=>alu_inp1_3, QB=>OPEN, D=>nx10418, CLK
      =>clk);
   ix10419 : mux21_ni port map ( Y=>nx10418, A0=>nx412, A1=>alu_inp1_3, S0=>
      nx13241);
   address_loop1_3_fx_reg_q : dffr port map ( Q=>address_out_3, QB=>OPEN, D
      =>nx10408, CLK=>clk, R=>rst);
   reg_address_in_3 : dffr port map ( Q=>address_in_3, QB=>OPEN, D=>nx10398, 
      CLK=>clk, R=>rst);
   ix10399 : mux21_ni port map ( Y=>nx10398, A0=>address_in_3, A1=>nx396, S0
      =>nx13303);
   ix397 : nor02ii port map ( Y=>nx396, A0=>nx13291, A1=>nx10157);
   reg_num_in_3 : dff port map ( Q=>num_in_3, QB=>nx12534, D=>nx10428, CLK=>
      clk);
   reg_ready_signal : dffr port map ( Q=>ready_signal, QB=>OPEN, D=>nx10168, 
      CLK=>clk, R=>rst);
   ix10169 : mux21_ni port map ( Y=>nx10168, A0=>nx13227, A1=>ready_signal, 
      S0=>nx12539);
   ix12540 : nand04 port map ( Y=>nx12539, A0=>nx13283, A1=>nx13173, A2=>
      nx12395, A3=>nx12362);
   ix12543 : aoi21 port map ( Y=>nx12542, A0=>nx12362, A1=>nx160, B0=>
      nx10153);
   ix161 : nand02 port map ( Y=>nx160, A0=>nx10148, A1=>nx13249);
   ix695 : aoi21 port map ( Y=>nx10148, A0=>state(0), A1=>nx13173, B0=>
      nx13169);
   reg_alu_inp1_5 : dff port map ( Q=>alu_inp1_5, QB=>OPEN, D=>nx10518, CLK
      =>clk);
   ix10519 : mux21_ni port map ( Y=>nx10518, A0=>nx516, A1=>alu_inp1_5, S0=>
      nx13243);
   num_loop1_5_fx_reg_q : dffr port map ( Q=>num_out_5, QB=>OPEN, D=>nx10538, 
      CLK=>clk, R=>rst);
   ix10529 : mux21 port map ( Y=>nx10528, A0=>nx12554, A1=>nx12587, S0=>
      nx13255);
   ix12555 : aoi22 port map ( Y=>nx12554, A0=>mdr_data_out(5), A1=>nx13233, 
      B0=>nx10159, B1=>nx13229);
   ix527 : xnor2 port map ( Y=>nx10159, A0=>nx498, A1=>nx12585);
   ix499 : oai22 port map ( Y=>nx498, A0=>nx12558, A1=>nx12561, B0=>nx13299, 
      B1=>nx12584);
   ix12559 : aoi22 port map ( Y=>nx12558, A0=>nx13237, A1=>alu_inp1_3, B0=>
      nx394, B1=>nx420);
   reg_alu_inp1_4 : dff port map ( Q=>alu_inp1_4, QB=>nx12584, D=>nx10468, 
      CLK=>clk);
   ix10469 : mux21_ni port map ( Y=>nx10468, A0=>nx466, A1=>alu_inp1_4, S0=>
      nx13241);
   num_loop1_4_fx_reg_q : dffr port map ( Q=>num_out_4, QB=>OPEN, D=>nx10488, 
      CLK=>clk, R=>rst);
   reg_num_in_4 : dff port map ( Q=>num_in_4, QB=>OPEN, D=>nx10478, CLK=>clk
   );
   ix10479 : mux21_ni port map ( Y=>nx10478, A0=>nx482, A1=>num_in_4, S0=>
      nx13255);
   ix12572 : xnor2 port map ( Y=>nx12571, A0=>nx12558, A1=>nx12561);
   address_loop1_4_fx_reg_q : dffr port map ( Q=>address_out_4, QB=>OPEN, D
      =>nx10458, CLK=>clk, R=>rst);
   reg_address_in_4 : dffr port map ( Q=>address_in_4, QB=>OPEN, D=>nx10448, 
      CLK=>clk, R=>rst);
   ix10449 : mux21_ni port map ( Y=>nx10448, A0=>address_in_4, A1=>nx450, S0
      =>nx13303);
   ix451 : nor02_2x port map ( Y=>nx450, A0=>nx12571, A1=>nx13291);
   reg_num_in_5 : dff port map ( Q=>num_in_5, QB=>nx12587, D=>nx10528, CLK=>
      clk);
   address_loop1_5_fx_reg_q : dffr port map ( Q=>address_out_5, QB=>OPEN, D
      =>nx10508, CLK=>clk, R=>rst);
   reg_address_in_5 : dffr port map ( Q=>address_in_5, QB=>OPEN, D=>nx10498, 
      CLK=>clk, R=>rst);
   ix10499 : mux21_ni port map ( Y=>nx10498, A0=>address_in_5, A1=>nx500, S0
      =>nx13303);
   ix501 : nor02ii port map ( Y=>nx500, A0=>nx13291, A1=>nx10159);
   reg_alu_inp1_6 : dff port map ( Q=>alu_inp1_6, QB=>nx12622, D=>nx10568, 
      CLK=>clk);
   ix10569 : mux21_ni port map ( Y=>nx10568, A0=>nx568, A1=>alu_inp1_6, S0=>
      nx13243);
   num_loop1_6_fx_reg_q : dffr port map ( Q=>num_out_6, QB=>OPEN, D=>nx10588, 
      CLK=>clk, R=>rst);
   reg_num_in_6 : dff port map ( Q=>num_in_6, QB=>OPEN, D=>nx10578, CLK=>clk
   );
   ix10579 : mux21_ni port map ( Y=>nx10578, A0=>nx584, A1=>num_in_6, S0=>
      nx13255);
   ix12610 : xnor2 port map ( Y=>nx12609, A0=>nx12384, A1=>nx12599);
   address_loop1_6_fx_reg_q : dffr port map ( Q=>address_out_6, QB=>OPEN, D
      =>nx10558, CLK=>clk, R=>rst);
   reg_address_in_6 : dffr port map ( Q=>address_in_6, QB=>OPEN, D=>nx10548, 
      CLK=>clk, R=>rst);
   ix10549 : mux21_ni port map ( Y=>nx10548, A0=>address_in_6, A1=>nx552, S0
      =>nx230);
   ix553 : nor02_2x port map ( Y=>nx552, A0=>nx12609, A1=>nx13291);
   reg_alu_inp1_7 : dff port map ( Q=>alu_inp1_7, QB=>OPEN, D=>nx10618, CLK
      =>clk);
   ix10619 : mux21_ni port map ( Y=>nx10618, A0=>nx618, A1=>alu_inp1_7, S0=>
      nx13243);
   address_loop1_7_fx_reg_q : dffr port map ( Q=>address_out_7, QB=>OPEN, D
      =>nx10608, CLK=>clk, R=>rst);
   reg_address_in_7 : dffr port map ( Q=>address_in_7, QB=>OPEN, D=>nx10598, 
      CLK=>clk, R=>rst);
   ix10599 : mux21_ni port map ( Y=>nx10598, A0=>address_in_7, A1=>nx602, S0
      =>nx230);
   ix603 : nor02ii port map ( Y=>nx602, A0=>nx13293, A1=>nx10161);
   reg_num_in_7 : dff port map ( Q=>num_in_7, QB=>nx12636, D=>nx10628, CLK=>
      clk);
   ix12643 : aoi21 port map ( Y=>nx12642, A0=>nx13177, A1=>nx13233, B0=>nx18
   );
   ix755 : nor04 port map ( Y=>nx754, A0=>nx10149, A1=>nx166, A2=>nx702, A3
      =>nx12656);
   ix703 : oai21 port map ( Y=>nx702, A0=>nx12337, A1=>nx12364, B0=>nx12395
   );
   labelsregfile_label10_loop1_0_fx_reg_q : dffr port map ( Q=>
      label_10_output(0), QB=>OPEN, D=>nx10838, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_1_fx_reg_q : dffr port map ( Q=>
      label_10_output(1), QB=>OPEN, D=>nx10828, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_2_fx_reg_q : dffr port map ( Q=>
      label_10_output(2), QB=>OPEN, D=>nx10818, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_3_fx_reg_q : dffr port map ( Q=>
      label_10_output(3), QB=>OPEN, D=>nx10808, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_4_fx_reg_q : dffr port map ( Q=>
      label_10_output(4), QB=>OPEN, D=>nx10798, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_5_fx_reg_q : dffr port map ( Q=>
      label_10_output(5), QB=>OPEN, D=>nx10788, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_6_fx_reg_q : dffr port map ( Q=>
      label_10_output(6), QB=>OPEN, D=>nx10778, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_7_fx_reg_q : dffr port map ( Q=>
      label_10_output(7), QB=>OPEN, D=>nx10768, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_8_fx_reg_q : dffr port map ( Q=>
      label_10_output(8), QB=>OPEN, D=>nx10758, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_9_fx_reg_q : dffr port map ( Q=>
      label_10_output(9), QB=>OPEN, D=>nx10748, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_10_fx_reg_q : dffr port map ( Q=>
      label_10_output(10), QB=>OPEN, D=>nx10738, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_11_fx_reg_q : dffr port map ( Q=>
      label_10_output(11), QB=>OPEN, D=>nx10728, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_12_fx_reg_q : dffr port map ( Q=>
      label_10_output(12), QB=>OPEN, D=>nx10718, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_13_fx_reg_q : dffr port map ( Q=>
      label_10_output(13), QB=>OPEN, D=>nx10708, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_14_fx_reg_q : dffr port map ( Q=>
      label_10_output(14), QB=>OPEN, D=>nx10698, CLK=>clk, R=>rst);
   labelsregfile_label10_loop1_15_fx_reg_q : dffr port map ( Q=>
      label_10_output(15), QB=>OPEN, D=>nx10688, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_0_fx_reg_q : dffr port map ( Q=>
      label_9_output(0), QB=>OPEN, D=>nx10998, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_1_fx_reg_q : dffr port map ( Q=>
      label_9_output(1), QB=>OPEN, D=>nx10988, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_2_fx_reg_q : dffr port map ( Q=>
      label_9_output(2), QB=>OPEN, D=>nx10978, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_3_fx_reg_q : dffr port map ( Q=>
      label_9_output(3), QB=>OPEN, D=>nx10968, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_4_fx_reg_q : dffr port map ( Q=>
      label_9_output(4), QB=>OPEN, D=>nx10958, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_5_fx_reg_q : dffr port map ( Q=>
      label_9_output(5), QB=>OPEN, D=>nx10948, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_6_fx_reg_q : dffr port map ( Q=>
      label_9_output(6), QB=>OPEN, D=>nx10938, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_7_fx_reg_q : dffr port map ( Q=>
      label_9_output(7), QB=>OPEN, D=>nx10928, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_8_fx_reg_q : dffr port map ( Q=>
      label_9_output(8), QB=>OPEN, D=>nx10918, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_9_fx_reg_q : dffr port map ( Q=>
      label_9_output(9), QB=>OPEN, D=>nx10908, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_10_fx_reg_q : dffr port map ( Q=>
      label_9_output(10), QB=>OPEN, D=>nx10898, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_11_fx_reg_q : dffr port map ( Q=>
      label_9_output(11), QB=>OPEN, D=>nx10888, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_12_fx_reg_q : dffr port map ( Q=>
      label_9_output(12), QB=>OPEN, D=>nx10878, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_13_fx_reg_q : dffr port map ( Q=>
      label_9_output(13), QB=>OPEN, D=>nx10868, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_14_fx_reg_q : dffr port map ( Q=>
      label_9_output(14), QB=>OPEN, D=>nx10858, CLK=>clk, R=>rst);
   labelsregfile_label9_loop1_15_fx_reg_q : dffr port map ( Q=>
      label_9_output(15), QB=>OPEN, D=>nx10848, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_0_fx_reg_q : dffr port map ( Q=>
      label_8_output(0), QB=>OPEN, D=>nx11158, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_1_fx_reg_q : dffr port map ( Q=>
      label_8_output(1), QB=>OPEN, D=>nx11148, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_2_fx_reg_q : dffr port map ( Q=>
      label_8_output(2), QB=>OPEN, D=>nx11138, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_3_fx_reg_q : dffr port map ( Q=>
      label_8_output(3), QB=>OPEN, D=>nx11128, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_4_fx_reg_q : dffr port map ( Q=>
      label_8_output(4), QB=>OPEN, D=>nx11118, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_5_fx_reg_q : dffr port map ( Q=>
      label_8_output(5), QB=>OPEN, D=>nx11108, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_6_fx_reg_q : dffr port map ( Q=>
      label_8_output(6), QB=>OPEN, D=>nx11098, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_7_fx_reg_q : dffr port map ( Q=>
      label_8_output(7), QB=>OPEN, D=>nx11088, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_8_fx_reg_q : dffr port map ( Q=>
      label_8_output(8), QB=>OPEN, D=>nx11078, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_9_fx_reg_q : dffr port map ( Q=>
      label_8_output(9), QB=>OPEN, D=>nx11068, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_10_fx_reg_q : dffr port map ( Q=>
      label_8_output(10), QB=>OPEN, D=>nx11058, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_11_fx_reg_q : dffr port map ( Q=>
      label_8_output(11), QB=>OPEN, D=>nx11048, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_12_fx_reg_q : dffr port map ( Q=>
      label_8_output(12), QB=>OPEN, D=>nx11038, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_13_fx_reg_q : dffr port map ( Q=>
      label_8_output(13), QB=>OPEN, D=>nx11028, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_14_fx_reg_q : dffr port map ( Q=>
      label_8_output(14), QB=>OPEN, D=>nx11018, CLK=>clk, R=>rst);
   labelsregfile_label8_loop1_15_fx_reg_q : dffr port map ( Q=>
      label_8_output(15), QB=>OPEN, D=>nx11008, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_0_fx_reg_q : dffr port map ( Q=>
      label_7_output(0), QB=>OPEN, D=>nx11318, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_1_fx_reg_q : dffr port map ( Q=>
      label_7_output(1), QB=>OPEN, D=>nx11308, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_2_fx_reg_q : dffr port map ( Q=>
      label_7_output(2), QB=>OPEN, D=>nx11298, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_3_fx_reg_q : dffr port map ( Q=>
      label_7_output(3), QB=>OPEN, D=>nx11288, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_4_fx_reg_q : dffr port map ( Q=>
      label_7_output(4), QB=>OPEN, D=>nx11278, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_5_fx_reg_q : dffr port map ( Q=>
      label_7_output(5), QB=>OPEN, D=>nx11268, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_6_fx_reg_q : dffr port map ( Q=>
      label_7_output(6), QB=>OPEN, D=>nx11258, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_7_fx_reg_q : dffr port map ( Q=>
      label_7_output(7), QB=>OPEN, D=>nx11248, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_8_fx_reg_q : dffr port map ( Q=>
      label_7_output(8), QB=>OPEN, D=>nx11238, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_9_fx_reg_q : dffr port map ( Q=>
      label_7_output(9), QB=>OPEN, D=>nx11228, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_10_fx_reg_q : dffr port map ( Q=>
      label_7_output(10), QB=>OPEN, D=>nx11218, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_11_fx_reg_q : dffr port map ( Q=>
      label_7_output(11), QB=>OPEN, D=>nx11208, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_12_fx_reg_q : dffr port map ( Q=>
      label_7_output(12), QB=>OPEN, D=>nx11198, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_13_fx_reg_q : dffr port map ( Q=>
      label_7_output(13), QB=>OPEN, D=>nx11188, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_14_fx_reg_q : dffr port map ( Q=>
      label_7_output(14), QB=>OPEN, D=>nx11178, CLK=>clk, R=>rst);
   labelsregfile_label7_loop1_15_fx_reg_q : dffr port map ( Q=>
      label_7_output(15), QB=>OPEN, D=>nx11168, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_0_fx_reg_q : dffr port map ( Q=>
      label_6_output(0), QB=>OPEN, D=>nx11478, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_1_fx_reg_q : dffr port map ( Q=>
      label_6_output(1), QB=>OPEN, D=>nx11468, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_2_fx_reg_q : dffr port map ( Q=>
      label_6_output(2), QB=>OPEN, D=>nx11458, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_3_fx_reg_q : dffr port map ( Q=>
      label_6_output(3), QB=>OPEN, D=>nx11448, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_4_fx_reg_q : dffr port map ( Q=>
      label_6_output(4), QB=>OPEN, D=>nx11438, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_5_fx_reg_q : dffr port map ( Q=>
      label_6_output(5), QB=>OPEN, D=>nx11428, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_6_fx_reg_q : dffr port map ( Q=>
      label_6_output(6), QB=>OPEN, D=>nx11418, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_7_fx_reg_q : dffr port map ( Q=>
      label_6_output(7), QB=>OPEN, D=>nx11408, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_8_fx_reg_q : dffr port map ( Q=>
      label_6_output(8), QB=>OPEN, D=>nx11398, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_9_fx_reg_q : dffr port map ( Q=>
      label_6_output(9), QB=>OPEN, D=>nx11388, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_10_fx_reg_q : dffr port map ( Q=>
      label_6_output(10), QB=>OPEN, D=>nx11378, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_11_fx_reg_q : dffr port map ( Q=>
      label_6_output(11), QB=>OPEN, D=>nx11368, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_12_fx_reg_q : dffr port map ( Q=>
      label_6_output(12), QB=>OPEN, D=>nx11358, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_13_fx_reg_q : dffr port map ( Q=>
      label_6_output(13), QB=>OPEN, D=>nx11348, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_14_fx_reg_q : dffr port map ( Q=>
      label_6_output(14), QB=>OPEN, D=>nx11338, CLK=>clk, R=>rst);
   labelsregfile_label6_loop1_15_fx_reg_q : dffr port map ( Q=>
      label_6_output(15), QB=>OPEN, D=>nx11328, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_0_fx_reg_q : dffr port map ( Q=>
      label_5_output(0), QB=>OPEN, D=>nx11638, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_1_fx_reg_q : dffr port map ( Q=>
      label_5_output(1), QB=>OPEN, D=>nx11628, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_2_fx_reg_q : dffr port map ( Q=>
      label_5_output(2), QB=>OPEN, D=>nx11618, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_3_fx_reg_q : dffr port map ( Q=>
      label_5_output(3), QB=>OPEN, D=>nx11608, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_4_fx_reg_q : dffr port map ( Q=>
      label_5_output(4), QB=>OPEN, D=>nx11598, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_5_fx_reg_q : dffr port map ( Q=>
      label_5_output(5), QB=>OPEN, D=>nx11588, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_6_fx_reg_q : dffr port map ( Q=>
      label_5_output(6), QB=>OPEN, D=>nx11578, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_7_fx_reg_q : dffr port map ( Q=>
      label_5_output(7), QB=>OPEN, D=>nx11568, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_8_fx_reg_q : dffr port map ( Q=>
      label_5_output(8), QB=>OPEN, D=>nx11558, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_9_fx_reg_q : dffr port map ( Q=>
      label_5_output(9), QB=>OPEN, D=>nx11548, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_10_fx_reg_q : dffr port map ( Q=>
      label_5_output(10), QB=>OPEN, D=>nx11538, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_11_fx_reg_q : dffr port map ( Q=>
      label_5_output(11), QB=>OPEN, D=>nx11528, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_12_fx_reg_q : dffr port map ( Q=>
      label_5_output(12), QB=>OPEN, D=>nx11518, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_13_fx_reg_q : dffr port map ( Q=>
      label_5_output(13), QB=>OPEN, D=>nx11508, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_14_fx_reg_q : dffr port map ( Q=>
      label_5_output(14), QB=>OPEN, D=>nx11498, CLK=>clk, R=>rst);
   labelsregfile_label5_loop1_15_fx_reg_q : dffr port map ( Q=>
      label_5_output(15), QB=>OPEN, D=>nx11488, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_0_fx_reg_q : dffr port map ( Q=>
      label_4_output(0), QB=>OPEN, D=>nx11798, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_1_fx_reg_q : dffr port map ( Q=>
      label_4_output(1), QB=>OPEN, D=>nx11788, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_2_fx_reg_q : dffr port map ( Q=>
      label_4_output(2), QB=>OPEN, D=>nx11778, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_3_fx_reg_q : dffr port map ( Q=>
      label_4_output(3), QB=>OPEN, D=>nx11768, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_4_fx_reg_q : dffr port map ( Q=>
      label_4_output(4), QB=>OPEN, D=>nx11758, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_5_fx_reg_q : dffr port map ( Q=>
      label_4_output(5), QB=>OPEN, D=>nx11748, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_6_fx_reg_q : dffr port map ( Q=>
      label_4_output(6), QB=>OPEN, D=>nx11738, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_7_fx_reg_q : dffr port map ( Q=>
      label_4_output(7), QB=>OPEN, D=>nx11728, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_8_fx_reg_q : dffr port map ( Q=>
      label_4_output(8), QB=>OPEN, D=>nx11718, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_9_fx_reg_q : dffr port map ( Q=>
      label_4_output(9), QB=>OPEN, D=>nx11708, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_10_fx_reg_q : dffr port map ( Q=>
      label_4_output(10), QB=>OPEN, D=>nx11698, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_11_fx_reg_q : dffr port map ( Q=>
      label_4_output(11), QB=>OPEN, D=>nx11688, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_12_fx_reg_q : dffr port map ( Q=>
      label_4_output(12), QB=>OPEN, D=>nx11678, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_13_fx_reg_q : dffr port map ( Q=>
      label_4_output(13), QB=>OPEN, D=>nx11668, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_14_fx_reg_q : dffr port map ( Q=>
      label_4_output(14), QB=>OPEN, D=>nx11658, CLK=>clk, R=>rst);
   labelsregfile_label4_loop1_15_fx_reg_q : dffr port map ( Q=>
      label_4_output(15), QB=>OPEN, D=>nx11648, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_0_fx_reg_q : dffr port map ( Q=>
      label_3_output(0), QB=>OPEN, D=>nx11958, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_1_fx_reg_q : dffr port map ( Q=>
      label_3_output(1), QB=>OPEN, D=>nx11948, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_2_fx_reg_q : dffr port map ( Q=>
      label_3_output(2), QB=>OPEN, D=>nx11938, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_3_fx_reg_q : dffr port map ( Q=>
      label_3_output(3), QB=>OPEN, D=>nx11928, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_4_fx_reg_q : dffr port map ( Q=>
      label_3_output(4), QB=>OPEN, D=>nx11918, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_5_fx_reg_q : dffr port map ( Q=>
      label_3_output(5), QB=>OPEN, D=>nx11908, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_6_fx_reg_q : dffr port map ( Q=>
      label_3_output(6), QB=>OPEN, D=>nx11898, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_7_fx_reg_q : dffr port map ( Q=>
      label_3_output(7), QB=>OPEN, D=>nx11888, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_8_fx_reg_q : dffr port map ( Q=>
      label_3_output(8), QB=>OPEN, D=>nx11878, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_9_fx_reg_q : dffr port map ( Q=>
      label_3_output(9), QB=>OPEN, D=>nx11868, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_10_fx_reg_q : dffr port map ( Q=>
      label_3_output(10), QB=>OPEN, D=>nx11858, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_11_fx_reg_q : dffr port map ( Q=>
      label_3_output(11), QB=>OPEN, D=>nx11848, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_12_fx_reg_q : dffr port map ( Q=>
      label_3_output(12), QB=>OPEN, D=>nx11838, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_13_fx_reg_q : dffr port map ( Q=>
      label_3_output(13), QB=>OPEN, D=>nx11828, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_14_fx_reg_q : dffr port map ( Q=>
      label_3_output(14), QB=>OPEN, D=>nx11818, CLK=>clk, R=>rst);
   labelsregfile_label3_loop1_15_fx_reg_q : dffr port map ( Q=>
      label_3_output(15), QB=>OPEN, D=>nx11808, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_0_fx_reg_q : dffr port map ( Q=>
      label_2_output(0), QB=>OPEN, D=>nx12118, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_1_fx_reg_q : dffr port map ( Q=>
      label_2_output(1), QB=>OPEN, D=>nx12108, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_2_fx_reg_q : dffr port map ( Q=>
      label_2_output(2), QB=>OPEN, D=>nx12098, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_3_fx_reg_q : dffr port map ( Q=>
      label_2_output(3), QB=>OPEN, D=>nx12088, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_4_fx_reg_q : dffr port map ( Q=>
      label_2_output(4), QB=>OPEN, D=>nx12078, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_5_fx_reg_q : dffr port map ( Q=>
      label_2_output(5), QB=>OPEN, D=>nx12068, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_6_fx_reg_q : dffr port map ( Q=>
      label_2_output(6), QB=>OPEN, D=>nx12058, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_7_fx_reg_q : dffr port map ( Q=>
      label_2_output(7), QB=>OPEN, D=>nx12048, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_8_fx_reg_q : dffr port map ( Q=>
      label_2_output(8), QB=>OPEN, D=>nx12038, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_9_fx_reg_q : dffr port map ( Q=>
      label_2_output(9), QB=>OPEN, D=>nx12028, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_10_fx_reg_q : dffr port map ( Q=>
      label_2_output(10), QB=>OPEN, D=>nx12018, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_11_fx_reg_q : dffr port map ( Q=>
      label_2_output(11), QB=>OPEN, D=>nx12008, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_12_fx_reg_q : dffr port map ( Q=>
      label_2_output(12), QB=>OPEN, D=>nx11998, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_13_fx_reg_q : dffr port map ( Q=>
      label_2_output(13), QB=>OPEN, D=>nx11988, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_14_fx_reg_q : dffr port map ( Q=>
      label_2_output(14), QB=>OPEN, D=>nx11978, CLK=>clk, R=>rst);
   labelsregfile_label2_loop1_15_fx_reg_q : dffr port map ( Q=>
      label_2_output(15), QB=>OPEN, D=>nx11968, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_0_fx_reg_q : dffr port map ( Q=>
      label_1_output(0), QB=>OPEN, D=>nx12278, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_1_fx_reg_q : dffr port map ( Q=>
      label_1_output(1), QB=>OPEN, D=>nx12268, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_2_fx_reg_q : dffr port map ( Q=>
      label_1_output(2), QB=>OPEN, D=>nx12258, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_3_fx_reg_q : dffr port map ( Q=>
      label_1_output(3), QB=>OPEN, D=>nx12248, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_4_fx_reg_q : dffr port map ( Q=>
      label_1_output(4), QB=>OPEN, D=>nx12238, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_5_fx_reg_q : dffr port map ( Q=>
      label_1_output(5), QB=>OPEN, D=>nx12228, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_6_fx_reg_q : dffr port map ( Q=>
      label_1_output(6), QB=>OPEN, D=>nx12218, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_7_fx_reg_q : dffr port map ( Q=>
      label_1_output(7), QB=>OPEN, D=>nx12208, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_8_fx_reg_q : dffr port map ( Q=>
      label_1_output(8), QB=>OPEN, D=>nx12198, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_9_fx_reg_q : dffr port map ( Q=>
      label_1_output(9), QB=>OPEN, D=>nx12188, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_10_fx_reg_q : dffr port map ( Q=>
      label_1_output(10), QB=>OPEN, D=>nx12178, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_11_fx_reg_q : dffr port map ( Q=>
      label_1_output(11), QB=>OPEN, D=>nx12168, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_12_fx_reg_q : dffr port map ( Q=>
      label_1_output(12), QB=>OPEN, D=>nx12158, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_13_fx_reg_q : dffr port map ( Q=>
      label_1_output(13), QB=>OPEN, D=>nx12148, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_14_fx_reg_q : dffr port map ( Q=>
      label_1_output(14), QB=>OPEN, D=>nx12138, CLK=>clk, R=>rst);
   labelsregfile_label1_loop1_15_fx_reg_q : dffr port map ( Q=>
      label_1_output(15), QB=>OPEN, D=>nx12128, CLK=>clk, R=>rst);
   reg_enable_mdr_out : dffr port map ( Q=>enable_mdr_out, QB=>OPEN, D=>
      nx12308, CLK=>clk, R=>rst);
   ix12309 : mux21_ni port map ( Y=>nx12308, A0=>enable_mdr_out, A1=>nx70, 
      S0=>nx1474);
   ix1475 : nor04 port map ( Y=>nx1474, A0=>nx10149, A1=>nx166, A2=>nx702, 
      A3=>nx13142);
   reg_enable_mdr_in : dffr port map ( Q=>enable_mdr_in, QB=>OPEN, D=>
      nx12298, CLK=>clk, R=>rst);
   ix12299 : mux21_ni port map ( Y=>nx12298, A0=>nx1452, A1=>enable_mdr_in, 
      S0=>nx13148);
   ix13149 : nand03 port map ( Y=>nx13148, A0=>nx1440, A1=>nx12542, A2=>
      nx13151);
   ix1441 : oai21 port map ( Y=>nx1440, A0=>nx13177, A1=>nx12467, B0=>
      nx10152);
   reg_enable_mar_in : dffr port map ( Q=>enable_mar_in, QB=>OPEN, D=>
      nx12288, CLK=>clk, R=>rst);
   ix12289 : mux21_ni port map ( Y=>nx12288, A0=>enable_mar_in, A1=>nx1428, 
      S0=>nx1420);
   ix1429 : ao22 port map ( Y=>nx1428, A0=>sub_state(0), A1=>nx10152, B0=>
      nx12, B1=>nx12393);
   ix1421 : nor03_2x port map ( Y=>nx1420, A0=>nx13158, A1=>nx166, A2=>
      nx1412);
   ix13159 : nor04 port map ( Y=>nx13158, A0=>nx12373, A1=>nx13169, A2=>
      nx13173, A3=>nx12393);
   ix1413 : oai21 port map ( Y=>nx1412, A0=>nx12337, A1=>nx80, B0=>nx12395);
   ix13152 : inv01 port map ( Y=>nx13151, A=>nx1412);
   ix12641 : inv01 port map ( Y=>nx12640, A=>nx702);
   ix525 : inv01 port map ( Y=>nx524, A=>nx12585);
   ix421 : inv01 port map ( Y=>nx420, A=>nx12521);
   ix319 : inv01 port map ( Y=>nx318, A=>nx12481);
   ix167 : inv01 port map ( Y=>nx166, A=>nx12542);
   ix12466 : inv01 port map ( Y=>nx12465, A=>nx10152);
   ix93 : inv01 port map ( Y=>nx92, A=>nx12648);
   ix87 : inv01 port map ( Y=>nx86, A=>nx12393);
   ix12468 : inv01 port map ( Y=>nx12467, A=>nx80);
   ix77 : inv01 port map ( Y=>nx10151, A=>nx12373);
   ix12320 : inv01 port map ( Y=>nx12319, A=>nx10150);
   ix12358 : inv01 port map ( Y=>nx12357, A=>nx10148);
   ix12398 : inv01 port map ( Y=>nx12397, A=>nx10147);
   ix19 : inv01 port map ( Y=>nx18, A=>nx12362);
   ix105 : inv01 port map ( Y=>nx10146, A=>nx12364);
   ix37 : inv01 port map ( Y=>nx10145, A=>nx12395);
   ix12338 : inv01 port map ( Y=>nx12337, A=>nx12);
   ix13166 : inv02 port map ( Y=>nx13167, A=>nx13283);
   ix13168 : inv02 port map ( Y=>nx13169, A=>nx13283);
   ix13170 : inv02 port map ( Y=>nx13171, A=>nx12339);
   ix13172 : inv02 port map ( Y=>nx13173, A=>nx12339);
   ix13174 : inv02 port map ( Y=>nx13175, A=>nx12376);
   ix13176 : inv02 port map ( Y=>nx13177, A=>nx12376);
   ix13180 : inv02 port map ( Y=>nx13181, A=>nx13305);
   ix13226 : inv02 port map ( Y=>nx13227, A=>nx13251);
   ix13228 : inv02 port map ( Y=>nx13229, A=>nx13253);
   ix13230 : inv01 port map ( Y=>nx13231, A=>nx13247);
   ix13232 : inv01 port map ( Y=>nx13233, A=>nx13247);
   ix13234 : inv02 port map ( Y=>nx13235, A=>nx12495);
   ix13236 : inv02 port map ( Y=>nx13237, A=>nx13299);
   ix13240 : buf02 port map ( Y=>nx13241, A=>nx12388);
   ix13242 : buf02 port map ( Y=>nx13243, A=>nx12388);
   ix13246 : inv02 port map ( Y=>nx13247, A=>nx10144);
   ix13248 : inv02 port map ( Y=>nx13249, A=>nx4);
   ix13250 : inv02 port map ( Y=>nx13251, A=>nx13279);
   ix13252 : inv02 port map ( Y=>nx13253, A=>nx13279);
   ix13254 : buf02 port map ( Y=>nx13255, A=>nx12442);
   ix13256 : buf02 port map ( Y=>nx13257, A=>nx12442);
   ix13258 : inv02 port map ( Y=>nx13259, A=>sel_dst(3));
   ix13260 : inv02 port map ( Y=>nx13261, A=>nx13347);
   ix13262 : inv02 port map ( Y=>nx13263, A=>nx13347);
   ix13264 : inv02 port map ( Y=>nx13265, A=>nx13347);
   ix65 : nor02ii port map ( Y=>nx64, A0=>nx60, A1=>nx10150);
   ix10639 : mux21_ni port map ( Y=>nx10638, A0=>num_in_7, A1=>num_out_7, S0
      =>nx13287);
   ix691 : and03 port map ( Y=>nx10144, A0=>nx12379, A1=>nx13283, A2=>
      nx12339);
   ix13 : and03 port map ( Y=>nx12, A0=>nx12379, A1=>nx13283, A2=>state(1));
   ix693 : and02 port map ( Y=>nx10152, A0=>nx13283, A1=>nx12339);
   ix43 : and02 port map ( Y=>nx42, A0=>nx12395, A1=>nx13285);
   ix12374 : and02 port map ( Y=>nx12373, A0=>nx12371, A1=>nx12376);
   ix735 : and03 port map ( Y=>nx10150, A0=>state(0), A1=>nx13285, A2=>
      nx12339);
   ix699 : ao21 port map ( Y=>nx10143, A0=>nx12379, A1=>nx12339, B0=>nx13285
   );
   ix10219 : mux21 port map ( Y=>nx10218, A0=>nx13251, A1=>nx13299, S0=>
      nx13241);
   ix10439 : mux21_ni port map ( Y=>nx10438, A0=>num_in_3, A1=>num_out_3, S0
      =>nx13287);
   ix311 : mux21_ni port map ( Y=>nx310, A0=>address_out_1, A1=>num_out_1, 
      S0=>nx13279);
   ix10339 : mux21_ni port map ( Y=>nx10338, A0=>num_in_1, A1=>num_out_1, S0
      =>nx13287);
   ix293 : mux21_ni port map ( Y=>nx292, A0=>alu_inp1_0, A1=>nx13235, S0=>
      nx12438);
   ix253 : mux21_ni port map ( Y=>nx252, A0=>address_out_0, A1=>num_out_0, 
      S0=>nx13279);
   ix10289 : mux21_ni port map ( Y=>nx10288, A0=>num_in_0, A1=>num_out_0, S0
      =>nx13287);
   ix277 : ao22 port map ( Y=>nx276, A0=>mdr_data_out(0), A1=>nx10144, B0=>
      nx13271, B1=>nx13279);
   ix13270 : inv01 port map ( Y=>nx13271, A=>nx12434);
   ix12435 : xor2 port map ( Y=>nx12434, A0=>alu_inp1_0, A1=>nx12438);
   ix12441 : nor03_2x port map ( Y=>nx4, A0=>nx12379, A1=>state(2), A2=>
      nx12339);
   ix123 : mux21 port map ( Y=>nx122, A0=>nx12376, A1=>nx13251, S0=>nx13247
   );
   ix10249 : mux21_ni port map ( Y=>nx10248, A0=>address_in_0, A1=>
      address_out_0, S0=>nx13295);
   ix12461 : nor02ii port map ( Y=>nx12460, A0=>sub_state(1), A1=>nx10144);
   ix231 : nor02ii port map ( Y=>nx230, A0=>nx12463, A1=>nx10148);
   ix12482 : xor2 port map ( Y=>nx12481, A0=>alu_inp1_1, A1=>nx13299);
   ix10309 : mux21_ni port map ( Y=>nx10308, A0=>address_in_1, A1=>
      address_out_1, S0=>nx13295);
   ix12498 : xnor2 port map ( Y=>nx12497, A0=>nx12520, A1=>nx13299);
   ix363 : mux21_ni port map ( Y=>nx362, A0=>address_out_2, A1=>num_out_2, 
      S0=>nx13279);
   ix10389 : mux21_ni port map ( Y=>nx10388, A0=>num_in_2, A1=>num_out_2, S0
      =>nx13287);
   ix379 : ao22 port map ( Y=>nx378, A0=>mdr_data_out(2), A1=>nx10144, B0=>
      nx13273, B1=>nx13279);
   ix13272 : inv01 port map ( Y=>nx13273, A=>nx12507);
   ix10359 : mux21_ni port map ( Y=>nx10358, A0=>address_in_2, A1=>
      address_out_2, S0=>nx13295);
   ix12522 : xor2 port map ( Y=>nx12521, A0=>alu_inp1_3, A1=>nx13301);
   ix413 : mux21_ni port map ( Y=>nx412, A0=>address_out_3, A1=>num_out_3, 
      S0=>nx13281);
   ix10409 : mux21_ni port map ( Y=>nx10408, A0=>address_in_3, A1=>
      address_out_3, S0=>nx13295);
   ix671 : and03 port map ( Y=>nx10153, A0=>nx12379, A1=>state(2), A2=>
      nx12339);
   ix517 : mux21_ni port map ( Y=>nx516, A0=>address_out_5, A1=>num_out_5, 
      S0=>nx13281);
   ix10539 : mux21_ni port map ( Y=>nx10538, A0=>num_in_5, A1=>num_out_5, S0
      =>nx13287);
   ix12562 : xnor2 port map ( Y=>nx12561, A0=>nx12584, A1=>nx13301);
   ix467 : mux21_ni port map ( Y=>nx466, A0=>address_out_4, A1=>num_out_4, 
      S0=>nx13281);
   ix10489 : mux21_ni port map ( Y=>nx10488, A0=>num_in_4, A1=>num_out_4, S0
      =>nx13289);
   ix483 : ao22 port map ( Y=>nx482, A0=>mdr_data_out(4), A1=>nx10144, B0=>
      nx13275, B1=>nx13281);
   ix13274 : inv01 port map ( Y=>nx13275, A=>nx12571);
   ix10459 : mux21_ni port map ( Y=>nx10458, A0=>address_in_4, A1=>
      address_out_4, S0=>nx13295);
   ix12586 : xor2 port map ( Y=>nx12585, A0=>alu_inp1_5, A1=>nx13301);
   ix10509 : mux21_ni port map ( Y=>nx10508, A0=>address_in_5, A1=>
      address_out_5, S0=>nx13295);
   ix12600 : xnor2 port map ( Y=>nx12599, A0=>nx12622, A1=>nx13301);
   ix569 : mux21_ni port map ( Y=>nx568, A0=>address_out_6, A1=>num_out_6, 
      S0=>nx13281);
   ix10589 : mux21_ni port map ( Y=>nx10588, A0=>num_in_6, A1=>num_out_6, S0
      =>nx13289);
   ix585 : ao22 port map ( Y=>nx584, A0=>mdr_data_out(6), A1=>nx10144, B0=>
      nx13277, B1=>nx13281);
   ix13276 : inv01 port map ( Y=>nx13277, A=>nx12609);
   ix10559 : mux21_ni port map ( Y=>nx10558, A0=>address_in_6, A1=>
      address_out_6, S0=>nx13297);
   ix12624 : xor2 port map ( Y=>nx12623, A0=>alu_inp1_7, A1=>nx13301);
   ix619 : mux21_ni port map ( Y=>nx618, A0=>address_out_7, A1=>num_out_7, 
      S0=>nx13281);
   ix10609 : mux21_ni port map ( Y=>nx10608, A0=>address_in_7, A1=>
      address_out_7, S0=>nx13297);
   ix737 : nor02ii port map ( Y=>nx10149, A0=>nx12648, A1=>nx10150);
   ix12649 : nor02ii port map ( Y=>nx12648, A0=>nx12393, A1=>nx80);
   ix12657 : nor02ii port map ( Y=>nx12656, A0=>nx12364, A1=>nx10144);
   ix10839 : mux21_ni port map ( Y=>nx10838, A0=>mdr_data_out(144), A1=>
      label_10_output(0), S0=>nx13305);
   ix10829 : mux21_ni port map ( Y=>nx10828, A0=>mdr_data_out(145), A1=>
      label_10_output(1), S0=>nx13305);
   ix10819 : mux21_ni port map ( Y=>nx10818, A0=>mdr_data_out(146), A1=>
      label_10_output(2), S0=>nx13305);
   ix10809 : mux21_ni port map ( Y=>nx10808, A0=>mdr_data_out(147), A1=>
      label_10_output(3), S0=>nx13305);
   ix10799 : mux21_ni port map ( Y=>nx10798, A0=>mdr_data_out(148), A1=>
      label_10_output(4), S0=>nx13305);
   ix10789 : mux21_ni port map ( Y=>nx10788, A0=>mdr_data_out(149), A1=>
      label_10_output(5), S0=>nx13305);
   ix10779 : mux21_ni port map ( Y=>nx10778, A0=>mdr_data_out(150), A1=>
      label_10_output(6), S0=>nx13307);
   ix10769 : mux21_ni port map ( Y=>nx10768, A0=>mdr_data_out(151), A1=>
      label_10_output(7), S0=>nx13307);
   ix10759 : mux21_ni port map ( Y=>nx10758, A0=>mdr_data_out(152), A1=>
      label_10_output(8), S0=>nx13307);
   ix10749 : mux21_ni port map ( Y=>nx10748, A0=>mdr_data_out(153), A1=>
      label_10_output(9), S0=>nx13307);
   ix10739 : mux21_ni port map ( Y=>nx10738, A0=>mdr_data_out(154), A1=>
      label_10_output(10), S0=>nx13307);
   ix10729 : mux21_ni port map ( Y=>nx10728, A0=>mdr_data_out(155), A1=>
      label_10_output(11), S0=>nx13307);
   ix10719 : mux21_ni port map ( Y=>nx10718, A0=>mdr_data_out(156), A1=>
      label_10_output(12), S0=>nx13307);
   ix10709 : mux21_ni port map ( Y=>nx10708, A0=>mdr_data_out(157), A1=>
      label_10_output(13), S0=>nx13309);
   ix10699 : mux21_ni port map ( Y=>nx10698, A0=>mdr_data_out(158), A1=>
      label_10_output(14), S0=>nx13309);
   ix10689 : mux21_ni port map ( Y=>nx10688, A0=>mdr_data_out(159), A1=>
      label_10_output(15), S0=>nx13309);
   ix10999 : mux21_ni port map ( Y=>nx10998, A0=>mdr_data_out(128), A1=>
      label_9_output(0), S0=>nx13309);
   ix10989 : mux21_ni port map ( Y=>nx10988, A0=>mdr_data_out(129), A1=>
      label_9_output(1), S0=>nx13309);
   ix10979 : mux21_ni port map ( Y=>nx10978, A0=>mdr_data_out(130), A1=>
      label_9_output(2), S0=>nx13309);
   ix10969 : mux21_ni port map ( Y=>nx10968, A0=>mdr_data_out(131), A1=>
      label_9_output(3), S0=>nx13309);
   ix10959 : mux21_ni port map ( Y=>nx10958, A0=>mdr_data_out(132), A1=>
      label_9_output(4), S0=>nx13311);
   ix10949 : mux21_ni port map ( Y=>nx10948, A0=>mdr_data_out(133), A1=>
      label_9_output(5), S0=>nx13311);
   ix10939 : mux21_ni port map ( Y=>nx10938, A0=>mdr_data_out(134), A1=>
      label_9_output(6), S0=>nx13311);
   ix10929 : mux21_ni port map ( Y=>nx10928, A0=>mdr_data_out(135), A1=>
      label_9_output(7), S0=>nx13311);
   ix10919 : mux21_ni port map ( Y=>nx10918, A0=>mdr_data_out(136), A1=>
      label_9_output(8), S0=>nx13311);
   ix10909 : mux21_ni port map ( Y=>nx10908, A0=>mdr_data_out(137), A1=>
      label_9_output(9), S0=>nx13311);
   ix10899 : mux21_ni port map ( Y=>nx10898, A0=>mdr_data_out(138), A1=>
      label_9_output(10), S0=>nx13311);
   ix10889 : mux21_ni port map ( Y=>nx10888, A0=>mdr_data_out(139), A1=>
      label_9_output(11), S0=>nx13313);
   ix10879 : mux21_ni port map ( Y=>nx10878, A0=>mdr_data_out(140), A1=>
      label_9_output(12), S0=>nx13313);
   ix10869 : mux21_ni port map ( Y=>nx10868, A0=>mdr_data_out(141), A1=>
      label_9_output(13), S0=>nx13313);
   ix10859 : mux21_ni port map ( Y=>nx10858, A0=>mdr_data_out(142), A1=>
      label_9_output(14), S0=>nx13313);
   ix10849 : mux21_ni port map ( Y=>nx10848, A0=>mdr_data_out(143), A1=>
      label_9_output(15), S0=>nx13313);
   ix11159 : mux21_ni port map ( Y=>nx11158, A0=>mdr_data_out(112), A1=>
      label_8_output(0), S0=>nx13313);
   ix11149 : mux21_ni port map ( Y=>nx11148, A0=>mdr_data_out(113), A1=>
      label_8_output(1), S0=>nx13313);
   ix11139 : mux21_ni port map ( Y=>nx11138, A0=>mdr_data_out(114), A1=>
      label_8_output(2), S0=>nx13315);
   ix11129 : mux21_ni port map ( Y=>nx11128, A0=>mdr_data_out(115), A1=>
      label_8_output(3), S0=>nx13315);
   ix11119 : mux21_ni port map ( Y=>nx11118, A0=>mdr_data_out(116), A1=>
      label_8_output(4), S0=>nx13315);
   ix11109 : mux21_ni port map ( Y=>nx11108, A0=>mdr_data_out(117), A1=>
      label_8_output(5), S0=>nx13315);
   ix11099 : mux21_ni port map ( Y=>nx11098, A0=>mdr_data_out(118), A1=>
      label_8_output(6), S0=>nx13315);
   ix11089 : mux21_ni port map ( Y=>nx11088, A0=>mdr_data_out(119), A1=>
      label_8_output(7), S0=>nx13315);
   ix11079 : mux21_ni port map ( Y=>nx11078, A0=>mdr_data_out(120), A1=>
      label_8_output(8), S0=>nx13315);
   ix11069 : mux21_ni port map ( Y=>nx11068, A0=>mdr_data_out(121), A1=>
      label_8_output(9), S0=>nx13355);
   ix11059 : mux21_ni port map ( Y=>nx11058, A0=>mdr_data_out(122), A1=>
      label_8_output(10), S0=>nx13355);
   ix11049 : mux21_ni port map ( Y=>nx11048, A0=>mdr_data_out(123), A1=>
      label_8_output(11), S0=>nx13355);
   ix11039 : mux21_ni port map ( Y=>nx11038, A0=>mdr_data_out(124), A1=>
      label_8_output(12), S0=>nx13355);
   ix11029 : mux21_ni port map ( Y=>nx11028, A0=>mdr_data_out(125), A1=>
      label_8_output(13), S0=>nx13355);
   ix11019 : mux21_ni port map ( Y=>nx11018, A0=>mdr_data_out(126), A1=>
      label_8_output(14), S0=>nx13355);
   ix11009 : mux21_ni port map ( Y=>nx11008, A0=>mdr_data_out(127), A1=>
      label_8_output(15), S0=>nx13355);
   ix11319 : mux21_ni port map ( Y=>nx11318, A0=>mdr_data_out(96), A1=>
      label_7_output(0), S0=>nx13317);
   ix11309 : mux21_ni port map ( Y=>nx11308, A0=>mdr_data_out(97), A1=>
      label_7_output(1), S0=>nx13317);
   ix11299 : mux21_ni port map ( Y=>nx11298, A0=>mdr_data_out(98), A1=>
      label_7_output(2), S0=>nx13317);
   ix11289 : mux21_ni port map ( Y=>nx11288, A0=>mdr_data_out(99), A1=>
      label_7_output(3), S0=>nx13317);
   ix11279 : mux21_ni port map ( Y=>nx11278, A0=>mdr_data_out(100), A1=>
      label_7_output(4), S0=>nx13317);
   ix11269 : mux21_ni port map ( Y=>nx11268, A0=>mdr_data_out(101), A1=>
      label_7_output(5), S0=>nx13317);
   ix11259 : mux21_ni port map ( Y=>nx11258, A0=>mdr_data_out(102), A1=>
      label_7_output(6), S0=>nx13317);
   ix11249 : mux21_ni port map ( Y=>nx11248, A0=>mdr_data_out(103), A1=>
      label_7_output(7), S0=>nx13319);
   ix11239 : mux21_ni port map ( Y=>nx11238, A0=>mdr_data_out(104), A1=>
      label_7_output(8), S0=>nx13319);
   ix11229 : mux21_ni port map ( Y=>nx11228, A0=>mdr_data_out(105), A1=>
      label_7_output(9), S0=>nx13319);
   ix11219 : mux21_ni port map ( Y=>nx11218, A0=>mdr_data_out(106), A1=>
      label_7_output(10), S0=>nx13319);
   ix11209 : mux21_ni port map ( Y=>nx11208, A0=>mdr_data_out(107), A1=>
      label_7_output(11), S0=>nx13319);
   ix11199 : mux21_ni port map ( Y=>nx11198, A0=>mdr_data_out(108), A1=>
      label_7_output(12), S0=>nx13319);
   ix11189 : mux21_ni port map ( Y=>nx11188, A0=>mdr_data_out(109), A1=>
      label_7_output(13), S0=>nx13319);
   ix11179 : mux21_ni port map ( Y=>nx11178, A0=>mdr_data_out(110), A1=>
      label_7_output(14), S0=>nx13321);
   ix11169 : mux21_ni port map ( Y=>nx11168, A0=>mdr_data_out(111), A1=>
      label_7_output(15), S0=>nx13321);
   ix11479 : mux21_ni port map ( Y=>nx11478, A0=>mdr_data_out(80), A1=>
      label_6_output(0), S0=>nx13321);
   ix11469 : mux21_ni port map ( Y=>nx11468, A0=>mdr_data_out(81), A1=>
      label_6_output(1), S0=>nx13321);
   ix11459 : mux21_ni port map ( Y=>nx11458, A0=>mdr_data_out(82), A1=>
      label_6_output(2), S0=>nx13321);
   ix11449 : mux21_ni port map ( Y=>nx11448, A0=>mdr_data_out(83), A1=>
      label_6_output(3), S0=>nx13321);
   ix11439 : mux21_ni port map ( Y=>nx11438, A0=>mdr_data_out(84), A1=>
      label_6_output(4), S0=>nx13321);
   ix11429 : mux21_ni port map ( Y=>nx11428, A0=>mdr_data_out(85), A1=>
      label_6_output(5), S0=>nx13323);
   ix11419 : mux21_ni port map ( Y=>nx11418, A0=>mdr_data_out(86), A1=>
      label_6_output(6), S0=>nx13323);
   ix11409 : mux21_ni port map ( Y=>nx11408, A0=>mdr_data_out(87), A1=>
      label_6_output(7), S0=>nx13323);
   ix11399 : mux21_ni port map ( Y=>nx11398, A0=>mdr_data_out(88), A1=>
      label_6_output(8), S0=>nx13323);
   ix11389 : mux21_ni port map ( Y=>nx11388, A0=>mdr_data_out(89), A1=>
      label_6_output(9), S0=>nx13323);
   ix11379 : mux21_ni port map ( Y=>nx11378, A0=>mdr_data_out(90), A1=>
      label_6_output(10), S0=>nx13323);
   ix11369 : mux21_ni port map ( Y=>nx11368, A0=>mdr_data_out(91), A1=>
      label_6_output(11), S0=>nx13323);
   ix11359 : mux21_ni port map ( Y=>nx11358, A0=>mdr_data_out(92), A1=>
      label_6_output(12), S0=>nx13325);
   ix11349 : mux21_ni port map ( Y=>nx11348, A0=>mdr_data_out(93), A1=>
      label_6_output(13), S0=>nx13325);
   ix11339 : mux21_ni port map ( Y=>nx11338, A0=>mdr_data_out(94), A1=>
      label_6_output(14), S0=>nx13325);
   ix11329 : mux21_ni port map ( Y=>nx11328, A0=>mdr_data_out(95), A1=>
      label_6_output(15), S0=>nx13325);
   ix11639 : mux21_ni port map ( Y=>nx11638, A0=>mdr_data_out(64), A1=>
      label_5_output(0), S0=>nx13325);
   ix11629 : mux21_ni port map ( Y=>nx11628, A0=>mdr_data_out(65), A1=>
      label_5_output(1), S0=>nx13325);
   ix11619 : mux21_ni port map ( Y=>nx11618, A0=>mdr_data_out(66), A1=>
      label_5_output(2), S0=>nx13325);
   ix11609 : mux21_ni port map ( Y=>nx11608, A0=>mdr_data_out(67), A1=>
      label_5_output(3), S0=>nx13327);
   ix11599 : mux21_ni port map ( Y=>nx11598, A0=>mdr_data_out(68), A1=>
      label_5_output(4), S0=>nx13327);
   ix11589 : mux21_ni port map ( Y=>nx11588, A0=>mdr_data_out(69), A1=>
      label_5_output(5), S0=>nx13327);
   ix11579 : mux21_ni port map ( Y=>nx11578, A0=>mdr_data_out(70), A1=>
      label_5_output(6), S0=>nx13327);
   ix11569 : mux21_ni port map ( Y=>nx11568, A0=>mdr_data_out(71), A1=>
      label_5_output(7), S0=>nx13327);
   ix11559 : mux21_ni port map ( Y=>nx11558, A0=>mdr_data_out(72), A1=>
      label_5_output(8), S0=>nx13327);
   ix11549 : mux21_ni port map ( Y=>nx11548, A0=>mdr_data_out(73), A1=>
      label_5_output(9), S0=>nx13327);
   ix11539 : mux21_ni port map ( Y=>nx11538, A0=>mdr_data_out(74), A1=>
      label_5_output(10), S0=>nx13261);
   ix11529 : mux21_ni port map ( Y=>nx11528, A0=>mdr_data_out(75), A1=>
      label_5_output(11), S0=>nx13261);
   ix11519 : mux21_ni port map ( Y=>nx11518, A0=>mdr_data_out(76), A1=>
      label_5_output(12), S0=>nx13261);
   ix11509 : mux21_ni port map ( Y=>nx11508, A0=>mdr_data_out(77), A1=>
      label_5_output(13), S0=>nx13261);
   ix11499 : mux21_ni port map ( Y=>nx11498, A0=>mdr_data_out(78), A1=>
      label_5_output(14), S0=>nx13261);
   ix11489 : mux21_ni port map ( Y=>nx11488, A0=>mdr_data_out(79), A1=>
      label_5_output(15), S0=>nx13261);
   ix11799 : mux21_ni port map ( Y=>nx11798, A0=>mdr_data_out(48), A1=>
      label_4_output(0), S0=>nx13261);
   ix11789 : mux21_ni port map ( Y=>nx11788, A0=>mdr_data_out(49), A1=>
      label_4_output(1), S0=>nx13329);
   ix11779 : mux21_ni port map ( Y=>nx11778, A0=>mdr_data_out(50), A1=>
      label_4_output(2), S0=>nx13329);
   ix11769 : mux21_ni port map ( Y=>nx11768, A0=>mdr_data_out(51), A1=>
      label_4_output(3), S0=>nx13329);
   ix11759 : mux21_ni port map ( Y=>nx11758, A0=>mdr_data_out(52), A1=>
      label_4_output(4), S0=>nx13329);
   ix11749 : mux21_ni port map ( Y=>nx11748, A0=>mdr_data_out(53), A1=>
      label_4_output(5), S0=>nx13329);
   ix11739 : mux21_ni port map ( Y=>nx11738, A0=>mdr_data_out(54), A1=>
      label_4_output(6), S0=>nx13329);
   ix11729 : mux21_ni port map ( Y=>nx11728, A0=>mdr_data_out(55), A1=>
      label_4_output(7), S0=>nx13329);
   ix11719 : mux21_ni port map ( Y=>nx11718, A0=>mdr_data_out(56), A1=>
      label_4_output(8), S0=>nx13331);
   ix11709 : mux21_ni port map ( Y=>nx11708, A0=>mdr_data_out(57), A1=>
      label_4_output(9), S0=>nx13331);
   ix11699 : mux21_ni port map ( Y=>nx11698, A0=>mdr_data_out(58), A1=>
      label_4_output(10), S0=>nx13331);
   ix11689 : mux21_ni port map ( Y=>nx11688, A0=>mdr_data_out(59), A1=>
      label_4_output(11), S0=>nx13331);
   ix11679 : mux21_ni port map ( Y=>nx11678, A0=>mdr_data_out(60), A1=>
      label_4_output(12), S0=>nx13331);
   ix11669 : mux21_ni port map ( Y=>nx11668, A0=>mdr_data_out(61), A1=>
      label_4_output(13), S0=>nx13331);
   ix11659 : mux21_ni port map ( Y=>nx11658, A0=>mdr_data_out(62), A1=>
      label_4_output(14), S0=>nx13331);
   ix11649 : mux21_ni port map ( Y=>nx11648, A0=>mdr_data_out(63), A1=>
      label_4_output(15), S0=>nx13333);
   ix11959 : mux21_ni port map ( Y=>nx11958, A0=>mdr_data_out(32), A1=>
      label_3_output(0), S0=>nx13333);
   ix11949 : mux21_ni port map ( Y=>nx11948, A0=>mdr_data_out(33), A1=>
      label_3_output(1), S0=>nx13333);
   ix11939 : mux21_ni port map ( Y=>nx11938, A0=>mdr_data_out(34), A1=>
      label_3_output(2), S0=>nx13333);
   ix11929 : mux21_ni port map ( Y=>nx11928, A0=>mdr_data_out(35), A1=>
      label_3_output(3), S0=>nx13333);
   ix11919 : mux21_ni port map ( Y=>nx11918, A0=>mdr_data_out(36), A1=>
      label_3_output(4), S0=>nx13333);
   ix11909 : mux21_ni port map ( Y=>nx11908, A0=>mdr_data_out(37), A1=>
      label_3_output(5), S0=>nx13333);
   ix11899 : mux21_ni port map ( Y=>nx11898, A0=>mdr_data_out(38), A1=>
      label_3_output(6), S0=>nx13335);
   ix11889 : mux21_ni port map ( Y=>nx11888, A0=>mdr_data_out(39), A1=>
      label_3_output(7), S0=>nx13335);
   ix11879 : mux21_ni port map ( Y=>nx11878, A0=>mdr_data_out(40), A1=>
      label_3_output(8), S0=>nx13335);
   ix11869 : mux21_ni port map ( Y=>nx11868, A0=>mdr_data_out(41), A1=>
      label_3_output(9), S0=>nx13335);
   ix11859 : mux21_ni port map ( Y=>nx11858, A0=>mdr_data_out(42), A1=>
      label_3_output(10), S0=>nx13335);
   ix11849 : mux21_ni port map ( Y=>nx11848, A0=>mdr_data_out(43), A1=>
      label_3_output(11), S0=>nx13335);
   ix11839 : mux21_ni port map ( Y=>nx11838, A0=>mdr_data_out(44), A1=>
      label_3_output(12), S0=>nx13335);
   ix11829 : mux21_ni port map ( Y=>nx11828, A0=>mdr_data_out(45), A1=>
      label_3_output(13), S0=>nx13337);
   ix11819 : mux21_ni port map ( Y=>nx11818, A0=>mdr_data_out(46), A1=>
      label_3_output(14), S0=>nx13337);
   ix11809 : mux21_ni port map ( Y=>nx11808, A0=>mdr_data_out(47), A1=>
      label_3_output(15), S0=>nx13337);
   ix12119 : mux21_ni port map ( Y=>nx12118, A0=>mdr_data_out(16), A1=>
      label_2_output(0), S0=>nx13337);
   ix12109 : mux21_ni port map ( Y=>nx12108, A0=>mdr_data_out(17), A1=>
      label_2_output(1), S0=>nx13337);
   ix12099 : mux21_ni port map ( Y=>nx12098, A0=>mdr_data_out(18), A1=>
      label_2_output(2), S0=>nx13337);
   ix12089 : mux21_ni port map ( Y=>nx12088, A0=>mdr_data_out(19), A1=>
      label_2_output(3), S0=>nx13337);
   ix12079 : mux21_ni port map ( Y=>nx12078, A0=>mdr_data_out(20), A1=>
      label_2_output(4), S0=>nx13339);
   ix12069 : mux21_ni port map ( Y=>nx12068, A0=>mdr_data_out(21), A1=>
      label_2_output(5), S0=>nx13339);
   ix12059 : mux21_ni port map ( Y=>nx12058, A0=>mdr_data_out(22), A1=>
      label_2_output(6), S0=>nx13339);
   ix12049 : mux21_ni port map ( Y=>nx12048, A0=>mdr_data_out(23), A1=>
      label_2_output(7), S0=>nx13339);
   ix12039 : mux21_ni port map ( Y=>nx12038, A0=>mdr_data_out(24), A1=>
      label_2_output(8), S0=>nx13339);
   ix12029 : mux21_ni port map ( Y=>nx12028, A0=>mdr_data_out(25), A1=>
      label_2_output(9), S0=>nx13339);
   ix12019 : mux21_ni port map ( Y=>nx12018, A0=>mdr_data_out(26), A1=>
      label_2_output(10), S0=>nx13339);
   ix12009 : mux21_ni port map ( Y=>nx12008, A0=>mdr_data_out(27), A1=>
      label_2_output(11), S0=>nx13263);
   ix11999 : mux21_ni port map ( Y=>nx11998, A0=>mdr_data_out(28), A1=>
      label_2_output(12), S0=>nx13263);
   ix11989 : mux21_ni port map ( Y=>nx11988, A0=>mdr_data_out(29), A1=>
      label_2_output(13), S0=>nx13263);
   ix11979 : mux21_ni port map ( Y=>nx11978, A0=>mdr_data_out(30), A1=>
      label_2_output(14), S0=>nx13263);
   ix11969 : mux21_ni port map ( Y=>nx11968, A0=>mdr_data_out(31), A1=>
      label_2_output(15), S0=>nx13263);
   ix12279 : mux21_ni port map ( Y=>nx12278, A0=>mdr_data_out(0), A1=>
      label_1_output(0), S0=>nx13263);
   ix12269 : mux21_ni port map ( Y=>nx12268, A0=>mdr_data_out(1), A1=>
      label_1_output(1), S0=>nx13263);
   ix12259 : mux21_ni port map ( Y=>nx12258, A0=>mdr_data_out(2), A1=>
      label_1_output(2), S0=>nx13341);
   ix12249 : mux21_ni port map ( Y=>nx12248, A0=>mdr_data_out(3), A1=>
      label_1_output(3), S0=>nx13341);
   ix12239 : mux21_ni port map ( Y=>nx12238, A0=>mdr_data_out(4), A1=>
      label_1_output(4), S0=>nx13341);
   ix12229 : mux21_ni port map ( Y=>nx12228, A0=>mdr_data_out(5), A1=>
      label_1_output(5), S0=>nx13341);
   ix12219 : mux21_ni port map ( Y=>nx12218, A0=>mdr_data_out(6), A1=>
      label_1_output(6), S0=>nx13341);
   ix12209 : mux21_ni port map ( Y=>nx12208, A0=>mdr_data_out(7), A1=>
      label_1_output(7), S0=>nx13341);
   ix12199 : mux21_ni port map ( Y=>nx12198, A0=>mdr_data_out(8), A1=>
      label_1_output(8), S0=>nx13341);
   ix12189 : mux21_ni port map ( Y=>nx12188, A0=>mdr_data_out(9), A1=>
      label_1_output(9), S0=>nx13265);
   ix12179 : mux21_ni port map ( Y=>nx12178, A0=>mdr_data_out(10), A1=>
      label_1_output(10), S0=>nx13265);
   ix12169 : mux21_ni port map ( Y=>nx12168, A0=>mdr_data_out(11), A1=>
      label_1_output(11), S0=>nx13265);
   ix12159 : mux21_ni port map ( Y=>nx12158, A0=>mdr_data_out(12), A1=>
      label_1_output(12), S0=>nx13265);
   ix12149 : mux21_ni port map ( Y=>nx12148, A0=>mdr_data_out(13), A1=>
      label_1_output(13), S0=>nx13265);
   ix12139 : mux21_ni port map ( Y=>nx12138, A0=>mdr_data_out(14), A1=>
      label_1_output(14), S0=>nx13265);
   ix12129 : mux21_ni port map ( Y=>nx12128, A0=>mdr_data_out(15), A1=>
      label_1_output(15), S0=>nx13265);
   ix13143 : nor02ii port map ( Y=>nx13142, A0=>nx12648, A1=>nx10144);
   ix1453 : and02 port map ( Y=>nx1452, A0=>nx12393, A1=>nx10148);
   ix13238 : nor02ii port map ( Y=>nx13239, A0=>nx12463, A1=>nx10148);
   ix13278 : inv02 port map ( Y=>nx13279, A=>nx13249);
   ix13280 : inv02 port map ( Y=>nx13281, A=>nx13249);
   ix13282 : inv02 port map ( Y=>nx13283, A=>state(2));
   ix13284 : inv02 port map ( Y=>nx13285, A=>state(2));
   ix13286 : buf02 port map ( Y=>nx13287, A=>nx12450);
   ix13288 : buf02 port map ( Y=>nx13289, A=>nx12450);
   ix13290 : buf02 port map ( Y=>nx13291, A=>nx12460);
   ix13292 : buf02 port map ( Y=>nx13293, A=>nx12460);
   ix13294 : buf02 port map ( Y=>nx13295, A=>nx12475);
   ix13296 : buf02 port map ( Y=>nx13297, A=>nx12475);
   ix13298 : inv02 port map ( Y=>nx13299, A=>nx13235);
   ix13300 : inv02 port map ( Y=>nx13301, A=>nx13235);
   ix13302 : buf02 port map ( Y=>nx13303, A=>nx13239);
   ix13304 : inv02 port map ( Y=>nx13305, A=>nx13347);
   ix13306 : inv02 port map ( Y=>nx13307, A=>nx13347);
   ix13308 : inv02 port map ( Y=>nx13309, A=>nx13347);
   ix13310 : inv02 port map ( Y=>nx13311, A=>nx13347);
   ix13312 : inv02 port map ( Y=>nx13313, A=>nx13349);
   ix13314 : inv02 port map ( Y=>nx13315, A=>nx13349);
   ix13316 : inv02 port map ( Y=>nx13317, A=>nx13349);
   ix13318 : inv02 port map ( Y=>nx13319, A=>nx13349);
   ix13320 : inv02 port map ( Y=>nx13321, A=>nx13349);
   ix13322 : inv02 port map ( Y=>nx13323, A=>nx13349);
   ix13324 : inv02 port map ( Y=>nx13325, A=>nx13349);
   ix13326 : inv02 port map ( Y=>nx13327, A=>nx13351);
   ix13328 : inv02 port map ( Y=>nx13329, A=>nx13351);
   ix13330 : inv02 port map ( Y=>nx13331, A=>nx13351);
   ix13332 : inv02 port map ( Y=>nx13333, A=>nx13351);
   ix13334 : inv02 port map ( Y=>nx13335, A=>nx13351);
   ix13336 : inv02 port map ( Y=>nx13337, A=>nx13351);
   ix13338 : inv02 port map ( Y=>nx13339, A=>nx13351);
   ix13340 : inv02 port map ( Y=>nx13341, A=>nx13353);
   ix13346 : inv02 port map ( Y=>nx13347, A=>nx13259);
   ix13348 : inv02 port map ( Y=>nx13349, A=>nx13259);
   ix13350 : inv02 port map ( Y=>nx13351, A=>nx13259);
   ix13352 : inv02 port map ( Y=>nx13353, A=>nx13259);
   ix13354 : inv02 port map ( Y=>nx13355, A=>sel_dst(3));
address_out <= address_out_7 & address_out_6 & address_out_5 & address_out_4 & address_out_3 & address_out_2 & address_out_1 & address_out_0;

 specialregfile : entity work.special_register_file port map ( clk , clk_inv , rst ,  enable_mar_in , enable_mdr_in , enable_mdr_out , enable_write , address_out, mdr_data_out );

    --     -- 
end a_controller ;



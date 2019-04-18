
-- 
-- Definition of  booth_integration
-- 
--      Mon Apr 15 14:45:49 2019
--      
--      LeonardoSpectrum Level 3, 2018a.2
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity booth_integration is
   port (
      set : IN std_logic ;
      clk : IN std_logic ;
      rst : IN std_logic ;
      M : IN std_logic_vector (15 DOWNTO 0) ;
      R : IN std_logic_vector (15 DOWNTO 0) ;
      booth_output : OUT std_logic_vector (31 DOWNTO 0)) ;
end booth_integration ;

architecture my_booth_integration of booth_integration is
   signal booth_output_30_EXMPLR, booth_output_29_EXMPLR, 
      booth_output_28_EXMPLR, booth_output_27_EXMPLR, booth_output_26_EXMPLR, 
      booth_output_25_EXMPLR, booth_output_24_EXMPLR, booth_output_23_EXMPLR, 
      booth_output_22_EXMPLR, booth_output_21_EXMPLR, booth_output_20_EXMPLR, 
      booth_output_19_EXMPLR, booth_output_18_EXMPLR, booth_output_17_EXMPLR, 
      booth_output_16_EXMPLR, booth_output_15_EXMPLR, booth_output_14_EXMPLR, 
      booth_output_13_EXMPLR, booth_output_12_EXMPLR, booth_output_11_EXMPLR, 
      booth_output_10_EXMPLR, booth_output_9_EXMPLR, booth_output_8_EXMPLR, 
      booth_output_7_EXMPLR, booth_output_6_EXMPLR, booth_output_5_EXMPLR, 
      booth_output_4_EXMPLR, booth_output_3_EXMPLR, booth_output_2_EXMPLR, 
      booth_output_1_EXMPLR, booth_output_0_EXMPLR, shift_reg_output_9, 
      shift_Reg_count_9, shift_Reg_output_8, shift_Reg_count_8, 
      shift_Reg_output_7, shift_Reg_count_7, shift_Reg_output_6, 
      shift_Reg_count_6, shift_Reg_output_5, shift_Reg_count_5, 
      shift_Reg_output_4, shift_Reg_count_4, shift_Reg_output_3, 
      shift_Reg_count_3, shift_Reg_output_2, shift_Reg_count_2, 
      shift_Reg_output_1, shift_Reg_count_1, shift_reg_output_0, 
      shift_Reg_count_0, nx481, nx483, nx487, nx489, nx491, nx495, nx498, 
      nx501, nx100, nx104, nx108, nx112, nx116, nx120, nx124, nx128, nx132, 
      nx136, nx140, nx144, nx152, nx156, nx503, nx166, nx168, nx170, nx192, 
      nx200, nx218, nx220, nx222, nx244, nx252, nx270, nx272, nx274, nx296, 
      nx304, nx322, nx324, nx326, nx348, nx356, nx374, nx376, nx378, nx400, 
      nx408, nx426, nx428, nx430, nx452, nx460, nx468, nx478, nx480, nx482, 
      nx496, nx506, nx508, nx514, nx520, nx528, nx540, nx552, nx564, nx576, 
      nx588, nx600, nx612, nx624, nx636, nx648, nx660, nx672, nx684, nx696, 
      nx708, nx816, nx824, nx826, nx513, nx519, nx533, nx543, nx553, nx563, 
      nx573, nx583, nx593, nx603, nx613, nx623, nx633, nx643, nx653, nx663, 
      nx673, nx683, nx693, nx703, nx713, nx723, nx733, nx743, nx753, nx763, 
      nx773, nx783, nx793, nx803, nx813, nx823, nx833, nx843, nx853, nx863, 
      nx873, nx883, nx893, nx903, nx913, nx923, nx933, nx943, nx953, nx963, 
      nx973, nx983, nx993, nx1003, nx1013, nx1023, nx1033, nx1140, nx1160, 
      nx1163, nx1168, nx1170, nx1176, nx1178, nx1181, nx1185, nx1191, nx1193, 
      nx1197, nx1200, nx1204, nx1206, nx1210, nx1213, nx1216, nx1219, nx1223, 
      nx1228, nx1230, nx1233, nx1236, nx1239, nx1243, nx1245, nx1249, nx1252, 
      nx1255, nx1257, nx1262, nx1264, nx1267, nx1270, nx1273, nx1277, nx1279, 
      nx1283, nx1286, nx1289, nx1291, nx1296, nx1298, nx1301, nx1304, nx1307, 
      nx1311, nx1313, nx1317, nx1320, nx1323, nx1325, nx1330, nx1332, nx1335, 
      nx1338, nx1341, nx1345, nx1347, nx1351, nx1354, nx1357, nx1359, nx1364, 
      nx1366, nx1369, nx1372, nx1375, nx1379, nx1381, nx1385, nx1388, nx1391, 
      nx1393, nx1397, nx1399, nx1402, nx1405, nx1408, nx1412, nx1421, nx1423, 
      nx1447, nx1461, nx1463, nx1465, nx1473, nx1475, nx1477, nx1479, nx1481, 
      nx1485, nx1487, nx1489, nx1491, nx1497, nx1499, nx1501, nx1503, nx1505, 
      nx1507, nx1509, nx1511, nx1513, nx1515, nx1521, nx1523: std_logic ;

begin
   booth_output(31) <= booth_output_30_EXMPLR ;
   booth_output(30) <= booth_output_30_EXMPLR ;
   booth_output(29) <= booth_output_29_EXMPLR ;
   booth_output(28) <= booth_output_28_EXMPLR ;
   booth_output(27) <= booth_output_27_EXMPLR ;
   booth_output(26) <= booth_output_26_EXMPLR ;
   booth_output(25) <= booth_output_25_EXMPLR ;
   booth_output(24) <= booth_output_24_EXMPLR ;
   booth_output(23) <= booth_output_23_EXMPLR ;
   booth_output(22) <= booth_output_22_EXMPLR ;
   booth_output(21) <= booth_output_21_EXMPLR ;
   booth_output(20) <= booth_output_20_EXMPLR ;
   booth_output(19) <= booth_output_19_EXMPLR ;
   booth_output(18) <= booth_output_18_EXMPLR ;
   booth_output(17) <= booth_output_17_EXMPLR ;
   booth_output(16) <= booth_output_16_EXMPLR ;
   booth_output(15) <= booth_output_15_EXMPLR ;
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
      OPEN, D=>nx1013, CLK=>clk, R=>rst);
   p_Reg_loop1_2_fx_reg_q : dffr port map ( Q=>booth_output_1_EXMPLR, QB=>
      OPEN, D=>nx1003, CLK=>clk, R=>rst);
   p_Reg_loop1_3_fx_reg_q : dffr port map ( Q=>booth_output_2_EXMPLR, QB=>
      OPEN, D=>nx993, CLK=>clk, R=>rst);
   p_Reg_loop1_4_fx_reg_q : dffr port map ( Q=>booth_output_3_EXMPLR, QB=>
      OPEN, D=>nx983, CLK=>clk, R=>rst);
   p_Reg_loop1_5_fx_reg_q : dffr port map ( Q=>booth_output_4_EXMPLR, QB=>
      OPEN, D=>nx973, CLK=>clk, R=>rst);
   p_Reg_loop1_6_fx_reg_q : dffr port map ( Q=>booth_output_5_EXMPLR, QB=>
      OPEN, D=>nx963, CLK=>clk, R=>rst);
   p_Reg_loop1_7_fx_reg_q : dffr port map ( Q=>booth_output_6_EXMPLR, QB=>
      OPEN, D=>nx953, CLK=>clk, R=>rst);
   p_Reg_loop1_8_fx_reg_q : dffr port map ( Q=>booth_output_7_EXMPLR, QB=>
      OPEN, D=>nx943, CLK=>clk, R=>rst);
   p_Reg_loop1_9_fx_reg_q : dffr port map ( Q=>booth_output_8_EXMPLR, QB=>
      OPEN, D=>nx933, CLK=>clk, R=>rst);
   p_Reg_loop1_10_fx_reg_q : dffr port map ( Q=>booth_output_9_EXMPLR, QB=>
      OPEN, D=>nx923, CLK=>clk, R=>rst);
   p_Reg_loop1_11_fx_reg_q : dffr port map ( Q=>booth_output_10_EXMPLR, QB=>
      OPEN, D=>nx913, CLK=>clk, R=>rst);
   p_Reg_loop1_12_fx_reg_q : dffr port map ( Q=>booth_output_11_EXMPLR, QB=>
      OPEN, D=>nx903, CLK=>clk, R=>rst);
   p_Reg_loop1_13_fx_reg_q : dffr port map ( Q=>booth_output_12_EXMPLR, QB=>
      OPEN, D=>nx893, CLK=>clk, R=>rst);
   p_Reg_loop1_14_fx_reg_q : dffr port map ( Q=>booth_output_13_EXMPLR, QB=>
      OPEN, D=>nx883, CLK=>clk, R=>rst);
   p_Reg_loop1_15_fx_reg_q : dffr port map ( Q=>booth_output_14_EXMPLR, QB=>
      OPEN, D=>nx873, CLK=>clk, R=>rst);
   p_Reg_loop1_16_fx_reg_q : dffr port map ( Q=>booth_output_15_EXMPLR, QB=>
      OPEN, D=>nx863, CLK=>clk, R=>rst);
   ix521 : xnor2 port map ( Y=>nx520, A0=>booth_output_16_EXMPLR, A1=>nx1163
   );
   p_Reg_loop1_17_fx_reg_q : dffr port map ( Q=>booth_output_16_EXMPLR, QB=>
      OPEN, D=>nx853, CLK=>clk, R=>rst);
   shift_Reg_Reg_loop1_0_fx_reg_q : dffr port map ( Q=>shift_reg_output_0, 
      QB=>OPEN, D=>nx533, CLK=>clk, R=>rst);
   shift_Reg_reg_count_0 : dffs_ni port map ( Q=>shift_Reg_count_0, QB=>OPEN, 
      D=>nx519, CLK=>clk, S=>nx1463);
   shift_Reg_Reg_loop1_9_fx_reg_q : dffr port map ( Q=>shift_reg_output_9, 
      QB=>OPEN, D=>nx713, CLK=>clk, R=>rst);
   shift_Reg_reg_count_9 : dffr port map ( Q=>shift_Reg_count_9, QB=>OPEN, D
      =>nx703, CLK=>clk, R=>nx1463);
   shift_Reg_Reg_loop1_8_fx_reg_q : dffr port map ( Q=>shift_Reg_output_8, 
      QB=>OPEN, D=>nx693, CLK=>clk, R=>rst);
   shift_Reg_reg_count_8 : dffr port map ( Q=>shift_Reg_count_8, QB=>OPEN, D
      =>nx683, CLK=>clk, R=>nx1463);
   shift_Reg_Reg_loop1_7_fx_reg_q : dffr port map ( Q=>shift_Reg_output_7, 
      QB=>OPEN, D=>nx673, CLK=>clk, R=>rst);
   shift_Reg_reg_count_7 : dffr port map ( Q=>shift_Reg_count_7, QB=>OPEN, D
      =>nx663, CLK=>clk, R=>nx1463);
   shift_Reg_Reg_loop1_6_fx_reg_q : dffr port map ( Q=>shift_Reg_output_6, 
      QB=>OPEN, D=>nx653, CLK=>clk, R=>rst);
   shift_Reg_reg_count_6 : dffr port map ( Q=>shift_Reg_count_6, QB=>OPEN, D
      =>nx643, CLK=>clk, R=>nx1461);
   shift_Reg_Reg_loop1_5_fx_reg_q : dffr port map ( Q=>shift_Reg_output_5, 
      QB=>OPEN, D=>nx633, CLK=>clk, R=>rst);
   shift_Reg_reg_count_5 : dffr port map ( Q=>shift_Reg_count_5, QB=>OPEN, D
      =>nx623, CLK=>clk, R=>nx1461);
   shift_Reg_Reg_loop1_4_fx_reg_q : dffr port map ( Q=>shift_Reg_output_4, 
      QB=>OPEN, D=>nx613, CLK=>clk, R=>rst);
   shift_Reg_reg_count_4 : dffr port map ( Q=>shift_Reg_count_4, QB=>OPEN, D
      =>nx603, CLK=>clk, R=>nx1461);
   shift_Reg_Reg_loop1_3_fx_reg_q : dffr port map ( Q=>shift_Reg_output_3, 
      QB=>OPEN, D=>nx593, CLK=>clk, R=>rst);
   shift_Reg_reg_count_3 : dffr port map ( Q=>shift_Reg_count_3, QB=>OPEN, D
      =>nx583, CLK=>clk, R=>nx1461);
   shift_Reg_Reg_loop1_2_fx_reg_q : dffr port map ( Q=>shift_Reg_output_2, 
      QB=>OPEN, D=>nx573, CLK=>clk, R=>rst);
   shift_Reg_reg_count_2 : dffr port map ( Q=>shift_Reg_count_2, QB=>OPEN, D
      =>nx563, CLK=>clk, R=>nx1461);
   shift_Reg_Reg_loop1_1_fx_reg_q : dffr port map ( Q=>shift_Reg_output_1, 
      QB=>OPEN, D=>nx553, CLK=>clk, R=>rst);
   shift_Reg_reg_count_1 : dffr port map ( Q=>shift_Reg_count_1, QB=>OPEN, D
      =>nx543, CLK=>clk, R=>nx1461);
   ix514 : nand02 port map ( Y=>nx513, A0=>nx1497, A1=>nx1447);
   shift_Reg_reg_en : dffs_ni port map ( Q=>OPEN, QB=>nx1140, D=>nx513, CLK
      =>clk, S=>nx1461);
   ix1161 : xnor2 port map ( Y=>nx1160, A0=>nx481, A1=>nx508);
   ix731 : nor02ii port map ( Y=>nx481, A0=>nx1163, A1=>
      booth_output_16_EXMPLR);
   ix1164 : oai21 port map ( Y=>nx1163, A0=>nx152, A1=>nx503, B0=>R(0));
   ix1024 : oai21 port map ( Y=>nx1023, A0=>nx1168, A1=>nx1473, B0=>nx1170);
   p_Reg_loop1_0_fx_reg_q : dffr port map ( Q=>OPEN, QB=>nx1168, D=>nx1023, 
      CLK=>clk, R=>rst);
   ix1171 : nand03 port map ( Y=>nx1170, A0=>nx1481, A1=>
      booth_output_0_EXMPLR, A2=>nx1473);
   ix725 : nor02_2x port map ( Y=>nx503, A0=>nx1168, A1=>
      booth_output_0_EXMPLR);
   ix844 : oai21 port map ( Y=>nx843, A0=>nx1176, A1=>nx1473, B0=>nx1178);
   p_Reg_loop1_18_fx_reg_q : dffr port map ( Q=>booth_output_17_EXMPLR, QB=>
      nx1176, D=>nx843, CLK=>clk, R=>rst);
   ix1179 : nand03 port map ( Y=>nx1178, A0=>nx1481, A1=>nx482, A2=>nx1501);
   ix483 : xnor2 port map ( Y=>nx482, A0=>nx1181, A1=>nx480);
   ix1182 : aoi22 port map ( Y=>nx1181, A0=>nx506, A1=>
      booth_output_17_EXMPLR, B0=>nx481, B1=>nx508);
   ix497 : nand02 port map ( Y=>nx496, A0=>R(1), A1=>R(0));
   ix1186 : or02 port map ( Y=>nx1185, A0=>R(0), A1=>R(1));
   ix481 : xnor2 port map ( Y=>nx480, A0=>booth_output_18_EXMPLR, A1=>nx1421
   );
   p_Reg_loop1_19_fx_reg_q : dffr port map ( Q=>booth_output_18_EXMPLR, QB=>
      OPEN, D=>nx833, CLK=>clk, R=>rst);
   ix1192 : xnor2 port map ( Y=>nx1191, A0=>nx1193, A1=>nx1200);
   ix1194 : aoi22 port map ( Y=>nx1193, A0=>nx478, A1=>
      booth_output_18_EXMPLR, B0=>nx483, B1=>nx480);
   ix469 : oai21 port map ( Y=>nx468, A0=>R(0), A1=>R(1), B0=>R(2));
   ix824 : oai21 port map ( Y=>nx823, A0=>nx1204, A1=>nx1473, B0=>nx1206);
   p_Reg_loop1_20_fx_reg_q : dffr port map ( Q=>booth_output_19_EXMPLR, QB=>
      nx1204, D=>nx823, CLK=>clk, R=>rst);
   ix1207 : nand03 port map ( Y=>nx1206, A0=>nx1481, A1=>nx430, A2=>nx1501);
   ix431 : xnor2 port map ( Y=>nx430, A0=>nx487, A1=>nx1223);
   ix749 : oai21 port map ( Y=>nx487, A0=>nx1193, A1=>nx1200, B0=>nx1210);
   ix1211 : nand02 port map ( Y=>nx1210, A0=>nx452, A1=>
      booth_output_19_EXMPLR);
   ix453 : oai32 port map ( Y=>nx452, A0=>nx1213, A1=>nx1485, A2=>nx104, B0
      =>nx1219, B1=>nx1489);
   ix1214 : nor02ii port map ( Y=>nx1213, A0=>nx100, A1=>R(3));
   ix101 : nor03_2x port map ( Y=>nx100, A0=>R(2), A1=>R(0), A2=>R(1));
   ix1217 : nand02 port map ( Y=>nx1216, A0=>nx1168, A1=>
      booth_output_0_EXMPLR);
   ix105 : nor04 port map ( Y=>nx104, A0=>R(3), A1=>R(2), A2=>R(0), A3=>R(1)
   );
   ix1220 : inv01 port map ( Y=>nx1219, A=>R(3));
   ix1224 : xnor2 port map ( Y=>nx1223, A0=>booth_output_20_EXMPLR, A1=>
      nx426);
   p_Reg_loop1_21_fx_reg_q : dffr port map ( Q=>booth_output_20_EXMPLR, QB=>
      OPEN, D=>nx813, CLK=>clk, R=>rst);
   ix1229 : xnor2 port map ( Y=>nx1228, A0=>nx1230, A1=>nx1239);
   ix1231 : aoi22 port map ( Y=>nx1230, A0=>nx426, A1=>
      booth_output_20_EXMPLR, B0=>nx487, B1=>nx428);
   ix427 : oai32 port map ( Y=>nx426, A0=>nx1233, A1=>nx1485, A2=>nx108, B0
      =>nx1236, B1=>nx1489);
   ix1234 : nor02ii port map ( Y=>nx1233, A0=>nx104, A1=>R(4));
   ix109 : nor02ii port map ( Y=>nx108, A0=>R(4), A1=>nx104);
   ix1237 : inv01 port map ( Y=>nx1236, A=>R(4));
   ix804 : oai21 port map ( Y=>nx803, A0=>nx1243, A1=>nx1473, B0=>nx1245);
   p_Reg_loop1_22_fx_reg_q : dffr port map ( Q=>booth_output_21_EXMPLR, QB=>
      nx1243, D=>nx803, CLK=>clk, R=>rst);
   ix1246 : nand03 port map ( Y=>nx1245, A0=>nx1481, A1=>nx378, A2=>nx1501);
   ix379 : xnor2 port map ( Y=>nx378, A0=>nx489, A1=>nx1257);
   ix761 : oai21 port map ( Y=>nx489, A0=>nx1230, A1=>nx1239, B0=>nx1249);
   ix1250 : nand02 port map ( Y=>nx1249, A0=>nx400, A1=>
      booth_output_21_EXMPLR);
   ix401 : oai32 port map ( Y=>nx400, A0=>nx1252, A1=>nx1485, A2=>nx112, B0
      =>nx1255, B1=>nx1489);
   ix1253 : nor02ii port map ( Y=>nx1252, A0=>nx108, A1=>R(5));
   ix113 : nor02ii port map ( Y=>nx112, A0=>R(5), A1=>nx108);
   ix1256 : inv01 port map ( Y=>nx1255, A=>R(5));
   ix1258 : xnor2 port map ( Y=>nx1257, A0=>booth_output_22_EXMPLR, A1=>
      nx374);
   p_Reg_loop1_23_fx_reg_q : dffr port map ( Q=>booth_output_22_EXMPLR, QB=>
      OPEN, D=>nx793, CLK=>clk, R=>rst);
   ix1263 : xnor2 port map ( Y=>nx1262, A0=>nx1264, A1=>nx1273);
   ix1265 : aoi22 port map ( Y=>nx1264, A0=>nx374, A1=>
      booth_output_22_EXMPLR, B0=>nx489, B1=>nx376);
   ix375 : oai32 port map ( Y=>nx374, A0=>nx1267, A1=>nx1485, A2=>nx116, B0
      =>nx1270, B1=>nx1489);
   ix1268 : nor02ii port map ( Y=>nx1267, A0=>nx112, A1=>R(6));
   ix117 : nor02ii port map ( Y=>nx116, A0=>R(6), A1=>nx112);
   ix1271 : inv01 port map ( Y=>nx1270, A=>R(6));
   ix784 : oai21 port map ( Y=>nx783, A0=>nx1277, A1=>nx1473, B0=>nx1279);
   p_Reg_loop1_24_fx_reg_q : dffr port map ( Q=>booth_output_23_EXMPLR, QB=>
      nx1277, D=>nx783, CLK=>clk, R=>rst);
   ix1280 : nand03 port map ( Y=>nx1279, A0=>nx1481, A1=>nx326, A2=>nx1501);
   ix327 : xnor2 port map ( Y=>nx326, A0=>nx491, A1=>nx1291);
   ix773 : oai21 port map ( Y=>nx491, A0=>nx1264, A1=>nx1273, B0=>nx1283);
   ix1284 : nand02 port map ( Y=>nx1283, A0=>nx348, A1=>
      booth_output_23_EXMPLR);
   ix349 : oai32 port map ( Y=>nx348, A0=>nx1286, A1=>nx1485, A2=>nx120, B0
      =>nx1289, B1=>nx1489);
   ix1287 : nor02ii port map ( Y=>nx1286, A0=>nx116, A1=>R(7));
   ix121 : nor02ii port map ( Y=>nx120, A0=>R(7), A1=>nx116);
   ix1290 : inv01 port map ( Y=>nx1289, A=>R(7));
   ix1292 : xnor2 port map ( Y=>nx1291, A0=>booth_output_24_EXMPLR, A1=>
      nx322);
   p_Reg_loop1_25_fx_reg_q : dffr port map ( Q=>booth_output_24_EXMPLR, QB=>
      OPEN, D=>nx773, CLK=>clk, R=>rst);
   ix1297 : xnor2 port map ( Y=>nx1296, A0=>nx1298, A1=>nx1307);
   ix1299 : aoi22 port map ( Y=>nx1298, A0=>nx322, A1=>
      booth_output_24_EXMPLR, B0=>nx491, B1=>nx324);
   ix323 : oai32 port map ( Y=>nx322, A0=>nx1301, A1=>nx1485, A2=>nx124, B0
      =>nx1304, B1=>nx1489);
   ix1302 : nor02ii port map ( Y=>nx1301, A0=>nx120, A1=>R(8));
   ix125 : nor02ii port map ( Y=>nx124, A0=>R(8), A1=>nx120);
   ix1305 : inv01 port map ( Y=>nx1304, A=>R(8));
   ix764 : oai21 port map ( Y=>nx763, A0=>nx1311, A1=>nx1475, B0=>nx1313);
   p_Reg_loop1_26_fx_reg_q : dffr port map ( Q=>booth_output_25_EXMPLR, QB=>
      nx1311, D=>nx763, CLK=>clk, R=>rst);
   ix1314 : nand03 port map ( Y=>nx1313, A0=>nx1481, A1=>nx274, A2=>nx1501);
   ix275 : xnor2 port map ( Y=>nx274, A0=>nx495, A1=>nx1325);
   ix785 : oai21 port map ( Y=>nx495, A0=>nx1298, A1=>nx1307, B0=>nx1317);
   ix1318 : nand02 port map ( Y=>nx1317, A0=>nx296, A1=>
      booth_output_25_EXMPLR);
   ix297 : oai32 port map ( Y=>nx296, A0=>nx1320, A1=>nx1485, A2=>nx128, B0
      =>nx1323, B1=>nx1489);
   ix1321 : nor02ii port map ( Y=>nx1320, A0=>nx124, A1=>R(9));
   ix129 : nor02ii port map ( Y=>nx128, A0=>R(9), A1=>nx124);
   ix1324 : inv01 port map ( Y=>nx1323, A=>R(9));
   ix1326 : xnor2 port map ( Y=>nx1325, A0=>booth_output_26_EXMPLR, A1=>
      nx270);
   p_Reg_loop1_27_fx_reg_q : dffr port map ( Q=>booth_output_26_EXMPLR, QB=>
      OPEN, D=>nx753, CLK=>clk, R=>rst);
   ix1331 : xnor2 port map ( Y=>nx1330, A0=>nx1332, A1=>nx1341);
   ix1333 : aoi22 port map ( Y=>nx1332, A0=>nx270, A1=>
      booth_output_26_EXMPLR, B0=>nx495, B1=>nx272);
   ix271 : oai32 port map ( Y=>nx270, A0=>nx1335, A1=>nx1487, A2=>nx132, B0
      =>nx1338, B1=>nx1491);
   ix1336 : nor02ii port map ( Y=>nx1335, A0=>nx128, A1=>R(10));
   ix133 : nor02ii port map ( Y=>nx132, A0=>R(10), A1=>nx128);
   ix1339 : inv01 port map ( Y=>nx1338, A=>R(10));
   ix744 : oai21 port map ( Y=>nx743, A0=>nx1345, A1=>nx1475, B0=>nx1347);
   p_Reg_loop1_28_fx_reg_q : dffr port map ( Q=>booth_output_27_EXMPLR, QB=>
      nx1345, D=>nx743, CLK=>clk, R=>rst);
   ix1348 : nand03 port map ( Y=>nx1347, A0=>nx1481, A1=>nx222, A2=>nx1475);
   ix223 : xnor2 port map ( Y=>nx222, A0=>nx498, A1=>nx1359);
   ix797 : oai21 port map ( Y=>nx498, A0=>nx1332, A1=>nx1341, B0=>nx1351);
   ix1352 : nand02 port map ( Y=>nx1351, A0=>nx244, A1=>
      booth_output_27_EXMPLR);
   ix245 : oai32 port map ( Y=>nx244, A0=>nx1354, A1=>nx1487, A2=>nx136, B0
      =>nx1357, B1=>nx1491);
   ix1355 : nor02ii port map ( Y=>nx1354, A0=>nx132, A1=>R(11));
   ix137 : nor02ii port map ( Y=>nx136, A0=>R(11), A1=>nx132);
   ix1358 : inv01 port map ( Y=>nx1357, A=>R(11));
   ix1360 : xnor2 port map ( Y=>nx1359, A0=>booth_output_28_EXMPLR, A1=>
      nx218);
   p_Reg_loop1_29_fx_reg_q : dffr port map ( Q=>booth_output_28_EXMPLR, QB=>
      OPEN, D=>nx733, CLK=>clk, R=>rst);
   ix1365 : xnor2 port map ( Y=>nx1364, A0=>nx1366, A1=>nx1375);
   ix1367 : aoi22 port map ( Y=>nx1366, A0=>nx218, A1=>
      booth_output_28_EXMPLR, B0=>nx498, B1=>nx220);
   ix219 : oai32 port map ( Y=>nx218, A0=>nx1369, A1=>nx1487, A2=>nx140, B0
      =>nx1372, B1=>nx1491);
   ix1370 : nor02ii port map ( Y=>nx1369, A0=>nx136, A1=>R(12));
   ix141 : nor02ii port map ( Y=>nx140, A0=>R(12), A1=>nx136);
   ix1373 : inv01 port map ( Y=>nx1372, A=>R(12));
   ix724 : oai21 port map ( Y=>nx723, A0=>nx1379, A1=>nx1475, B0=>nx1381);
   p_Reg_loop1_30_fx_reg_q : dffr port map ( Q=>booth_output_29_EXMPLR, QB=>
      nx1379, D=>nx723, CLK=>clk, R=>rst);
   ix1382 : nand03 port map ( Y=>nx1381, A0=>nx1509, A1=>nx170, A2=>nx1475);
   ix171 : xnor2 port map ( Y=>nx170, A0=>nx501, A1=>nx1393);
   ix809 : oai21 port map ( Y=>nx501, A0=>nx1366, A1=>nx1375, B0=>nx1385);
   ix1386 : nand02 port map ( Y=>nx1385, A0=>nx192, A1=>
      booth_output_29_EXMPLR);
   ix193 : oai32 port map ( Y=>nx192, A0=>nx1388, A1=>nx1487, A2=>nx144, B0
      =>nx1391, B1=>nx1491);
   ix1389 : nor02ii port map ( Y=>nx1388, A0=>nx140, A1=>R(13));
   ix145 : nor02ii port map ( Y=>nx144, A0=>R(13), A1=>nx140);
   ix1392 : inv01 port map ( Y=>nx1391, A=>R(13));
   ix1034 : oai21 port map ( Y=>nx1033, A0=>nx1397, A1=>nx1475, B0=>nx1399);
   p_Reg_loop1_31_fx_reg_q : dffr port map ( Q=>booth_output_30_EXMPLR, QB=>
      nx1397, D=>nx1033, CLK=>clk, R=>rst);
   ix1400 : nand03 port map ( Y=>nx1399, A0=>nx1509, A1=>nx826, A2=>nx1475);
   ix827 : xnor2 port map ( Y=>nx826, A0=>nx1402, A1=>nx824);
   ix1403 : aoi22 port map ( Y=>nx1402, A0=>nx166, A1=>
      booth_output_30_EXMPLR, B0=>nx501, B1=>nx168);
   ix167 : oai32 port map ( Y=>nx166, A0=>nx1405, A1=>nx1487, A2=>nx156, B0
      =>nx1408, B1=>nx1491);
   ix1406 : nor02ii port map ( Y=>nx1405, A0=>nx144, A1=>R(14));
   ix157 : nor02ii port map ( Y=>nx156, A0=>R(14), A1=>nx144);
   ix1409 : inv01 port map ( Y=>nx1408, A=>R(14));
   ix1413 : aoi22 port map ( Y=>nx1412, A0=>R(15), A1=>nx503, B0=>nx152, B1
      =>nx816);
   ix817 : xnor2 port map ( Y=>nx816, A0=>R(15), A1=>nx156);
   ix1422 : aoi32 port map ( Y=>nx1421, A0=>nx468, A1=>nx152, A2=>nx1197, B0
      =>R(2), B1=>nx503);
   ix1424 : aoi32 port map ( Y=>nx1423, A0=>nx496, A1=>nx152, A2=>nx1185, B0
      =>R(1), B1=>nx503);
   ix507 : inv01 port map ( Y=>nx506, A=>nx1423);
   ix479 : inv01 port map ( Y=>nx478, A=>nx1421);
   ix429 : inv01 port map ( Y=>nx428, A=>nx1223);
   ix377 : inv01 port map ( Y=>nx376, A=>nx1257);
   ix325 : inv01 port map ( Y=>nx324, A=>nx1291);
   ix273 : inv01 port map ( Y=>nx272, A=>nx1325);
   ix221 : inv01 port map ( Y=>nx220, A=>nx1359);
   ix169 : inv01 port map ( Y=>nx168, A=>nx1393);
   ix153 : inv01 port map ( Y=>nx152, A=>nx1216);
   ix1198 : inv01 port map ( Y=>nx1197, A=>nx100);
   ix737 : inv01 port map ( Y=>nx483, A=>nx1181);
   ix1446 : inv02 port map ( Y=>nx1447, A=>nx1501);
   ix1460 : inv02 port map ( Y=>nx1461, A=>set);
   ix1462 : inv02 port map ( Y=>nx1463, A=>set);
   ix1464 : inv02 port map ( Y=>nx1465, A=>nx1509);
   ix1472 : inv02 port map ( Y=>nx1473, A=>shift_reg_output_9);
   ix1474 : inv02 port map ( Y=>nx1475, A=>nx1521);
   ix1476 : inv02 port map ( Y=>nx1477, A=>nx1521);
   ix1478 : inv02 port map ( Y=>nx1479, A=>nx1521);
   ix1480 : inv01 port map ( Y=>nx1481, A=>shift_reg_output_0);
   ix1484 : inv02 port map ( Y=>nx1485, A=>nx152);
   ix1486 : inv02 port map ( Y=>nx1487, A=>nx152);
   ix1488 : inv02 port map ( Y=>nx1489, A=>nx503);
   ix1490 : inv02 port map ( Y=>nx1491, A=>nx503);
   ix1014 : mux21_ni port map ( Y=>nx1013, A0=>booth_output_0_EXMPLR, A1=>
      nx708, S0=>nx1505);
   ix709 : mux21_ni port map ( Y=>nx708, A0=>M(0), A1=>booth_output_1_EXMPLR, 
      S0=>nx1509);
   ix1004 : mux21_ni port map ( Y=>nx1003, A0=>booth_output_1_EXMPLR, A1=>
      nx696, S0=>nx1505);
   ix697 : mux21_ni port map ( Y=>nx696, A0=>M(1), A1=>booth_output_2_EXMPLR, 
      S0=>nx1509);
   ix994 : mux21_ni port map ( Y=>nx993, A0=>booth_output_2_EXMPLR, A1=>
      nx684, S0=>nx1505);
   ix685 : mux21_ni port map ( Y=>nx684, A0=>M(2), A1=>booth_output_3_EXMPLR, 
      S0=>nx1509);
   ix984 : mux21_ni port map ( Y=>nx983, A0=>booth_output_3_EXMPLR, A1=>
      nx672, S0=>nx1505);
   ix673 : mux21_ni port map ( Y=>nx672, A0=>M(3), A1=>booth_output_4_EXMPLR, 
      S0=>nx1509);
   ix974 : mux21_ni port map ( Y=>nx973, A0=>booth_output_4_EXMPLR, A1=>
      nx660, S0=>nx1505);
   ix661 : mux21_ni port map ( Y=>nx660, A0=>M(4), A1=>booth_output_5_EXMPLR, 
      S0=>nx1511);
   ix964 : mux21_ni port map ( Y=>nx963, A0=>booth_output_5_EXMPLR, A1=>
      nx648, S0=>nx1505);
   ix649 : mux21_ni port map ( Y=>nx648, A0=>M(5), A1=>booth_output_6_EXMPLR, 
      S0=>nx1511);
   ix954 : mux21_ni port map ( Y=>nx953, A0=>booth_output_6_EXMPLR, A1=>
      nx636, S0=>nx1505);
   ix637 : mux21_ni port map ( Y=>nx636, A0=>M(6), A1=>booth_output_7_EXMPLR, 
      S0=>nx1511);
   ix944 : mux21_ni port map ( Y=>nx943, A0=>booth_output_7_EXMPLR, A1=>
      nx624, S0=>nx1507);
   ix625 : mux21_ni port map ( Y=>nx624, A0=>M(7), A1=>booth_output_8_EXMPLR, 
      S0=>nx1511);
   ix934 : mux21_ni port map ( Y=>nx933, A0=>booth_output_8_EXMPLR, A1=>
      nx612, S0=>nx1507);
   ix613 : mux21_ni port map ( Y=>nx612, A0=>M(8), A1=>booth_output_9_EXMPLR, 
      S0=>nx1511);
   ix924 : mux21_ni port map ( Y=>nx923, A0=>booth_output_9_EXMPLR, A1=>
      nx600, S0=>nx1507);
   ix601 : mux21_ni port map ( Y=>nx600, A0=>M(9), A1=>
      booth_output_10_EXMPLR, S0=>nx1511);
   ix914 : mux21_ni port map ( Y=>nx913, A0=>booth_output_10_EXMPLR, A1=>
      nx588, S0=>nx1507);
   ix589 : mux21_ni port map ( Y=>nx588, A0=>M(10), A1=>
      booth_output_11_EXMPLR, S0=>nx1511);
   ix904 : mux21_ni port map ( Y=>nx903, A0=>booth_output_11_EXMPLR, A1=>
      nx576, S0=>nx1507);
   ix577 : mux21_ni port map ( Y=>nx576, A0=>M(11), A1=>
      booth_output_12_EXMPLR, S0=>nx1513);
   ix894 : mux21_ni port map ( Y=>nx893, A0=>booth_output_12_EXMPLR, A1=>
      nx564, S0=>nx1507);
   ix565 : mux21_ni port map ( Y=>nx564, A0=>M(12), A1=>
      booth_output_13_EXMPLR, S0=>nx1513);
   ix884 : mux21_ni port map ( Y=>nx883, A0=>booth_output_13_EXMPLR, A1=>
      nx552, S0=>nx1507);
   ix553 : mux21_ni port map ( Y=>nx552, A0=>M(13), A1=>
      booth_output_14_EXMPLR, S0=>nx1513);
   ix874 : mux21_ni port map ( Y=>nx873, A0=>booth_output_14_EXMPLR, A1=>
      nx540, S0=>nx1479);
   ix541 : mux21_ni port map ( Y=>nx540, A0=>M(14), A1=>
      booth_output_15_EXMPLR, S0=>nx1513);
   ix864 : mux21_ni port map ( Y=>nx863, A0=>booth_output_15_EXMPLR, A1=>
      nx528, S0=>nx1479);
   ix529 : mux21_ni port map ( Y=>nx528, A0=>M(15), A1=>nx520, S0=>nx1513);
   ix854 : mux21_ni port map ( Y=>nx853, A0=>booth_output_16_EXMPLR, A1=>
      nx514, S0=>nx1479);
   ix515 : nor02ii port map ( Y=>nx514, A0=>nx1160, A1=>nx1513);
   ix534 : mux21_ni port map ( Y=>nx533, A0=>shift_Reg_count_0, A1=>nx1465, 
      S0=>nx1497);
   ix520 : and02 port map ( Y=>nx519, A0=>nx1521, A1=>shift_Reg_count_0);
   ix714 : mux21_ni port map ( Y=>nx713, A0=>shift_Reg_count_9, A1=>nx1447, 
      S0=>nx1497);
   ix704 : mux21_ni port map ( Y=>nx703, A0=>shift_Reg_count_9, A1=>
      shift_Reg_output_8, S0=>nx1501);
   ix694 : mux21_ni port map ( Y=>nx693, A0=>shift_Reg_count_8, A1=>
      shift_Reg_output_8, S0=>nx1497);
   ix684 : mux21_ni port map ( Y=>nx683, A0=>shift_Reg_count_8, A1=>
      shift_Reg_output_7, S0=>nx1503);
   ix674 : mux21_ni port map ( Y=>nx673, A0=>shift_Reg_count_7, A1=>
      shift_Reg_output_7, S0=>nx1497);
   ix664 : mux21_ni port map ( Y=>nx663, A0=>shift_Reg_count_7, A1=>
      shift_Reg_output_6, S0=>nx1503);
   ix654 : mux21_ni port map ( Y=>nx653, A0=>shift_Reg_count_6, A1=>
      shift_Reg_output_6, S0=>nx1497);
   ix644 : mux21_ni port map ( Y=>nx643, A0=>shift_Reg_count_6, A1=>
      shift_Reg_output_5, S0=>nx1503);
   ix634 : mux21_ni port map ( Y=>nx633, A0=>shift_Reg_count_5, A1=>
      shift_Reg_output_5, S0=>nx1497);
   ix624 : mux21_ni port map ( Y=>nx623, A0=>shift_Reg_count_5, A1=>
      shift_Reg_output_4, S0=>nx1503);
   ix614 : mux21_ni port map ( Y=>nx613, A0=>shift_Reg_count_4, A1=>
      shift_Reg_output_4, S0=>nx1499);
   ix604 : mux21_ni port map ( Y=>nx603, A0=>shift_Reg_count_4, A1=>
      shift_Reg_output_3, S0=>nx1503);
   ix594 : mux21_ni port map ( Y=>nx593, A0=>shift_Reg_count_3, A1=>
      shift_Reg_output_3, S0=>nx1499);
   ix584 : mux21_ni port map ( Y=>nx583, A0=>shift_Reg_count_3, A1=>
      shift_Reg_output_2, S0=>nx1503);
   ix574 : mux21_ni port map ( Y=>nx573, A0=>shift_Reg_count_2, A1=>
      shift_Reg_output_2, S0=>nx1499);
   ix564 : mux21_ni port map ( Y=>nx563, A0=>shift_Reg_count_2, A1=>
      shift_Reg_output_1, S0=>nx1503);
   ix554 : mux21_ni port map ( Y=>nx553, A0=>shift_Reg_count_1, A1=>
      shift_Reg_output_1, S0=>nx1499);
   ix544 : mux21_ni port map ( Y=>nx543, A0=>shift_Reg_count_1, A1=>nx1465, 
      S0=>nx1477);
   ix509 : xor2 port map ( Y=>nx508, A0=>nx1176, A1=>nx1423);
   ix834 : mux21_ni port map ( Y=>nx833, A0=>booth_output_18_EXMPLR, A1=>
      nx460, S0=>nx1479);
   ix461 : nor02ii port map ( Y=>nx460, A0=>nx1191, A1=>nx1513);
   ix1201 : xor2 port map ( Y=>nx1200, A0=>nx1204, A1=>nx452);
   ix814 : mux21_ni port map ( Y=>nx813, A0=>booth_output_20_EXMPLR, A1=>
      nx408, S0=>nx1479);
   ix410 : nor02ii port map ( Y=>nx408, A0=>nx1228, A1=>nx1515);
   ix1240 : xor2 port map ( Y=>nx1239, A0=>nx1243, A1=>nx400);
   ix794 : mux21_ni port map ( Y=>nx793, A0=>booth_output_22_EXMPLR, A1=>
      nx356, S0=>nx1479);
   ix357 : nor02ii port map ( Y=>nx356, A0=>nx1262, A1=>nx1515);
   ix1274 : xor2 port map ( Y=>nx1273, A0=>nx1277, A1=>nx348);
   ix774 : mux21_ni port map ( Y=>nx773, A0=>booth_output_24_EXMPLR, A1=>
      nx304, S0=>nx1477);
   ix305 : nor02ii port map ( Y=>nx304, A0=>nx1296, A1=>nx1515);
   ix1308 : xor2 port map ( Y=>nx1307, A0=>nx1311, A1=>nx296);
   ix754 : mux21_ni port map ( Y=>nx753, A0=>booth_output_26_EXMPLR, A1=>
      nx252, S0=>nx1477);
   ix253 : nor02ii port map ( Y=>nx252, A0=>nx1330, A1=>nx1515);
   ix1342 : xor2 port map ( Y=>nx1341, A0=>nx1345, A1=>nx244);
   ix734 : mux21_ni port map ( Y=>nx733, A0=>booth_output_28_EXMPLR, A1=>
      nx200, S0=>nx1477);
   ix201 : nor02ii port map ( Y=>nx200, A0=>nx1364, A1=>nx1515);
   ix1376 : xor2 port map ( Y=>nx1375, A0=>nx1379, A1=>nx192);
   ix1394 : xor2 port map ( Y=>nx1393, A0=>nx1397, A1=>nx166);
   ix825 : xor2 port map ( Y=>nx824, A0=>nx1397, A1=>nx1412);
   ix1496 : buf02 port map ( Y=>nx1497, A=>nx1140);
   ix1498 : buf02 port map ( Y=>nx1499, A=>nx1140);
   ix1500 : inv02 port map ( Y=>nx1501, A=>nx1521);
   ix1502 : inv02 port map ( Y=>nx1503, A=>nx1521);
   ix1504 : inv02 port map ( Y=>nx1505, A=>nx1521);
   ix1506 : inv02 port map ( Y=>nx1507, A=>nx1523);
   ix1508 : inv02 port map ( Y=>nx1509, A=>shift_reg_output_0);
   ix1510 : inv02 port map ( Y=>nx1511, A=>shift_reg_output_0);
   ix1512 : inv02 port map ( Y=>nx1513, A=>shift_reg_output_0);
   ix1514 : inv02 port map ( Y=>nx1515, A=>shift_reg_output_0);
   ix1520 : inv02 port map ( Y=>nx1521, A=>nx1473);
   ix1522 : inv02 port map ( Y=>nx1523, A=>nx1473);
end my_booth_integration ;


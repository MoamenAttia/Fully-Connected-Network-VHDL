library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Utiles.ALL;

entity TestnMax is
end TestnMax;

architecture TestBenchArch of TestnMax is
  type tests16bits is array (199 downto 0) of genericArrayofVector16bit(9 downto 0);
  signal inputArray : genericArrayofVector16bit(9 downto 0);
  signal inputArrayagain : tests16bits;
  signal clk,start,done,rst : std_logic;
  signal outlabel: STD_LOGIC_VECTOR(3 DOWNTO 0);
  type resultsType is array(199 downto 0) of std_logic_vector(3  downto 0);
  signal results: resultsType;
begin
  maxEnt : entity work.ngetMax generic map(16,10) port map (inputArray,start,clk,rst,outlabel,done); --modified

  process
  begin
    inputArrayagain <= 
        ( ( x"5d1b", x"8e53", x"e3b9", x"2ec0", x"50af", x"afaf", x"bdc7", x"c17d", x"3e0d", x"fe29"), ( x"7eff", x"5d58", x"aca3", x"eb1e", x"3932", x"056c", x"7a2b", x"d391", x"43ad", x"f8b7"), ( x"b970", x"6b58", x"b27e", x"a8c4", x"991d", x"7f48", x"fb47", x"0fb1", x"5c28", x"25a3"), ( x"edb1", x"3668", x"2364", x"d040", x"575b", x"01b8", x"9e3b", x"b4de", x"2289", x"0ee3"), ( x"28f4", x"3780", x"29ff", x"fd3f", x"63a6", x"9a86", x"3299", x"d057", x"5a7a", x"7472"), ( x"a91f", x"9879", x"bfd7", x"1f82", x"9666", x"3227", x"5d2d", x"986b", x"f17a", x"e7f7"), ( x"54ee", x"6891", x"db04", x"be1f", x"320d", x"231c", x"24a7", x"7455", x"24f9", x"e7d7"), ( x"5c51", x"c817", x"d077", x"18da", x"82ca", x"5e19", x"e410", x"bb24", x"3152", x"baf2"), ( x"2b51", x"47b1", x"dc9e", x"63e1", x"431b", x"aa50", x"20f6", x"d449", x"80f9", x"75c5"), ( x"55c9", x"3a2a", x"a645", x"f583", x"55db", x"7927", x"1c05", x"c4ad", x"e74f", x"0f2e"), ( x"88a2", x"2d80", x"04f5", x"3bca", x"c490", x"913c", x"5082", x"9217", x"d81d", x"6908"), ( x"9dd9", x"febd", x"f20d", x"3e82", x"6fa8", x"ba33", x"3639", x"ecc4", x"ea26", x"9d2e"), ( x"ffec", x"5348", x"ecb4", x"1198", x"fdcb", x"5fb0", x"367a", x"cfb7", x"b3e6", x"7b48"), ( x"8d5f", x"a655", x"9588", x"8034", x"1e36", x"3ce9", x"f67b", x"a420", x"3db1", x"9040"), ( x"58dc", x"60ba", x"dec4", x"02bf", x"6996", x"f3f3", x"869f", x"4f6c", x"fa51", x"7924"), ( x"b4ec", x"7f3e", x"59ca", x"dcc7", x"6ba2", x"0f72", x"e50d", x"c15c", x"4d3e", x"b524"), ( x"40c0", x"fa03", x"5220", x"a63e", x"bc3d", x"0020", x"0e36", x"956c", x"f956", x"d036"), ( x"c6a2", x"ec3e", x"0e08", x"0b6a", x"4098", x"9acc", x"01f0", x"c2c2", x"07ca", x"1b65"), ( x"a81c", x"8000", x"5841", x"b4c5", x"209b", x"044c", x"2f1e", x"c460", x"509f", x"9d28"), ( x"a916", x"2958", x"a413", x"8911", x"e523", x"94e2", x"5d8a", x"1f0f", x"424c", x"12b0"), ( x"c629", x"24ec", x"17f1", x"7c2f", x"1453", x"6f2d", x"4d04", x"5ca9", x"dc0a", x"3812"), ( x"2db9", x"1361", x"d199", x"6e16", x"a037", x"dae4", x"8426", x"eb41", x"2f3c", x"bb63"), ( x"d78b", x"1444", x"e769", x"b247", x"0d5b", x"2a69", x"5386", x"43da", x"e89a", x"b5bd"), ( x"24f1", x"4ce0", x"eab7", x"25a8", x"2aa9", x"0135", x"3a66", x"5863", x"7141", x"0e02"), ( x"a21f", x"e3ab", x"3178", x"8b58", x"e714", x"6773", x"4b06", x"faad", x"4624", x"aa81"), ( x"14c8", x"a9aa", x"0259", x"bc7d", x"d1f0", x"8099", x"ae73", x"b741", x"b440", x"80eb"), ( x"2b3f", x"20be", x"1ea8", x"15ca", x"a250", x"51c8", x"c46d", x"6e5a", x"2e7c", x"c34d"), ( x"2413", x"34c0", x"a3e3", x"e823", x"e829", x"f310", x"61f2", x"8d37", x"2297", x"5b3e"), ( x"59e1", x"0a46", x"9f98", x"6be3", x"c798", x"275f", x"ed6f", x"0e2c", x"0c7b", x"8967"), ( x"d4ac", x"72dd", x"73e0", x"858d", x"980b", x"c66a", x"97f0", x"fa25", x"6f1b", x"0b7c"), ( x"2015", x"a039", x"72d2", x"b2d1", x"26b9", x"a289", x"ce42", x"79ca", x"e0f3", x"9933"), ( x"3c03", x"9612", x"e7f8", x"1e73", x"e0d0", x"e51a", x"dd07", x"d43e", x"11b6", x"044b"), ( x"4eae", x"b1ca", x"4f2c", x"bb24", x"fe5e", x"4e5e", x"f7d3", x"066a", x"c46d", x"92b8"), ( x"d2e0", x"6802", x"0f10", x"a469", x"6316", x"fd4f", x"5bff", x"0c65", x"fc05", x"c7aa"), ( x"f1e0", x"1106", x"fd08", x"104d", x"b126", x"dbf4", x"4840", x"41c4", x"d1d1", x"7274"), ( x"cc28", x"9fc4", x"b859", x"bcf1", x"095f", x"8304", x"898e", x"7c66", x"0acd", x"3467"), ( x"9628", x"14d5", x"2b59", x"c8db", x"73ce", x"7a90", x"bd96", x"7f6d", x"148c", x"1dd7"), ( x"4b41", x"5711", x"a4a5", x"f467", x"8cf9", x"9de1", x"ad87", x"959f", x"36cd", x"2931"), ( x"a794", x"7426", x"9697", x"1939", x"fee4", x"c78e", x"b198", x"d97d", x"c4c2", x"c50a"), ( x"61e2", x"a49b", x"6f00", x"5c6f", x"14ea", x"40e4", x"a4e1", x"398d", x"329c", x"530d"), ( x"5243", x"597e", x"7a84", x"7f11", x"03f2", x"6663", x"38f9", x"465c", x"4666", x"b556"), ( x"f5ae", x"fe61", x"b943", x"a233", x"9db3", x"10b2", x"2607", x"ee82", x"cdac", x"e91f"), ( x"7702", x"820f", x"7e7e", x"0d40", x"a730", x"04f1", x"bd01", x"071c", x"5cb6", x"04be"), ( x"f310", x"b244", x"07cd", x"f82e", x"9007", x"534d", x"4e32", x"0b41", x"a169", x"1646"), ( x"b750", x"a7ff", x"91d1", x"fcad", x"db66", x"05ae", x"48c6", x"21c2", x"7ef1", x"8158"), ( x"18c9", x"c462", x"ec3a", x"05bc", x"bf4d", x"cbd6", x"2dcb", x"0cc2", x"5474", x"bce7"), ( x"2cb2", x"159f", x"75e4", x"b2c8", x"db4d", x"7b8e", x"1aef", x"8361", x"b3e0", x"a67f"), ( x"56e1", x"0f0a", x"9437", x"0aa3", x"df5a", x"aa85", x"0281", x"595b", x"6ff4", x"6690"), ( x"c21e", x"d83e", x"53f4", x"58be", x"3e21", x"d186", x"0eca", x"164a", x"85ec", x"6c66"), ( x"1035", x"cfdd", x"91be", x"6377", x"de45", x"ce0b", x"3647", x"d1b0", x"7469", x"3661"), ( x"28a5", x"e69f", x"4a96", x"c167", x"8eaf", x"d266", x"bf62", x"7840", x"b469", x"2a10"), ( x"3e55", x"b822", x"ba0f", x"3ba1", x"61da", x"7897", x"2329", x"a78b", x"3207", x"1685"), ( x"4b25", x"d000", x"0288", x"43d3", x"8fce", x"f489", x"bcd8", x"346d", x"9d6c", x"1323"), ( x"3518", x"5139", x"b026", x"0344", x"a86a", x"c0e8", x"9a20", x"2515", x"94e5", x"ce40"), ( x"321a", x"e85b", x"904e", x"e2f5", x"dce0", x"42d3", x"4acf", x"44fb", x"5e93", x"22c0"), ( x"7493", x"b510", x"7bc4", x"d11e", x"3888", x"1d8a", x"065a", x"6c8c", x"b05f", x"fc77"), ( x"7306", x"267e", x"d563", x"f114", x"1da3", x"b7be", x"d68f", x"b5e1", x"a483", x"ae16"), ( x"8c28", x"586d", x"781f", x"c8f1", x"6a0a", x"38ec", x"06f8", x"9c51", x"297a", x"66fa"), ( x"f3f0", x"0852", x"e133", x"2261", x"d5fd", x"b882", x"97aa", x"b7c6", x"665b", x"eca7"), ( x"b595", x"130e", x"c694", x"369e", x"632a", x"7ca4", x"7a01", x"e51f", x"640b", x"2e3f"), ( x"d269", x"35b8", x"cd85", x"311d", x"d4aa", x"5c5d", x"c29e", x"24cc", x"cc16", x"575f"), ( x"c8e1", x"d5ac", x"b65a", x"13fd", x"3ac5", x"8e24", x"53ec", x"7cb4", x"9500", x"1cad"), ( x"393a", x"2b41", x"bac6", x"50e6", x"c86c", x"aa59", x"079e", x"489d", x"986c", x"0d13"), ( x"556b", x"b99d", x"077c", x"1175", x"3fa1", x"b4f6", x"a4a2", x"2cea", x"a01d", x"2a5c"), ( x"36db", x"0d13", x"c70c", x"1232", x"4bf5", x"9d10", x"0a6c", x"d910", x"4a86", x"80df"), ( x"4fae", x"2039", x"d5a4", x"d951", x"39d2", x"d017", x"1ea5", x"acee", x"f487", x"feb2"), ( x"71cc", x"49c2", x"fc3b", x"21f3", x"00e0", x"601b", x"c212", x"fef8", x"ec67", x"232b"), ( x"3c61", x"5ea7", x"dd4d", x"bd56", x"44c1", x"aa40", x"c77f", x"1c0f", x"bf85", x"8975"), ( x"486b", x"216b", x"f717", x"a03f", x"e9b3", x"4c2b", x"a2ec", x"d3f9", x"84a9", x"b213"), ( x"95fc", x"b788", x"570e", x"7900", x"bcd8", x"987a", x"4776", x"d642", x"06d1", x"5832"), ( x"c9d2", x"51f2", x"b85e", x"a738", x"5cbf", x"730d", x"27a9", x"5436", x"7ba5", x"b64b"), ( x"b104", x"9052", x"886d", x"4679", x"d969", x"af65", x"3307", x"3f0e", x"288b", x"905a"), ( x"ef06", x"4547", x"2b44", x"362d", x"0f31", x"a046", x"bd27", x"4b41", x"0cce", x"e146"), ( x"a08c", x"93bf", x"349b", x"4b09", x"db56", x"deec", x"7bc8", x"ef41", x"24e0", x"3022"), ( x"fcd7", x"81e2", x"dbd8", x"8d66", x"d1a2", x"e5b8", x"1dba", x"cb78", x"aeb2", x"8eab"), ( x"19e1", x"ad76", x"d2da", x"5cb0", x"11bf", x"c71b", x"772b", x"b537", x"28de", x"c2de"), ( x"3156", x"4206", x"ff1b", x"f71d", x"4701", x"5fb0", x"f55a", x"9e7b", x"9b0a", x"14a9"), ( x"0739", x"20cd", x"64ac", x"4329", x"e5a6", x"ff37", x"e5a6", x"acf9", x"a825", x"038b"), ( x"fd63", x"7da0", x"ad39", x"f0f8", x"e667", x"66d3", x"6965", x"1779", x"0868", x"785b"), ( x"0a48", x"42e4", x"c6f8", x"e91b", x"1800", x"3c99", x"2003", x"f395", x"443a", x"0301"), ( x"f957", x"61d6", x"1bea", x"d5ed", x"3b17", x"cef4", x"1083", x"e783", x"74cf", x"f146"), ( x"7a9b", x"62b2", x"655b", x"521a", x"731a", x"d859", x"30b4", x"b3aa", x"1adb", x"69ad"), ( x"2774", x"f5a4", x"6983", x"c131", x"75e8", x"7407", x"c574", x"4af7", x"e8f2", x"9b6d"), ( x"6059", x"c9b2", x"35d0", x"6c14", x"ad30", x"60cd", x"0895", x"2a57", x"6e7b", x"ada6"), ( x"cbf6", x"2af1", x"4704", x"738b", x"fddb", x"8318", x"4890", x"9a3d", x"0f9e", x"64da"), ( x"9027", x"300b", x"63b3", x"36c7", x"8402", x"c54e", x"1c49", x"f5b7", x"f9f1", x"b028"), ( x"bd29", x"3105", x"8015", x"c969", x"1c7f", x"52ed", x"7972", x"7d5a", x"91bb", x"3f10"), ( x"3d1d", x"e12b", x"b452", x"e923", x"7a68", x"c770", x"ec13", x"aea8", x"2dee", x"1698"), ( x"01d7", x"ce89", x"17d3", x"3227", x"fb58", x"7e54", x"738a", x"eeea", x"c011", x"1781"), ( x"8c76", x"d4ba", x"2843", x"da71", x"0558", x"806c", x"394b", x"c62e", x"8425", x"8082"), ( x"03ee", x"caae", x"121b", x"3e25", x"bda6", x"6945", x"9aab", x"f2d0", x"e49a", x"73e7"), ( x"b4d6", x"b2e7", x"569b", x"1e1f", x"ab31", x"21f3", x"ad21", x"66bd", x"eef4", x"eab4"), ( x"b40f", x"ee0b", x"e02e", x"3ebb", x"d1ff", x"8a35", x"273e", x"c19f", x"53ce", x"e997"), ( x"60e2", x"dea5", x"4c31", x"ebad", x"0fc0", x"0066", x"e0c1", x"098a", x"a36d", x"e90f"), ( x"2036", x"c0bc", x"0670", x"226e", x"c5a1", x"8d6e", x"5a50", x"3936", x"3005", x"f36a"), ( x"942e", x"4d1c", x"9918", x"47ba", x"bc7c", x"e39e", x"2fcc", x"ec82", x"0e38", x"dfe4"), ( x"0c0c", x"7310", x"f27d", x"483b", x"3baa", x"901f", x"8a3d", x"c154", x"6d5a", x"ce72"), ( x"5a84", x"ba5e", x"4ad9", x"fa38", x"5567", x"7c20", x"d228", x"961f", x"712d", x"3492"), ( x"6d69", x"6962", x"0ed3", x"1d33", x"a03d", x"6803", x"ed64", x"4c3c", x"d314", x"ca23"), ( x"f303", x"40e1", x"affd", x"27b0", x"5b99", x"ea3a", x"3dcd", x"4fae", x"4689", x"1ac3"), ( x"1368", x"1f6c", x"d944", x"c411", x"337b", x"86db", x"d954", x"bc36", x"d679", x"d411"), ( x"14f0", x"8e12", x"5dc3", x"c721", x"a835", x"4c9f", x"4ddf", x"8fe7", x"62a2", x"3bb0"), ( x"6e87", x"8df4", x"deb1", x"0b1d", x"ce22", x"8781", x"e841", x"2950", x"889d", x"0835"), ( x"d24c", x"41c2", x"8074", x"d8aa", x"2a2d", x"0fcc", x"023d", x"f9fd", x"df80", x"b282"), ( x"86aa", x"443f", x"1b28", x"966c", x"8421", x"ed66", x"345a", x"236d", x"f7a8", x"3a36"), ( x"888e", x"cb58", x"0d75", x"18fe", x"04f0", x"3877", x"acbf", x"6c23", x"2341", x"2c6f"), ( x"32a0", x"5865", x"a787", x"9ec4", x"cee1", x"d3ef", x"8f9c", x"962c", x"5109", x"2e7f"), ( x"ca00", x"1772", x"1657", x"40af", x"b269", x"fb2e", x"3903", x"1c4a", x"6ab6", x"48f4"), ( x"66c1", x"6bdf", x"1452", x"b00f", x"8ea6", x"48e2", x"cd6d", x"851f", x"83d1", x"ed8e"), ( x"29c6", x"b372", x"905c", x"ca1e", x"a248", x"2c44", x"ecfc", x"c544", x"143c", x"135b"), ( x"3352", x"a3c3", x"ffdb", x"168a", x"6a62", x"a847", x"dc49", x"c78a", x"7f00", x"cb0a"), ( x"abb7", x"7440", x"fbae", x"9443", x"0ba6", x"dcc7", x"373d", x"48d0", x"1a6c", x"5569"), ( x"f7a6", x"934d", x"d07b", x"6d3e", x"1868", x"b06c", x"6721", x"f85c", x"df26", x"3f15"), ( x"d4e4", x"57c3", x"1449", x"b346", x"87c9", x"9140", x"9b42", x"75a4", x"ff6c", x"0681"), ( x"7deb", x"9573", x"33d9", x"773a", x"2d2a", x"7a72", x"2423", x"1c1e", x"c9f8", x"d961"), ( x"d756", x"94dd", x"597d", x"08b3", x"1cc0", x"74b0", x"1e1a", x"99ed", x"e1f9", x"f2aa"), ( x"0e36", x"90bd", x"90a2", x"6c6c", x"d3af", x"1725", x"130c", x"32bd", x"0553", x"3632"), ( x"2d50", x"6e9c", x"4838", x"0c48", x"2091", x"fce6", x"ce92", x"90fe", x"9582", x"cbdc"), ( x"acb1", x"30f5", x"8b1e", x"ae77", x"aeb6", x"2362", x"7d90", x"54d1", x"1fd8", x"4212"), ( x"dea1", x"1083", x"bb91", x"7efe", x"bf43", x"d7f2", x"a069", x"03cb", x"c69c", x"702d"), ( x"8970", x"20b2", x"0d1e", x"0415", x"a4fe", x"e15c", x"8c38", x"edc0", x"c06c", x"6957"), ( x"c179", x"cffa", x"6dfb", x"c7e9", x"199d", x"d8cc", x"fdb6", x"8887", x"a5d8", x"3a88"), ( x"64ed", x"c69d", x"b3be", x"3a86", x"7df2", x"6bd3", x"0934", x"5a7a", x"9455", x"4579"), ( x"c44f", x"e8a0", x"09ab", x"752d", x"f783", x"6ad4", x"3821", x"d83b", x"934b", x"f65e"), ( x"03fa", x"c581", x"7e5e", x"c824", x"534a", x"ef0a", x"2d95", x"0a44", x"dfe0", x"591b"), ( x"c8d3", x"07bc", x"bfbc", x"e7b6", x"b4fc", x"49d3", x"32ed", x"a5f2", x"0ee3", x"df79"), ( x"1486", x"9782", x"f46c", x"052d", x"85a1", x"d777", x"456e", x"5bdf", x"59eb", x"ec41"), ( x"9813", x"af90", x"93b2", x"aa68", x"c61b", x"f9dc", x"acd8", x"cfde", x"432e", x"95c6"), ( x"c5d6", x"0ab0", x"d59f", x"2c24", x"5a42", x"bb84", x"80ac", x"a0cc", x"7609", x"232e"), ( x"e0a1", x"852b", x"a1fb", x"01fb", x"72cf", x"e2cc", x"9a0b", x"711f", x"17c8", x"f39f"), ( x"28d2", x"0297", x"c903", x"de6b", x"d5e0", x"7ea0", x"f612", x"0378", x"7326", x"552c"), ( x"489f", x"bfe4", x"a898", x"ed8f", x"6b58", x"e1b2", x"94a3", x"4b3b", x"a863", x"e6d3"), ( x"e7e5", x"f9be", x"5d0b", x"8934", x"eff3", x"35c3", x"1240", x"b7dc", x"6a65", x"0f08"), ( x"bbd3", x"0240", x"d4eb", x"548b", x"3267", x"b8a5", x"2758", x"bed6", x"d985", x"6e30"), ( x"99a9", x"464d", x"dc07", x"789c", x"4309", x"8703", x"331b", x"64c3", x"3f01", x"d544"), ( x"fc1b", x"37fa", x"e7f4", x"8c4c", x"540d", x"076a", x"0fdf", x"7ab9", x"f421", x"6864"), ( x"0aa9", x"c90c", x"a4dd", x"acb6", x"b6ce", x"747c", x"232d", x"f923", x"1cda", x"30f5"), ( x"7a2a", x"ab9b", x"9f94", x"b99e", x"83b0", x"6899", x"af80", x"2ea8", x"1dcd", x"3cc7"), ( x"0e6a", x"fed7", x"6039", x"16f0", x"f616", x"116a", x"c718", x"7668", x"1f07", x"97d5"), ( x"d633", x"03e9", x"ee5d", x"39f0", x"3af7", x"f1c5", x"237a", x"8acf", x"ce0d", x"2752"), ( x"f97c", x"39ff", x"8571", x"3a6c", x"add2", x"8b0b", x"b94f", x"3c2c", x"9001", x"563f"), ( x"1857", x"bc3c", x"72db", x"04a2", x"5193", x"1b7b", x"5cb2", x"c84f", x"5c28", x"5097"), ( x"0b41", x"6615", x"8900", x"69ec", x"1ee9", x"e53b", x"6b36", x"18cf", x"67f2", x"c978"), ( x"d4a7", x"bbd1", x"854a", x"6058", x"bad4", x"b317", x"c836", x"e085", x"fa94", x"5f8d"), ( x"8e2e", x"8973", x"b9fe", x"64d1", x"8084", x"070d", x"1965", x"a77d", x"dc12", x"bae8"), ( x"8c25", x"277f", x"d34d", x"ff42", x"6227", x"ea9e", x"4523", x"de61", x"bd9d", x"c2bb"), ( x"231f", x"e9ce", x"51f5", x"fba0", x"9dac", x"c384", x"b466", x"ad78", x"c14b", x"e950"), ( x"4d8a", x"6e39", x"deb5", x"a6a0", x"91cd", x"c36f", x"90b1", x"aa57", x"7980", x"c3c3"), ( x"79b7", x"c954", x"7e8b", x"e43c", x"32e7", x"1f6f", x"dddb", x"bb34", x"96e4", x"b4be"), ( x"9351", x"0db8", x"d50e", x"d59c", x"84fc", x"1d7f", x"60a3", x"28a2", x"c165", x"dddd"), ( x"a00f", x"9916", x"cb92", x"aed6", x"4ef2", x"dc97", x"0c21", x"f44d", x"a75e", x"100b"), ( x"095f", x"6f6f", x"8b44", x"dadc", x"752c", x"3da4", x"29d1", x"1327", x"e564", x"ec70"), ( x"37fd", x"e148", x"1e9e", x"ae2e", x"b410", x"94a2", x"ebd4", x"6451", x"34e4", x"082e"), ( x"05af", x"4dc8", x"35ec", x"a720", x"09f8", x"b08b", x"d4ae", x"13bc", x"b705", x"0193"), ( x"fd77", x"3334", x"664a", x"31fd", x"38ed", x"4cd1", x"346f", x"a8dd", x"9bdc", x"414d"), ( x"fede", x"372b", x"3594", x"6495", x"2053", x"0881", x"1cf4", x"a6c4", x"1e90", x"e61e"), ( x"1182", x"2657", x"2ad5", x"2f5c", x"dbfd", x"137f", x"9d89", x"211c", x"0856", x"90ba"), ( x"ee82", x"f3d3", x"b7fa", x"39e0", x"8d56", x"649e", x"d208", x"1b80", x"6c16", x"ef55"), ( x"cd31", x"606a", x"564e", x"2af0", x"80f0", x"df0e", x"b9c3", x"6995", x"439e", x"7801"), ( x"7e58", x"a412", x"1a8f", x"e994", x"d14f", x"5efa", x"930e", x"5ac6", x"f866", x"b069"), ( x"db34", x"eabd", x"e8cd", x"287b", x"5b56", x"2c6b", x"d45a", x"bdd6", x"b652", x"3383"), ( x"eb65", x"2be6", x"c601", x"10cb", x"4125", x"12a3", x"210e", x"4ceb", x"ce48", x"f37f"), ( x"2402", x"d74b", x"4187", x"1ba6", x"dd89", x"3fcb", x"0a06", x"6b68", x"c859", x"87f7"), ( x"5c9f", x"9c3f", x"445f", x"169d", x"0456", x"6567", x"c922", x"1d4b", x"70a2", x"cccc"), ( x"2eb2", x"e066", x"27fb", x"00b5", x"3e83", x"93fa", x"06b9", x"fd60", x"5b41", x"8b35"), ( x"8930", x"8d62", x"b8a9", x"c871", x"94f0", x"53d3", x"ab10", x"c822", x"0af7", x"6b31"), ( x"33ec", x"774a", x"d688", x"f589", x"0e90", x"45cb", x"229f", x"2472", x"f8af", x"37b5"), ( x"2f72", x"3017", x"94d4", x"d4be", x"b31f", x"4228", x"f317", x"3113", x"6dd4", x"0617"), ( x"f893", x"e652", x"dc6a", x"8903", x"39a8", x"659a", x"939a", x"4ba0", x"3d2a", x"3865"), ( x"1acd", x"b9ed", x"d9a6", x"3b39", x"a10d", x"f722", x"a977", x"108b", x"f2ff", x"9357"), ( x"8641", x"38c4", x"ebba", x"72ce", x"d5fc", x"fcab", x"e8c8", x"be93", x"b526", x"edad"), ( x"ccc2", x"e5c5", x"c0a2", x"b8c5", x"e291", x"02a3", x"4d87", x"2af5", x"9219", x"6652"), ( x"1ea4", x"a5ff", x"030d", x"e197", x"f3aa", x"4238", x"db3b", x"9b02", x"5270", x"f8d8"), ( x"704a", x"dcca", x"4cd9", x"18fb", x"7535", x"8364", x"8972", x"6bf0", x"0b85", x"56c1"), ( x"9abc", x"feb6", x"4d0b", x"73d7", x"4706", x"d8ba", x"8fe1", x"f4f8", x"ecae", x"cf81"), ( x"f160", x"d638", x"68e8", x"c626", x"72d3", x"7ad3", x"5f7f", x"36e4", x"ebc8", x"3448"), ( x"b4bd", x"a43c", x"7878", x"da0c", x"a7dc", x"707e", x"3601", x"4ac0", x"2788", x"b3dd"), ( x"8096", x"4e48", x"1c9e", x"830e", x"5a1f", x"23a5", x"93c7", x"ca1f", x"bf2e", x"ebce"), ( x"8a2b", x"a70f", x"7728", x"168b", x"d81d", x"740d", x"b028", x"4cd5", x"3092", x"0566"), ( x"7d05", x"c408", x"f9b5", x"f2ec", x"a12e", x"22c7", x"9618", x"c761", x"dcb3", x"59cd"), ( x"adaf", x"db7c", x"0bee", x"551b", x"f020", x"e12a", x"cdc5", x"619c", x"2841", x"9aeb"), ( x"9f10", x"a9cd", x"c635", x"49c9", x"e6aa", x"2bd1", x"1ad0", x"95b1", x"5ac0", x"b50e"), ( x"d5aa", x"45ac", x"ae24", x"7df4", x"20e7", x"24f5", x"d95a", x"c359", x"ea0a", x"0595"), ( x"85df", x"a4a0", x"4ed0", x"bf65", x"6cdc", x"4950", x"d083", x"0e89", x"e7d0", x"2238"), ( x"d3c4", x"0393", x"dcc3", x"c6fc", x"48ac", x"5265", x"4b56", x"6d40", x"57d4", x"3cf7"), ( x"dfef", x"43f5", x"d0f7", x"5921", x"3228", x"3523", x"5d76", x"479d", x"0bea", x"7b70"), ( x"3a06", x"b432", x"c1fd", x"7e4d", x"b732", x"cf8c", x"7ae5", x"fe11", x"e795", x"78bd"), ( x"a5be", x"d451", x"6316", x"88a0", x"f079", x"248f", x"81fb", x"0c86", x"6072", x"9407"), ( x"1bce", x"68ea", x"15be", x"02cd", x"a3bb", x"5b60", x"0958", x"6027", x"d70f", x"fd58"), ( x"77a9", x"cfff", x"10fa", x"c13e", x"ca10", x"de0a", x"de9c", x"61ea", x"4246", x"1edd"), ( x"c7d6", x"67da", x"804f", x"bee6", x"ab6c", x"799c", x"7811", x"3763", x"891d", x"97d2"), ( x"d898", x"dbf6", x"ec54", x"6481", x"3b8c", x"ac34", x"71bf", x"052f", x"2f3b", x"dc8d"), ( x"790b", x"8289", x"921f", x"eceb", x"4726", x"1250", x"6e02", x"afd4", x"e4a3", x"cecd"), ( x"a563", x"34ad", x"9757", x"4530", x"3193", x"54d0", x"122d", x"b2ca", x"d881", x"d3ce"), ( x"f9c9", x"0d37", x"a6f4", x"034b", x"e1d0", x"3251", x"89e0", x"8d73", x"7025", x"3347"), ( x"8afc", x"557e", x"daad", x"994e", x"0d44", x"401b", x"5e52", x"c90a", x"3225", x"4c02"), ( x"c43b", x"343e", x"9aca", x"6bff", x"ac51", x"36d2", x"e536", x"1f15", x"7e19", x"44e2"), ( x"15ad", x"5477", x"a58f", x"6b78", x"ed19", x"3589", x"5191", x"bb70", x"5036", x"bc24"), ( x"bcc4", x"e626", x"c5fd", x"70a8", x"278f", x"edb3", x"4c4a", x"9723", x"8349", x"457f"), ( x"1ef7", x"2ce7", x"aef8", x"cca7", x"51e3", x"9b93", x"799b", x"b9a9", x"19db", x"49e8"));

    


    
    results <= 
        ( x"9", x"9", x"4", x"5", x"0", x"3", x"2", x"4", x"0", x"4", x"0", x"5", x"0", x"1", x"0", x"8", x"7", x"5", x"7", x"3", x"6", x"6", x"3", x"1", x"4", x"9", x"2", x"3", x"6", x"7", x"2", x"9", x"7", x"8", x"0", x"2", x"2", x"8", x"8", x"7", x"6", x"3", x"7", x"4", x"1", x"1", x"4", x"1", x"0", x"1", x"2", x"4", x"9", x"8", x"1", x"7", x"9", x"7", x"1", x"4", x"4", x"2", x"6", x"9", x"5", x"9", x"9", x"8", x"4", x"6", x"1", x"6", x"2", x"3", x"3", x"3", x"4", x"7", x"8", x"1", x"1", x"9", x"5", x"1", x"6", x"7", x"2", x"5", x"4", x"3", x"0", x"2", x"1", x"9", x"3", x"8", x"8", x"4", x"9", x"5", x"5", x"1", x"9", x"8", x"8", x"2", x"8", x"1", x"8", x"4", x"1", x"8", x"6", x"2", x"9", x"4", x"6", x"8", x"3", x"6", x"0", x"7", x"5", x"6", x"7", x"4", x"2", x"1", x"1", x"5", x"4", x"5", x"1", x"0", x"6", x"2", x"4", x"9", x"2", x"5", x"0", x"7", x"3", x"6", x"6", x"5", x"7", x"1", x"7", x"3", x"5", x"5", x"2", x"8", x"7", x"6", x"6", x"1", x"0", x"9", x"5", x"2", x"2", x"1", x"1", x"0", x"8", x"1", x"4", x"6", x"6", x"0", x"1", x"5", x"6", x"4", x"7", x"5", x"7", x"9", x"2", x"1", x"6", x"5", x"2", x"0", x"6", x"7", x"8", x"9", x"4", x"3", x"9", x"4", x"1", x"3", x"1", x"6", x"6", x"3");
    

    start <= '0';
    rst<='1';
    inputArray <= (x"0000",x"0000",x"0000",x"0000",x"0000",x"0000",x"0000",x"0000",x"0000",x"0000");
    wait for 100 ns;
    rst<='0';
    wait for 100 ns;
    l1: for i in 199 downto 0 loop
          inputArray <= inputArrayagain(i);
          rst<='0';
          start <= '1';
          wait for 1000 ns;  --modified
          assert outlabel = results(i)
          report "Fail out label "
          severity error;
          
          assert done = '1'
          report "Fail Done "
          severity error;
          rst<='1';
          start <= '0';
          wait for 100 ns;
    end loop;
   report "TestDone";
   wait;
  end process;

  process
  begin
    clk <= '0';
    wait for 50 ns;
    clk <= '1';
    wait for 50 ns;
  end process;
end TestBenchArch;


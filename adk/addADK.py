import sys

with open(sys.argv[1],'r') as f1:
	lines = f1.read().split('\n')
	with open(sys.argv[1][:-4]+'1'+'.vhd','w') as f2:
		for line in lines:
			f2.write(line+'\n')
			if(line == "use IEEE.STD_LOGIC_1164.all;"):
				f2.write("use work.adk_components.all;\n")
		

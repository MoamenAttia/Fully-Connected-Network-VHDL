import random
import bitstring as BS


tc = 200

toFloat = lambda a,b : a/2.**b
toInt = lambda a,b : int(a*2**b)
truncate = lambda b: BS.pack('int:32=a',a=b)[32-16:].int



op1 = [] ,op2 =[]
for i in range(tc):
	op1.append(BS.pack('int:16=a',a=random.randint(-(1<<15),(1<<15)-1)))
	op2.append(BS.pack('int:16=a',a=random.randint(-(1<<15),(1<<15)-1)))


muls = []


for i in range(tc):
    tmp = (op1[i].int * op2[i].int)
    muls.append(BS.pack('int:16=a',a=tmp))



outputhex = [("op1 16 bit in hex",op1),("op2 16 bit in hex",op2)
        ,("multiplication in hex",muls)]

with open("out.txt",'w') as f:
    for out in outputhex:
        f.write(str(out[0])+'\n')
        for i in range(tc):
            f.write("x\"" + str(out[1][i].hex) +"\", ")
        f.write('\n\n')

    outputfloat = [("op1 16 bit in float",bytes),("op2 16 bit in float",words)
            ,("multiplication in float",muls)]

    for out in outputfloat:
        f.write(out[0]+'\n')
        for i in range(tc):
            f.write(str(out[1][i].int)+" ")
        f.write('\n\n')

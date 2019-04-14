import random
import bitstring as BS

byte_n = 200
word_n = 200
byte_float_bits = 6
word_float_bits = 8


toFloat = lambda a,b : a/2.**b
toInt = lambda a,b : int(a*2**b)
truncate = lambda b: BS.pack('int:32=a',a=b)[32-16:].int

bytes = []
for i in range(byte_n):
    tmp = random.randint(-(1<<7),(1<<7)-1)
    bytes.append(BS.pack('int:8=a',a=tmp))


words = []
for i in range(byte_n):
    tmp = random.randint(-(1<<15),(1<<15)-1)
    words.append(BS.pack('int:16=a',a=tmp))


muls = []
accums = []

for i in range(byte_n):
    tmp = (bytes[i].int * words[i].int)>>byte_float_bits
    muls.append(BS.pack('int:16=a',a=truncate(tmp)))
    add = accums[i-1].int if i >0 else 0
    accums.append(BS.pack('int:16=a',a=truncate(add + muls[i].int)))


outputhex = [("op1 8 bit in hex",bytes),("op2 16 bit in hex",words)
        ,("multiplication in hex",muls),("acumulation 16 bit in hex",accums)]

with open("out.txt",'w') as f:
    for out in outputhex:
        f.write(str(out[0])+'\n')
        for i in range(byte_n):
            f.write("x\"" + str(out[1][i].hex) +"\", ")
        f.write('\n\n')

    outputfloat = [("op1 8 bit in float",bytes),("op2 16 bit in float",words)
            ,("multiplication in float",muls),("acumulation 16 bit in float",accums)]

    for out in outputfloat:
        f.write(out[0]+'\n')
        for i in range(byte_n):
            fp = byte_float_bits if(out[0].find('8')!=-1) else 8
            f.write(str(toFloat(out[1][i].int,fp))+" ")
        f.write('\n\n')

#with open("out.txt","w") as f:
#    print [b.hex for b in words]

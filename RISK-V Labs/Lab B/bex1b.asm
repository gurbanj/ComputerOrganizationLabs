a: DD b
c: DD d

ORG 0x1000100010001000
ORG 0x1000100010001100

b: DD 0x2222333344445555
d: DD 0x1111222233334444

ld x5, a(x0)
ld x6, 0(x5)
ld x8, c(x0)
ld x7, 0(x8)

add x28, x6, x7
sub x29, x6, x7
xor x30, x6, x7
or x31, x6, x7





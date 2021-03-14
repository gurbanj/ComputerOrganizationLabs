c1: DF  1.21, 5.85, -7.3, 23.1, -5.55
c2: DF  3.14, -2.1, 44.2, 11.0, -7.77
        addi x8, x0, 40
	addi x5, x0, 0
        addi x6, x0, 0
loop:   fld f1, c1(x5)
        fld f2, c2(x6)
        fmul.d f3,f1,f2
        fadd.d f4, f4, f3
	fsd f4, d(x0)
        addi x5,x5,8
        addi x6,x6,8

bne x5, x8, loop
d: DM 1
        
     
a: DC "Find all divisors.\0"
b: DC "Enter i: \0"
c: DC "Divisors: " 
d: DC "Prime"
e: DC "Not a prime"


addi x12, x0, 2
addi x5, x0, a
ecall x0, x5, 4
addi x5, x0, b
ecall x1, x5, 4
ecall x6, x0, 5
addi x5, x0, c
ecall x0, x5, 4
addi x9, x6, 1

loop: addi x7, x7, 1
      rem x8, x6, x7
      beq x7, x9, end
      beq x8, x0, branch
      bne x7, x6, loop

branch: ecall x0, x7, 0
	sd x7, dst(x10)
	addi x10, x10, 8
        addi x11, x11, 1
	beq x0, x0, loop

end: ebreak x0, x0, 0
 
addi x5, x0, d

beq x11, x12, else
else: ecall x0, x5, 4

dst: DM 1
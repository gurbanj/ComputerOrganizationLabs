str1:  DC "sampled text\0 "
str2:  DC "new text\0"
STACK: EQU 0x100000 ;stack
       lui sp, STACK>>12
       addi a2, x0, str1 ;chaddr (pos 1)
       addi a3, x0, 0 ;#ch
       addi a4, x0, str2 ;chaddr
       sb x0, 0(a2) ;emty str1
       jal x1, repch
       addi x6, x0, str1 ;output
       ecall x0, x6, 4

delch1: lb x5, 0(a2)
loop1:  beq x5, x0, end1
        lb x5, 1(a2)
        sb x5, 0(a2)
        addi a2, a2, 1
        jal x0, loop1
end1: jalr x0, 0(x1) ;return

delch: sd   x1, 0(sp) ;push
       sd   s0, -8(sp) ;push
       sd   s1, -16(sp) ;push
       addi sp, sp, -24 ;push
       addi s0, a2, 0
       addi s1, a3, 0
       bge  x0, s1, end2
loop2: jal  x1, delch1
       addi a2, s0, 0
       addi s1, s1, -1
       bne  s1, x0, loop2
end2:  addi sp, sp, 24 ;pop
       ld   x1, 0(sp) ;pop
       ld   s0, -8(sp) ;pop
       ld   s1, -16(sp) ;pop
       jalr x0, 0(x1) ;return

insch1: lb   x5, 0(a2)
        sb   a3, 0(a2)
        addi a3, x5, 0
        addi a2, a2, 1
        bne  a3, x0, insch1
        sb   a3, 0(a2)
        jalr x0, 0(x1)

insch: sd   x1, 0(sp) ;push
       sd   s0, -8(sp) ;push
       sd   s1, -16(sp) ;push
       addi sp, sp, -24 ;push
       addi s0, a2, 0
       addi s1, a3, 0
loop3: lb   a3, 0(s1)
       beq  a3, x0, end3
       jal  x1, insch1
       addi s0, s0, 1
       addi a2, s0, 0
       addi s1, s1, 1
       beq  x0, x0, loop3
end3:  addi sp, sp, 24 ;pop
       ld   x1, 0(sp) ;pop
       ld   s0, -8(sp) ;pop
       ld   s1, -16(sp) ;pop
       jalr x0, 0(x1) ;return

repch: sd x1, 0(sp) ;push
       sd s0, -8(sp) ;push
       sd s1, -16(sp) ;push
       addi sp, sp, -24 ;push
       addi s0, a2, 0
       addi s1, a4, 0
       jal x1, delch
       addi a2, s0, 0
       addi a3, a4, 0
       jal x1, insch
       addi sp, sp, 24 ;pop
       ld x1, 0(sp) ;pop
       ld s0, -8(sp) ;pop
       ld s1, -16(sp) ;pop
       jalr x0, 0(x1) ;return
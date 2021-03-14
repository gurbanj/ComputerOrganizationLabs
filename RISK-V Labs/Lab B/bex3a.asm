s1: DC "What is you name?\0"
s2: DC "Hello " ;
    addi x5, x0, s1
    ecall x0, x5, 4 ;ask for name
    addi x6, x0, s3
    ecall x6, x0, 9 ;input a name
    ld x5, s2(x0)
    ecall x1, x5, 3 ;hello
    ecall x1, x6, 4 ;name
    addi x5, x0, 0x21 ;0x21 for !
    ecall x1, x5, 3 ;
s3: DM 1





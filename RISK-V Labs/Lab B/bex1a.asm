c: DD 1024, 2048, 4096, 8192
d: DD 1
ld x5, 0(x0)
ld x6, 8(x0)
ld x7, 16(x0)
ld x8, 24(x0)
add x9, x5, x6
add x9, x9, x7
add x9, x9, x8
srli x10, x9, 2
sd x10, d(x20)
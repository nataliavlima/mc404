# chama o robo
li a0, 0x110

# imprime 1
li a1, 0
li a2, 0x0
ecall

li a1, 1
li a2, 0x0
ecall

li a1, 2
li a2, 0x03e0
ecall

li a1, 3
li a2, 0x0080
ecall

li a1, 4
li a2, 0x0080
ecall

li a1, 5
li a2, 0x0080
ecall

li a1, 6
li a2, 0x0280
ecall

li a1, 7
li a2, 0x0180
ecall

li a1, 8
li a2, 0x0080
ecall

li x0, 0 # encerra ou limpa
li x0, 0

call pausa

# imprime 8

li a1, 0
li a2, 0x0
ecall

li a1, 1
li a2, 0x0
ecall

li a1, 2
li a2, 0x03c0
ecall

li a1, 3
li a2, 0x0240
ecall

li a1, 4
li a2, 0x0240
ecall

li a1, 5
li a2, 0x03c0
ecall

li a1, 6
li a2, 0x0240
ecall

li a1, 7
li a2, 0x0240
ecall

li a1, 8
li a2, 0x03c0
ecall

li x0, 0 # encerra
li x0, 0

call pausa

# imprime 5

li a1, 0
li a2, 0x0
ecall

li a1, 1
li a2, 0x0
ecall

li a1, 2
li a2, 0x03c0
ecall

li a1, 3
li a2, 0x0040
ecall

li a1, 4
li a2, 0x0040
ecall

li a1, 5
li a2, 0x03c0
ecall

li a1, 6
li a2, 0x0200
ecall

li a1, 7
li a2, 0x0200
ecall

li a1, 8
li a2, 0x03c0
ecall

li x0, 0 # encerra
li x0, 0

call pausa

# imprime 4

li a1, 0
li a2, 0x0
ecall

li a1, 1
li a2, 0x0
ecall

li a1, 2
li a2, 0x0040
ecall

li a1, 3
li a2, 0x0040
ecall

li a1, 4
li a2, 0x0040
ecall

li a1, 5
li a2, 0x03c0
ecall

li a1, 6
li a2, 0x0240
ecall

li a1, 7
li a2, 0x0240
ecall

li a1, 8
li a2, 0x0240
ecall

li x0, 0 # encerra
li x0, 0

call pausa
# imprime 8

li a1, 0
li a2, 0x0
ecall

li a1, 1
li a2, 0x0
ecall

li a1, 2
li a2, 0x03c0
ecall

li a1, 3
li a2, 0x0240
ecall

li a1, 4
li a2, 0x0240
ecall

li a1, 5
li a2, 0x03c0
ecall

li a1, 6
li a2, 0x0240
ecall

li a1, 7
li a2, 0x0240
ecall

li a1, 8
li a2, 0x03c0
ecall

li x0, 0 # encerra
li x0, 0

call pausa
# imprime 3

li a1, 0
li a2, 0x0
ecall

li a1, 1
li a2, 0x0
ecall

li a1, 2
li a2, 0x03c0
ecall

li a1, 3
li a2, 0x0040
ecall

li a1, 4
li a2, 0x0040
ecall

li a1, 5
li a2, 0x03c0
ecall

li a1, 6
li a2, 0x0040
ecall

li a1, 7
li a2, 0x0040
ecall

li a1, 8
li a2, 0x03c0
ecall

li x0, 0 # encerra
li x0, 0
call pausa

fim:
    li a0, 10
    ecall          # Encerra o programa
    ret

pausa:
    li t0, -1
    li t1, 1000
loop:
    addi t0, t0, 1
    bne t0, t1, loop
    ret
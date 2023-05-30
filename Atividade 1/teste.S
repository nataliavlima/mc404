.data
vetor1: .word 0x0, 0x0, 0x000f, 0x0002, 0x0002,0x0002, 0x000a, 0x0006, 0x0002
vetor0: .word 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
vetor8: .word 0x0, 0x0, 0x000f, 0x0009, 0x0009,0x000f, 0x0009, 0x0009, 0x000f

.text

main:
    # chama o robo
    li a0, 0x110
    la a3, vetor1
    call imprime1
    #call pausaCurta

    li s1, 0
    li s2, 16
for: 
    la a3, vetor1
    call shift1
    #call imprime0
    la a3, vetor1
    call imprime1
    call pausaCurta

    addi s1, s1, 1
    bne s1, s2, for
    beq s1, s2, imprime8
    ret

imprime8:
    la a3, vetor8
    call imprime1
    #call pausaCurta

    li s1, 0
    li s2, 16
for90: 
    la a3, vetor8
    call shift1
    #call imprime0
    la a3, vetor8
    call imprime1
    call pausaCurta

    addi s1, s1, 1
    bne s1, s2, for90

fim:
    li a0, 10
    ecall          # Encerra o programa
    ret

imprime1:
    
    li t0, 9
    li t1, 36

    li a1, 0
for1:
    lw a2, 0(a3)
    ecall

    addi a1, a1, 1
    addi a3, a3, 4

    bne a1, t0, for1
    #call pausaCurta

    li a1, 0
    lw a2, 0(a3)

    ret

pausaCurta:
    li t0, -1
    li t1, 100
loop2:
    addi t0, t0, 1
    bne t0, t1, loop2
    ret


shift1:
    li a1, 0
    li t0, 9

    
for3: 
    lw a2, 0(a3)
    slli a2, a2, 1

    sw a2, 0(a3)
    addi a3, a3, 4
    addi a1, a1, 1

    bne a1, t0, for3
ret


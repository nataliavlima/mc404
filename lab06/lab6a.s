.data
vetor: 
    .word 10
    .word 20
    .word 30
    .word 40
    .word 50
.text


Multiplica:
    addi sp, sp, -8
    sw   s0, sp, 4
    sw   ra, sp, 0
    
    mv s0, a0   
	mv s1, a1
    addi s1, s1, -1

loop:
    beq s1, zero, fimMultiplica 
    add s0, s0, a0
    addi s1, s1, -1
    j loop

fimMultiplica:
    mv a0, s0

    lw   ra, sp, 0
    lw   s0, sp, 4
    addi sp, sp, 8
    ret

MultiplicaVetor:
    # Movimenta o apontador da pilha 4 posicoes para baixo (16 bytes) e guarda 4 registradores na pilha
    addi sp, sp, -16
    sw   s0, sp, 12
    sw   s1, sp, 8
    sw   s2, sp, 4
    sw   ra, sp, 0

    mv   s0, a0   # Valor de N
    mv   s1, a1   # Posicao inicial do vetor
    mv   s2, a2   # Valor que multiplica o vetor

for:
    beq  s0, zero, fim
    lw   a0, s1, 0
    mv   a1, s2
    call Multiplica
    sw   a0, s1, 0
    addi s1, s1, 4
    addi s0, s0, -1
    j    for

fim:
    # Movimenta o apontador da pilha 4 posicoes para cima (16 bytes) e recupera 4 registradores da pilha
    lw   ra, sp, 0
    lw   s2, sp, 4
    lw   s1, sp, 8
    lw   s0, sp, 12
    addi sp, sp, 16
    ret



main:
    li s0, 5    # tamanho do vetor (5)
    mv a0, s0   # a0 = tamanho do vetor

    lui s1, %hi(vetor)
    addi s1, s1, %lo(vetor)
    mv a1, s1   # a1 = vetor

    li s2, 10
    mv a2, s2   # a2 = valor que sera multiplicado

    call MultiplicaVetor

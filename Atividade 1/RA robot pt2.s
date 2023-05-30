# Natalia Vieira Lima - RA 185483
# (reenviei esse trabalho por ter esquecido o nome e RA)
#  nao modifiquei nada alem desse comentario

.data
vetor1: .word 0x0, 0x0, 0x000f, 0x0002, 0x0002,0x0002, 0x000a, 0x0006, 0x0002
vetor8: .word 0x0, 0x0, 0x000f, 0x0009, 0x0009,0x000f, 0x0009, 0x0009, 0x000f
vetor5: .word 0x0, 0x0, 0x000f, 0x0001, 0x0001,0x000f, 0x0008, 0x0008, 0x000f
vetor4: .word 0x0, 0x0, 0x0001, 0x0001, 0x0001,0x000f, 0x0009, 0x0009, 0x0009
vetor8b: .word 0x0, 0x0, 0x000f, 0x0009, 0x0009,0x000f, 0x0009, 0x0009, 0x000f
vetor3: .word 0x0, 0x0, 0x000f, 0x0001, 0x0001,0x000f, 0x0001, 0x0001, 0x000f
pausaMax: .word 100
.text

main:
    # chama o robo
    #li a0, 0x110

# comeca impressao do 1
    la a3, vetor1   # define de parametro de imprime o vetor1
    call imprime
    la a3, pausaMax
    call pausa

    li s1, 0
    li s2, 16
loop1: # vai fazer o shift pra esquerda 16x, salva no vetor e imprime cada um
    la a3, vetor1   
    call shift  
    la a3, vetor1
    call imprime
    la a3, pausaMax # faz a pausa entre um vetor com shift e outro
    call pausa

    addi s1, s1, 1
    bne s1, s2, loop1
    beq s1, s2, imprime8 # chama a impressao do 8 e tem a msm logica da impressao1

# comeca impressao 8
imprime8:
    la a3, vetor8
    call imprime
    la a3, pausaMax
    call pausa

    li s1, 0
    li s2, 16
loop8: 
    la a3, vetor8
    call shift
    la a3, vetor8
    call imprime
    la a3, pausaMax
    call pausa

    addi s1, s1, 1
    bne s1, s2, loop8
    beq s1, s2, imprime5

# comeca impressao 5
imprime5:
    la a3, vetor5
    call imprime
    la a3, pausaMax
    call pausa

    li s1, 0
    li s2, 16
loop5: 
    la a3, vetor5
    call shift
    la a3, vetor5
    call imprime
    la a3, pausaMax
    call pausa

    addi s1, s1, 1
    bne s1, s2, loop5
    beq s1, s2, imprime4

# comeca impressao 4
 imprime4:
    la a3, vetor4
    call imprime
    la a3, pausaMax
    call pausa

    li s1, 0
    li s2, 16
loop4: 
    la a3, vetor4
    call shift
    la a3, vetor4
    call imprime
    la a3, pausaMax
    call pausa

    addi s1, s1, 1
    bne s1, s2, loop4
    beq s1, s2, imprime8b
# comeca impressao 8
imprime8b:
    la a3, vetor8b
    call imprime
    la a3, pausaMax
    call pausa

    li s1, 0
    li s2, 16
loop8b: 
    la a3, vetor8b
    call shift
    la a3, vetor8b
    call imprime
    la a3, pausaMax
    call pausa

    addi s1, s1, 1
    bne s1, s2, loop8b
    beq s1, s2, imprime3
# comeca impressao 3
 imprime3:
    la a3, vetor3
    call imprime
    la a3, pausaMax
    call pausa

    li s1, 0
    li s2, 16
loop3: 
    la a3, vetor3
    call shift
    la a3, vetor3
    call imprime
    la a3, pausaMax
    call pausa

    addi s1, s1, 1
    bne s1, s2, loop3
fim:
    li a0, 10
    ecall          # Encerra o programa
    ret


imprime:
    li t0, 9
    li t1, 36

    li a1, 0
for1:
    lw a2, 0(a3) # a2 = posicao 0 do vetor do numero
    ecall

    addi a1, a1, 1 # sobe uma linha
    addi a3, a3, 4 # pula pro proximo valor do vetor numero

    bne a1, t0, for1

    li a1, 0        # zera a1 (linhas) antes de sair
    lw a2, 0(a3)    # zera a2 (colunas) antes de sair

    ret

pausa:
    li t0, -1
    lw t1, 0(a3) # pega o valor definido para a pausa
loop2b:
    addi t0, t0, 1
    bne t0, t1, loop2b  # conta ate o pausaMax
    ret

shift:
    li a1, 0
    li t0, 9
for3: 
    lw a2, 0(a3)    # pega a posicao de a2 (coluna) no zero
    slli a2, a2, 1  # da um shift pra esquerda

    sw a2, 0(a3)    # salva no vetor 
    addi a3, a3, 4  # vai para a proxima posicao do vetor para fazer o shift dnv
    addi a1, a1, 1  # pula para a proxima linha

    bne a1, t0, for3
ret


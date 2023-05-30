.data
vetor: 
    .word 10
    .word 20
    .word 30
.text
main:

addi t3, zero, 1

  # Acessa o valor 10
    la s0, vetor# 
    lw t0, 0(s0)     # onde t0 deve ter o endereco de v[0]
    
    add t0, t0, t3           # adiciona +1 no vetor(10)
    sw t0, 0(s0)  
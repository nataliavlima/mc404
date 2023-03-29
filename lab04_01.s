main:

# Le o numero do teclado
addi t0, zero, 4
ecall

# Guarda num registrador
add s0, a0, zero

# Printa o numero inserido
addi t0, zero, 1
ecall
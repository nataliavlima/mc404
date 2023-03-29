main:

# Le o caracter do teclado
addi t0, zero, 5 		 # notar que o imediato e' 5
ecall

# Guarda num registrador
add s0, a0, zero

# Verificar se esta' minuscula
addi s2, zero, 97
bge s0, s2, maiuscula      # se s0 for maior ou igual a 97 ele esta' minusculo


addi a0, s0, 32    # Transforma em Minuscula
j fim


# Transforma em Maiuscula
maiuscula: 
addi a0, s0, -32     # tira o bit 5 (= -32)

fim:

# Printa o caractere 
addi t0, zero, 2
ecall 
ret
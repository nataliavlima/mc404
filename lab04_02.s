main:

# Le o caracter do teclado
addi t0, zero, 5 		 # notar que o imediato e' 5 para caracter
ecall

# Guarda num registrador
add s0, a0, zero

# Verificar se esta' maiuscula
addi s2, zero, 91
blt s0, s2, minuscula
j fim

# Transforma em Minuscula
minuscula: 
addi a0, s0, 32     # adiciona o bit 5 (= 32)

# Printa o caractere maiusculo
addi t0, zero, 2
ecall

fim: 
ret
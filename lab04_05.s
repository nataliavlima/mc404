main:

# Le o numero do teclado
addi t0, zero, 4 		 
ecall

# Guarda num registrador
add s0, zero, a0  
add s1, zero, zero
addi s2, zero, 15
addi s3, zero, 10


# Verificar se esta' entre a restricao
blt s1, s0, quinze   # se e' maior que 0
j fim

quinze:

blt s0, s2, hex      # se e' menor que 15
j fim

hex:
blt s0, s3, num    # se menor que 10 : addi 48
addi s0, s0, 55    # se maior que 10 : addi 55
add a0, zero, s0
j imprimir

num:
addi s0, s0, 48
add a0, zero, s0

imprimir:
addi t0, zero, 2    # printa o caractere 
ecall

addi s4, zero, 104  # printa o h de HEX
add a0, s4, zero
addi t0, zero, 2
ecall

fim:
ret
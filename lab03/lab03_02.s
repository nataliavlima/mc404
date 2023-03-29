main: 

# Le um numero no teclado e guarda em a0

addi t0, zero, 4
ecall


# Declaracao de variaveis
add s0, zero, a0       # s0 = a0
add s1, zero, zero     # s1 = 0  salvaremos a resposta do AND
addi s2, zero, 3       # s2 = '3'  0011 
add s3, zero, zero     # s3 = 0  usaremos para ver se e' multiplo

# Verifica se e' multiplo de 4
and s1, s2, s0      # se s1 = 0 e' multiplo

beq s1, s3, SIM     # se for '0' pula para a funcao SIM

addi a0, zero, 78   # atribui a0 = N 
addi t0, zero, 2    # imprime 
ecall 
j fim

SIM: 
addi a0, zero, 83 # atribui a0 = S
addi t0, zero, 2    # imprime 
ecall 

fim: 
ret

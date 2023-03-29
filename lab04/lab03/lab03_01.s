main: 

# Le um numero no teclado e guarda em a0

addi t0, zero, 4
ecall

# Declaracao de variaveis
add s0, zero, a0       # s0 = a0
add s1, zero, zero     # s1 = 0
addi s2, zero, 1       # s2 = '1' 
add s3, zero, zero    # s3 = 0  usaremos para ver se e' par

# Verifica se e' impar
and s1, s2, s0      # se s1 = 1 e' impar, se for 0 e' par

beq s1, s3, par     # se for '0' pula para a funcao par

addi a0, zero, 73 # atribui a0 = I para printar (I = '73')
addi t0, zero, 2    # imprime que e' impar
ecall 
j fim

par: 
addi a0, zero, 80 # atribui a0 = P para printar (P = '80ab')
addi t0, zero, 2    # imprime que e' par
ecall 

fim: 
ret

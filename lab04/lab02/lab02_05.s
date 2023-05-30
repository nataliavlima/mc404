main:
  # Le o 1 numero do teclado e armazena em a0
	addi t0, zero, 4
	ecall
	add s0, zero, a0	#salva o primeiro valor lido (s0 = a01)

  # Le o 2 numero do teclado e armazena em a0
	addi t0, zero, 4
	ecall
	add s5, zero, a0	#salva o primeiro valor lido (s5 = a02)

  # Compara se s0 e' o maior
	bge s5, s0, else #se s5 maior, printa s5 no else
	add a0, zero, s0 

  # Imprima o valor de a0 na tela
	addi t0, zero, 1
	ecall
	j laco
else:
	add a0, zero, s5
  # Imprima o valor de a0 na tela
	addi t0, zero, 1
	ecall

laco:
# Se o valor lido for zero, para o laco
 	beq s0, zero, fim
	beq s5, zero, fim
	j main			#se nao for 0 volta pro main

fim:
	ret

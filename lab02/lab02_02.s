main:
  # Le um numero do teclado e armazena em a0
	addi t0, zero, 4
	ecall

  # Soma 2 ao valor de a0
	add s0, zero, a0	#salva o primeiro valor lido (s0 = a0)
	addi s1, a0, 2		#s1 = a0 + 2
	add a0, zero, s1	#a0 = 0 + s1 
	
  # Imprima o valor de a0 na tela
	addi t0, zero, 1
	ecall

   # Se o valor lido for zero, para o laco
 	beq s0, zero, fim
	j main			#se nao for 0 volta pro main
  	
fim:
	ret

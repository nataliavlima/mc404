main:
  # Le um numero do teclado e armazena em a0
	addi t0, zero, 4
	ecall

  # Soma 2 ao valor de a0
	addi s1, a0, 2		#s1 = a0 + 2
	add a0, zero, s1	#a0 = 0 + s1 
	
  # Imprima o valor de a0 na tela
	addi t0, zero, 1
	ecall

  # Va novamente para o main e recomece a execucao
  j main
  ret

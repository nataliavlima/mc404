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

  # Declaracao de contadores do laco
	addi  s3, s3, 1		#s3 como um contador do numero de lacos
	addi s4, zero, 10       #s4 sera meu comparador de 10x

  # Verifica o numero de lacos, se for 10 ele para
 	bge s3, s4, fim
	j main			#se nao for 10 volta pro main
  	
fim:
	ret

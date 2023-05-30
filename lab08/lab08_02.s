.data

  str1: .string "Mari"
  str2: .string "Nati"

  .text

  main:
    la a0, str1 # la: le str1 e salva em a0 
    la a1, str2
    call strcpy


    # Imprime str1 ja alterada
    li a0, 4
    la a1, str1
    ecall 

    # Imprime caracter de nova linha (\n)
    li a0, 11
    li a1, 13
    ecall          

    # Imprime str2 para comparacao
    li a0, 4
    la a1, str2
    ecall 

    # Imprime caracter de nova linha (\n)
    li a0, 11
    li a1, 13
    ecall          

  fim:
    li a0, 10
    ecall          # Encerra o programa
    ret

 strcpy:
    lbu t0, 0(a1)        # le o byte 0 de a1 e salva em t0
    beq t0, zero, fim_strcpy  # se t0='\0' da str2 --> fim da strcpy
    sb t0, 0(a0)           # salva t0 em (0)a0 --> (0)a0 = (0)a1
    # pula 1 byte antes de voltar pra funcao
    addi a0, a0, 1
    addi a1, a1, 1
    j strcpy

 fim_strcpy:
    ret
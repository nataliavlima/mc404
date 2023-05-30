.data
   str1 .space
.text 
main:
    la s0, str1
    li a0, 0x130   # chama o sistema para ler do teclado
 
laco:
    # chamada de sistema 0x131 para verificar se tem algum caracter disponível
    li a0, 0x131  
    sb a1, 0(s0)
        # se a0 = 0 --> todos os caracteres foram lidos
        # se a0 = 1 --> nao tem caractere disponivel
        # se a0 = 2 --> tem caractere disponivel e ele foi salvo em a1
    addi s0, s0, 1
    bne a0, zero, laco
    sb zero, 0(s0) # adiciona '\0' em s0 


li a0, 4
  la a1, str1
  ecall          # Imprime string str1

  li a0, 11
  li a1, 13
  ecall          # Imprime caracter de nova linha (\n)

  fim:
    li a0, 10
    ecall          # Encerra o programa
    ret
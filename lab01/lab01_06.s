main:
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
ecall                # efetua a operacao de leitura de inteiro
  add s1, zero, a0  #s1 = a0
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
ecall 
  add s2, zero, a0  #s2 = a0 segunda entrada
  sub s3, s1, s2     #s3 = s1 - s2
  add a0, zero, s3       # a0 = a0_1 + a0_2
addi t0, zero, 1   # escolhe a operacao de escrita de inteiro (1)
ecall              # efetua a operacao de escrita de inteiro
  ret

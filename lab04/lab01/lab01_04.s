main:
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
ecall                # efetua a operacao de leitura de inteiro
  addi s1, a0, 2       # s1 = a0 + 2
  add a0, zero, s1       # a0 = 0 + (a0 + 2)
addi t0, zero, 1   # escolhe a operacao de escrita de inteiro (1)
ecall              # efetua a operacao de escrita de inteiro
  ret

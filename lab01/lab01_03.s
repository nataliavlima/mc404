main:
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
ecall                # efetua a operacao de leitura de inteiro
  addi s1, zero, 2       # s1 = 0 + 2
  add  s2, s1, a0         # s2 = s1 + s0 
  ret

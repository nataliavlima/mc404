main:
# le a primeira entrada e salva em a0
  addi t0, zero, 4   
ecall   

#  muda uma variavel pelo valor do primeiro a0          
  add s1, zero, a0  #s1 = a0

#le a segunda variavel e substitui em a0
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
ecall 
#muda uma variavel pelo segundo a0
  add s2, zero, a0  #s2 = a0 segunda entrada

# efetua a soma e substitui a0 pelo valor da soma
  add s3, s1, s2     #s3 = s1 + s2
  add a0, zero, s3       # a0 = a0_1 + a0_2

#printa na tela o resultado (a0 atualizado pela soma)
addi t0, zero, 1   
ecall              
  ret

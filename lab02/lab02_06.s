main:
# le um numero do teclado
  addi t0, zero, 4
  ecall 
   
# subtrai 10 do numero lido 
  add s0, zero, a0
  addi a0, a0, -10 

# verifica se e' menor que zero
  blt a0, zero, negativo
  addi t0, zero, 1
  ecall 
  j fim

negativo:
  addi a0, zero, 45
  addi t0, zero, 2
  ecall

  addi s1, zero, 10
  sub s0, s1, s0
  add a0, zero, s0
  addi t0, zero, 1
  ecall 

fim:
  ret

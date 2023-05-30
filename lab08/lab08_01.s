.data

  str1: .string "Teste de string"
  str2: .space 20
  str3: .string "Hello World"

.text
main:
  li a0, 4
  la a1, str1
  ecall          # Imprime string str1 -- "Teste de string"

  li a0, 11
  li a1, 13
  ecall          # Imprime caracter de nova linha (\n)

  la s0, str2
  li s1, 20  # contador do for 
  li s3, 65  # s3 = 65 = 'A' em ASCII
loop:
  sb s3, 0(s0)  # salva oq ta em s3 na posicao 0 de s0 --> s0(0) = 'A'
  addi s0, s0, 1
  addi s1, s1, -1
  bne  s1, zero, loop

  li a0, 4       # instrucao de impressao
  la a1, str2
  ecall          # AAAAAAAAAAAAAAAAAAAAHello World
                 # adiciona o "Hello wolrd" pois str2 nao tem \0, entao ele vai ate o \0 da str3

  li a0, 11
  li a1, 13
  ecall          # Imprime caracter de nova linha (\n)

  li a0, 4
  la a1, str2
  sb zero, 19(a1) # tira um 'A' da str2
  ecall           # AAAAAAAAAAAAAAAAAAA 

  li a0, 11
  li a1, 13
  ecall          # Imprime caracter de nova linha (\n)

  li a0, 4
  la a1, str3
  ecall          # Imprime string str3  -- "Hello World"

  li a0, 11
  li a1, 13
  ecall          # Imprime caracter de nova linha (\n)

  li a0, 10
  ecall          # Encerra o programa
  ret

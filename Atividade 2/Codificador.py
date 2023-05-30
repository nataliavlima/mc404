import numpy as np 

registrador = np.array(  # matriz de registradores (com seu respectivo valor)
      [
          ['zero', 0], 
          ['ra', 1], 
          ['sp', 2], 
          ['gp', 3],
          ['tp', 4],
          ['t0', 5],
          ['t1', 6],
          ['t2', 7],
          ['s0', 8],
          ['fp', 8],
          ['s1', 9],
          ['a0', 10],
          ['a1', 11],
          ['a2', 12],
          ['a3', 13],
          ['a4', 14],
          ['a5', 15],
          ['a6', 16],
          ['a7', 17],
          ['s2', 18],
          ['s3', 19],
          ['s4', 20],
          ['s5', 21],
          ['s6', 22],
          ['s7', 23],
          ['s8', 24],
          ['s9', 25],
          ['s10', 26],
          ['s11', 27],
          ['t3', 28],
          ['t4', 29],
          ['t5', 30],
          ['t6', 31],
      ]
  )

def registradores(ABI):
  # pega o registrador e retorna seu respectivo valor para o comando
  for i in range(33):   # i =  numero linhas
    for j in range(2):  # j = numero colunas
      if(ABI == registrador[i][j]):
          regis = registrador[i][j+1]
          regis = int(regis)
  return regis

# transforma o numero em binario no tamanho especificado
def binario(numDecimal, tamanho):
  numBin = bin(numDecimal)
  numBin = numBin[2:] # tira o 0b que sai do bin(numDecimal)

  if (tamanho > len(numBin)):
    # adiciona '0' para preencher as casas
    numBin = '0'*(tamanho - len(numBin)) + numBin
  elif (tamanho < len(numBin)):
    # se o num de casas for menor, corta o num binarios
    numBin = numBin[-tamanho:]
  return numBin

# transforma em hexadecimal no tamanho especificado
def hexadecimal(numBin, tamanho):
  numDec = int(numBin, base=2) # transforma o numero binario em decimal
  numHex = hex(numDec) # transforma em hexadecimal 

  numHex = numHex[2:] 
  if (tamanho > len(numHex)):
    # adiciona '0' para preencher as casas
    numHex = '0'*(tamanho - len(numHex)) + numHex
  elif (tamanho < len(numHex)):
    # se o num de casas for menor, corta o num hex
    numHex = numHex[-tamanho:]
  numHex = '0x' + numHex  # adiciona novamente o '0x'
  return numHex

def addi(c):
  # especifica os argumentos e retira a virgula (se tiver):
  rd = c[1].replace(",", "")
  rs1 = c[2].replace(",", "")
  imm = int(c[3])
  
  # converte os registradores em binario no tamanho de bites especificado:
  r_rs1 = binario(registradores(rs1), 5) # 5 bites
  r_rd = binario(registradores(rd), 5)   # 5 bites
  r_imm = binario(imm, 12)               # 12 bites
  
  # parametros da funcao addi:
  num = binario(0, 3)                    # 3 bites
  addi = binario(19, 7)                  # 7 bites

  # instrucao em binario:
  b32 = r_imm + r_rs1 + num + r_rd + addi

  # converte em hexadecimal de 32 bites:
  h32 =  hexadecimal(b32, 8)
  
  return h32



inst = input("Digite o comando: \n")
c = inst.split()
comando = c[0]
print(comando)

if(comando == 'addi'):
  instrucao = addi(c)
print(instrucao)


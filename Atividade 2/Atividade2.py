# Natalia Vieira Lima - RA: 185483

import numpy as np
import re

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
  
def binario(numDecimal, tamanho):
  # transforma o numero em binario no tamanho especificado
  numBin = bin(numDecimal)
  numBin = numBin[2:] # tira o 0b que sai do bin(numDecimal)

  if (tamanho > len(numBin)):
    # adiciona '0' para preencher as casas
    numBin = '0'*(tamanho - len(numBin)) + numBin
  elif (tamanho < len(numBin)):
    # se o num de casas for menor, corta o num binarios
    numBin = numBin[-tamanho:]
  return numBin

def hexadecimal(numBin, tamanho):
  # transforma em hexadecimal no tamanho especificado
  numDec = int(numBin, base=2) # transforma o numero binario em decimal
  numHex = hex(numDec) # transforma em hexadecimal 

  numHex = numHex[2:] 
  if (tamanho > len(numHex)):
    # adiciona '0' para preencher as casas
    numHex = '0'*(tamanho - len(numHex)) + numHex
  elif (tamanho < len(numHex)):
    # se o num de casas for menor, corta o num hex
    numHex = numHex[-tamanho:]
  #numHex = '0x' + numHex  # adiciona novamente o '0x'
  return numHex

def validaSintaxe(inst, comando):
    padrao = r'[!@#$%^&*(),.?":{}|<>]' # padrao para ver se o comando de entrada tem caractere especial
    padroes = {   # dicionario de definicao de padroes para cada tipo de funcao
        'addi': r'^addi [a-zA-Z0-9]+, [a-zA-Z0-9]+, [0-9]+$',
        'slli': r'^slli [a-zA-Z0-9]+, [a-zA-Z0-9]+, [0-9]+$',
        'xor': r'^xor [a-zA-Z0-9]+, [a-zA-Z0-9]+, [a-zA-Z0-9]+$',
        'call': r'^call [0-9]+$',
        'ret': r'^ret$',
        'beq': r'^beq [a-zA-Z0-9]+, [a-zA-Z0-9]+, [a-zA-Z0-9]+$',
        'lw': r'^lw [a-zA-Z0-9]+, [0-9]+\([a-zA-Z0-9]+\)$',
        'sw': r'^sw [a-zA-Z0-9]+, [0-9]+\([a-zA-Z0-9]+\)$',
        'mul': r'^mul [a-zA-Z0-9]+, [a-zA-Z0-9]+, [a-zA-Z0-9]+$',
        'lui': r'^lui [a-zA-Z0-9]+, [0-9]+$',
        'li': r'^li [a-zA-Z0-9]+, [0-9]+$'
    }
    if(re.search(padrao, comando)):
      return 1
    if not re.fullmatch(padroes[comando], inst):
        return 1
    # se retornar 1 = ERRO, se 0 = deu certo!
    return 0

def addi(c):
  # especifica os argumentos e retira a virgula (se tiver):
  rd = c[1].replace(",", "")
  rs1 = c[2].replace(",", "")

  try:
      imm = int(c[3])
      erroImm = 0
  except ValueError:
      erroImm = 10
  if(erroImm == 10) :
      print('ERRO: o valor do endereço deve ser um número inteiro\n')
      h32 = 0
  elif(rd not in registrador) or (rs1 not in registrador):
    print('ERRO: registrador inválido\n')
    h32 = 0
  else:
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

def slli(c):
  # especifica os argumentos e retira a virgula (se tiver):
  rd = c[1].replace(",", "")
  rs1 = c[2].replace(",", "")

  try:
      imm = int(c[3])
      erroImm = 0
  except ValueError:
      erroImm = 10
  if(erroImm == 10) :
      print('ERRO: o valor do endereço deve ser um número inteiro\n')
      h32 = 0
  elif(rd not in registrador) or (rs1 not in registrador):
    print('ERRO: registrador inválido\n')
    h32 = 0
  else:
  
    # converte os registradores em binario no tamanho de bites especificado:
    r_rs1 = binario(registradores(rs1), 5) # 5 bites
    r_rd = binario(registradores(rd), 5)   # 5 bites
    r_imm = binario(imm, 12)               # 12 bites
    
    # parametros da funcao addi:
    num = '001'                   # 3 bites
    slli = '0010011'                # 7 bites
  
    # instrucao em binario:
    b32 = r_imm + r_rs1 + num + r_rd + slli
  
    # converte em hexadecimal de 32 bites:
    h32 =  hexadecimal(b32, 8)
    
  return h32

def xor(c):
  # especifica os argumentos e retira a virgula (se tiver):
  rd = c[1].replace(",", "")
  rs1 = c[2].replace(",", "")
  rs2 = c[3]

  if(rd not in registrador) or (rs1 not in registrador) or (rs2 not in registrador):
    print('ERRO: registrador inválido\n')
    h32 = 0
  else:
    # converte os registradores em binario no tamanho de bites especificado:
    r_rs1 = binario(registradores(rs1), 5) # 5 bites
    r_rd = binario(registradores(rd), 5)   # 5 bites
    r_rs2 = binario(registradores(rs2), 5) # 5 bites
    
    # parametros da funcao addi:
    num = '100'                   # 3 bites
    xor = '0110011'               # 7 bites
  
    # instrucao em binario:
    b32 = '0000000'+ r_rs2 + r_rs1 + num + r_rd + xor
  
    # converte em hexadecimal de 32 bites:
    h32 =  hexadecimal(b32, 8)
  
  return h32

def lw(c):
  # especifica os argumentos e retira a virgula (se tiver):
  rd = c[1].replace(",", "")
  r = c[2].replace("(", " ")
  r = r.split()
  rs1 = r[1].replace(")", "")
  
  try:
      imm = int(r[0])
      erroImm = 0
  except ValueError:
      erroImm = 10
  if(erroImm == 10) :
      print('ERRO: o valor do endereço deve ser um número inteiro\n')
      h32 = 0
  elif(rd not in registrador) or (rs1 not in registrador):
    print('ERRO: registrador inválido\n')
    h32 = 0
  else:
    # converte os registradores em binario no tamanho de bites especificado:
    r_rs1 = binario(registradores(rs1), 5) # 5 bites
    r_rd = binario(registradores(rd), 5)   # 5 bites
    r_imm = binario(imm, 12) # 12 bites
    
    # parametros da funcao addi:
    num = '010'                   # 3 bites
    lw = '0000011'               # 7 bites
  
    # instrucao em binario:
    b32 = r_imm + r_rs1 + num + r_rd + lw
  
    # converte em hexadecimal de 32 bites:
    h32 =  hexadecimal(b32, 8)
    
  return h32

def sw(c):
  # especifica os argumentos e retira a virgula (se tiver):
  rs2 = c[1].replace(",", "")
  r = c[2].replace("(", " ")
  r = r.split()
  rs1 = r[1].replace(")", "")

  try:
      imm = int(r[0])
      erroImm = 0
  except ValueError:
      erroImm = 10
  if(erroImm == 10) :
      print('ERRO: o valor do endereço deve ser um número inteiro\n')
      h32 = 0
  elif(rs2 not in registrador) or (rs1 not in registrador):
    print('ERRO: registrador inválido\n')
    h32 = 0
  else:
    # converte os registradores em binario no tamanho de bites especificado:
    r_rs1 = binario(registradores(rs1), 5) # 5 bites
    r_rs2 = binario(registradores(rs2), 5)   # 5 bites
    r_imm = binario(imm, 12)               # 12 bites
    
    # parametros da funcao addi:
    num = '010'                   # 3 bites
    sw = '0100011'                # 7 bites
  
    r_imm115 = r_imm[5:]
    r_imm40 = r_imm[:5]
    # instrucao em binario:
    b32 = r_imm115 + r_rs2 + r_rs1 + num + r_imm40 + sw
  
    # converte em hexadecimal de 32 bites:
    h32 =  hexadecimal(b32, 8)
    
  return h32

def mul(c):
  # especifica os argumentos e retira a virgula (se tiver):
  rd = c[1].replace(",", "")
  rs1 = c[2].replace(",", "")
  rs2 = c[3]

  if(rd not in registrador) or (rs1 not in registrador) or (rs2 not in registrador) :
    print('ERRO: registrador inválido\n')
    h32 = 0
  else:
    # converte os registradores em binario no tamanho de bites especificado:
    r_rs1 = binario(registradores(rs1), 5) # 5 bites
    r_rd = binario(registradores(rd), 5)   # 5 bites
    r_rs2 = binario(registradores(rs2), 5) # 5 bites
    
    # parametros da funcao addi:
    num = '000'                   # 3 bites
    mul = '0110011'                # 7 bites
  
    # instrucao em binario:
    b32 = '0000001' + r_rs2 + r_rs1 + num + r_rd + mul
  
    # converte em hexadecimal de 32 bites:
    h32 =  hexadecimal(b32, 8)
    
  return h32

def lui(c):
  # especifica os argumentos e retira a virgula (se tiver):
  rd = c[1].replace(",", "")
  try:
      imm = int(c[2])
      erroImm = 0
  except ValueError:
      erroImm = 10
  if(erroImm == 10) :
      print('ERRO: o valor do endereço deve ser um número inteiro\n')
      h32 = 0
  elif(rd not in registrador):
    print('ERRO: registrador inválido\n')
    h32 = 0
  else:  
    # converte os registradores em binario no tamanho de bites especificado:
    r_rd = binario(registradores(rd), 5)   # 5 bites
    r_imm = binario(imm , 20) # 20 bites
    
    # parametros da funcao addi:
    lui = '0110111'                # 7 bites
  
    # instrucao em binario:
    b32 = r_imm + r_rd + lui
  
    # converte em hexadecimal de 32 bites:
    h32 =  hexadecimal(b32, 8)
    
  return h32

def ret(c):
  imm = '000000000000'
  rs1 = '00001'
  num = '000'
  rd = '00000'
  ret = '1100111'
  
  b32 = imm + rs1 + num + rd + ret
  # converte em hexadecimal de 32 bites:
  h32 =  hexadecimal(b32, 8)
  return h32

def beq(c):
  rs1 = c[1].replace(",", "")
  rs2 = c[2].replace(",", "")
  
  try:
      imm = int(c[3]) - 1000
      erroImm = 0
  except ValueError:
      erroImm = 10
  if(erroImm == 10) :
      print('ERRO: o valor do endereço deve ser um número inteiro\n')
      h32 = 0
  elif(rs1 not in registrador) or (rs2 not in registrador) or (erroImm == 10) :
      print('ERRO: registrador inválido\n')
      h32 = 0
  elif(imm < 0) :
      print('ERRO: endereço da label inválida\n')
      h32 = 0
  
  else:
    r_rs1 = binario(registradores(rs1), 5)
    r_rs2 = binario(registradores(rs2), 5)
    r_imm = binario(imm, 12)  # ele tem um '0' implicito
    immString =str(r_imm)
    doze = immString[0]
    onze = immString[1]
    dezCinco = immString[2:8]
    quatroUm = immString[8:12]
  
    num = '000'
    beq = '1100011'
    
    b32 = doze + dezCinco + r_rs2 + r_rs1 + num + quatroUm + onze + beq
  
    h32 = hexadecimal(b32, 8)
  return h32

def call(c):
  
  try:
      imm = int(c[1]) -1000
      erroImm = 0
  except ValueError:
      erroImm = 10
  if(erroImm == 10) :
      print('ERRO: o valor do endereço deve ser um número inteiro\n')
      h32 = 0
  elif(imm < 0) :
    print('ERRO: endereço da label inválida\n')
    h32 = 0
  else:
    rd = 'ra'
    r_rd = binario(registradores(rd),5)
    r_imm = binario(imm, 20)  # ele tem um '0' implicito
    immString =str(r_imm)
    vinte = immString[0]
    dezenoveDoze = immString[1:9]
    onze = immString[9]
    dezUm = immString[10:20]
  
    beq = '1101111'
    
    b32 = vinte + dezUm + onze + dezenoveDoze + r_rd + beq
  
    h32 = hexadecimal(b32, 8)
  return h32

def li(c):
  # especifica os argumentos e retira a virgula (se tiver):
  rd = c[1].replace(",", "")
  imm = int(c[2])
  if(rd not in registrador):
    print('ERRO: registrador inválido\n')
    h32 = 0
  else:
    r_imm = bin(imm)
    Len_imm = len(r_imm)
    if(Len_imm <= 12):  # se o tamanho do imm for 12 ou menor so vira um addi
        c1 = 'addi '+ str(rd) + ', zero, ' + str(imm)  # escreve comando pro addi
        c11 = c1.split() 
        print('0x'+addi(c11).upper(), "   [comando: ", c1+"]\n"  )
        h32 = ""
    elif(Len_imm > 12 and Len_imm <= 32): # se > 12 ele vira uma lui+addi
      r_imm = bin(imm)

      # transformacao dos imediatos:
      hexImm = hexadecimal(r_imm, 8)
      immLui = hexImm[0:5]
      intLui = int(immLui, base=16) + 1
      immAddi = hexImm[5:8]
      intAddi = int(immAddi, base=16)
      
      #lui:
      c_lui1 = 'lui ' + str(rd) + ', ' + str(intLui)  # comando
      c_lui = c_lui1.split()   # comando separado
      print('0x'+lui(c_lui).upper() ,"   [comando: ", c_lui1+"]") # saida codificada + comando

      # addi:
      c_addi1 = 'addi '+ str(rd) + ', ' + str(rd) + ', '+ str(intAddi) # comando
      c_addi = c_addi1.split()   # comando separado
      print('0x'+addi(c_addi).upper(), "   [comando: ", c_addi1+"]\n"  ) # saida codificada + comando
      h32 = ""
    else:
      print("ERRO: Imediato muito grande\n")
  return h32

comandos = ['addi','slli','xor','call','ret','beq','lw','sw','mul','lui','li']


while True:
  inst = input("Digite o comando: \n")
  
  if not inst:
    break # se a entrada for vazia, ele para
    
  c = inst.split()
  comando = c[0]

  erroSintaxe = validaSintaxe(inst, comando)
  if(comando not in comandos):
    print('Comando não encontrado, tente novamente!\n')
  elif(erroSintaxe == 1):
      print("ERRO: A entrada é inválida!\n")
  
  elif(comando in comandos):
    if(comando == 'addi'):
      instrucao = addi(c)
    elif(comando == 'slli'):
       instrucao = slli(c)
    elif(comando == 'xor'):
       instrucao = xor(c)
    elif(comando == 'lw'):
       instrucao = lw(c)
    elif(comando == 'sw'):
       instrucao = sw(c)
    elif(comando == 'mul'):
       instrucao = mul(c)
    elif(comando == 'lui'):
       instrucao = lui(c)
    elif(comando == 'ret'):
       instrucao = ret(c)
    elif(comando == 'beq'):
       instrucao = beq(c)
    elif(comando == 'call'):
       instrucao = call(c)
    elif(comando == 'li'):
       instrucao = li(c)
    
    if(instrucao != 0 and instrucao != ""):
     instrucaoFinal = '0x' + instrucao.upper() # adiciona o '0x' e deixa as outras letras maiusculas
     print(instrucaoFinal, '\n')









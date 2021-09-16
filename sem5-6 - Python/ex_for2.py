import os



lista_alunos = []
lista2=['a','b','c','d']
ext_list = len(lista2)

for i in range(0,len(lista2)):
    aluno = input(f'Digite o nome do aluno {i+1}: ')
    lista_alunos.append(aluno)

print(lista_alunos)

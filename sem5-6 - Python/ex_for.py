'''
script de prática para usar for
'''

nomes = ['jessica', 'vitor', 'jorge', 'marcella', 'priscila', 'gregori', 'saara']

lista_upper = []

for x in nomes:
    nome_upper = x.upper()
    nome_upper = nome_upper + '.pdf'
    lista_upper.append(nome_upper)

print(lista_upper)

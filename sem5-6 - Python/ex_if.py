'''
Esse script é um exercício de if e else.
'''

nota1 = float(input('Digite sua primeira nota: '))
nota2 = float(input('Digite a segunda: '))

media = (nota1 + nota2) / 2

if media < 4.9:
    print('Reprovado/a')
    print(f'Sua média é {media}')
elif media > 5 and media < 6.9:
    print('Recuperação')
    print(f'Sua média é {media}')
elif media == 10.0:
    print('Parabéns')
    print(f'Sua média é {media}')
else:
    print('Aprovado/a')
    print(f'Sua média é {media}')

print('final do programa')

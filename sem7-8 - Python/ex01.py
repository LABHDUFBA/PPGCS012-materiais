from urllib.request import urlopen
from pprint import pprint
from bs4 import BeautifulSoup

url = 'https://exemplo-raspagem.netlify.app/'

# abrir url com urlopen
page_html = urlopen(url)

# criar um objeto beautifulsoup
bs = BeautifulSoup(page_html.read(), 'lxml')

# econtrar h1
head1 = bs.find('h1')
print(head1)
# encontrar o texto do primeiro p
paragrafo = bs.p.text
print(paragrafo)
# encontrar o valor do atributo href do primeiro a
link = bs.find('a')['href']
print(link)
# encontrar o valor do atributo src do primeiro img
imagem = bs.find('img')['src']
print(imagem)
# encontrar todos os li. O resultado é um objeto bs4.element.ResultSet
# que funciona como uma lista
itens = bs.find_all('li')

# iterar sobre os itens da lista e imprimir o texto de cada item
for item in itens:
    texto_item = item.text
    print(texto_item)

# encontrar todos os valores do atributo href de todos os a
links = bs.find_all('a')['href']
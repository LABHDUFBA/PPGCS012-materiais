from bs4 import BeautifulSoup
from urllib.request import urlopen
import pandas as pd

def open_page(url):
	url_open = urlopen(url)
	bs = BeautifulSoup(url_open.read(), 'html.parser')
	return bs

def quotes_infos(bs, lista_final):
    quotes_box = bs.find_all('div',{'class':'quote'})
    for quote in quotes_box:
        q_text = quote.find('span',{'class':'text'})
        q_author = quote.find(class_='author')
        q_tags = quote.find(class_='tags')
        tags = q_tags.find('meta')['content']
        lista_infos = [q_text.text, q_author.text, tags]
        lista_final.append(lista_infos)
    return lista_final

def saveDF(listaFinal, output):
    '''
    Função que salva o DataFrame em formato csv
    '''
    df = pd.DataFrame(listaFinal, columns=['Citação', 'Autor', 'Tags'])
    df.to_csv(f'{output}.csv')

def next_page(url, bs):
	try:
		next_tag = bs.find('nav')
		next_btn = next_tag.find(class_='next')
		next_link = next_btn.find('a')['href']
		return next_link
	except:
		print('Não há mais páginas')
		return None

url_inicial = 'https://quotes.toscrape.com'
lista_final = []
# use while True to loop through all pages
while True:
	bs = open_page(url_inicial)
	quotes_infos(bs, lista_final)
	next_link = next_page(url_inicial, bs)
	# if the next page link is not found, break the loop
	if next_link == None:
    		print('Fim da raspagem')
    		break
	url_inicial = 'https://quotes.toscrape.com' + next_link
	print(f'Passando para a próxima página: {url_inicial}\n')

saveDF(lista_final, 'teste02')

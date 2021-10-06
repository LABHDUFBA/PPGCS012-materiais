from bs4 import BeautifulSoup
from urllib.request import urlopen

def open_page(url):
	url_open = urlopen(url)
	bs = BeautifulSoup(url_open.read(), 'html.parser')
	return bs

def quotes_infos(bs, output):
	quotes_box = bs.find_all('div',{'class':'quote'})
	with open(f'{output}.txt', 'a') as f:
		for quote in quotes_box:
			q_text = quote.find('span',{'class':'text'})
			q_author = quote.find(class_='author')
			f.write(f'Citação: {q_text.text}\nPor {q_author.text}\n')

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

# use while True to loop through all pages
while True:
	bs = open_page(url_inicial)
	quotes_infos(bs, 'quotations01')
	next_link = next_page(url_inicial, bs)
	# if the next page link is not found, break the loop
	if next_link == None:
    		print('Fim da raspagem')
    		break
	url_inicial = 'https://quotes.toscrape.com' + next_link
	print(f'Passando para a próxima página: {url_inicial}\n')

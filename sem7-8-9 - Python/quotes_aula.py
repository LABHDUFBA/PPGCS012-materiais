'''
Comentar cada função e as demais linhas com # 
''' 
from bs4 import BeautifulSoup
from urllib.request import urlopen
import pandas as pd

# Definindo as funções
def open_url(url):
    '''
    comente
    '''
    html_open = urlopen(url)
    bs = BeautifulSoup(html_open.read(), 'lxml')
    return bs

def boxes_q(bs):
    '''
    comente
    '''
    boxes_inicial = bs.select('body > div > div:nth-child(2)')
    boxes_quotes = boxes_inicial[0].find('div', class_='col-md-8')
    boxes_quotations = boxes_quotes.find_all('div', class_='quote')
    return boxes_quotations

def quote_infos(boxes_quotations, lista_final):
    '''
    comente
    '''
    for quote in boxes_quotations:
        texto = quote.find('span', {'class':'text'}).text
        autor = quote.find('small', {'class':'author'}).text
        tags = quote.find('meta')['content']
        lista_q = [autor, texto, tags]
        lista_final.append(lista_q)
    return lista_final

def find_next(bs):
    '''
    comente
    '''
    nav = bs.find('nav')
    u_list = nav.find('ul')
    try:
        next_page = u_list.find('li', {'class':'next'})
        link_next = next_page.find('a')['href']
    except:
        link_next = None
    return link_next

def save_csv(lista_final, colunas, nome_arquivo):
    '''
    Função para salvar o arquivo csv usando pandas
    '''
    df = pd.DataFrame(lista_final, columns=colunas)
    df.to_csv(nome_arquivo)

# Início do programa
url = 'https://quotes.toscrape.com'
base_url = 'https://quotes.toscrape.com'
# comente
lista_final = []
# comente
while True:
    # comente
    bs = open_url(url)
    # comente
    boxes_quotations = boxes_q(bs)
    # comente
    quote_infos(boxes_quotations, lista_final)
    # comente
    url_next = find_next(bs)
    # comente
    if url_next is None:
        print('Fim da raspagem')
        break
    # comente
    url = base_url + url_next
    print(f'\nPassando para a próxima: {url}\n')
# comente
colunas = ['Autor', 'Texto', 'Tags']
nome_arquivo = 'quotes_aula_final.csv'
# comente
save_csv(lista_final, colunas, nome_arquivo)

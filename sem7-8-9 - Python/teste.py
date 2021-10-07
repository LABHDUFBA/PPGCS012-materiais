from bs4 import BeautifulSoup
from urllib.request import urlopen
import pandas as pd

def open_url(url):
    html_open = urlopen(url)
    bs = BeautifulSoup(html_open.read(), 'lxml')
    return bs

def boxes_q(bs):
    div_principal = bs.find('div', class_='container')
    # usar CSS selector para encontrar as boxes
    div_rows = div_principal.select("div.row:nth-child(2)")
    boxes_inicial = div_rows.find('div', class_ = 'col-md-8')
    boxes_quotations = boxes_inicial.find_all('div', class_= 'quote')
    return boxes_quotations

def quote_infos(boxes_quotations, final_list):
    for quote in boxes_quotations:
        texto = quote.find('span', class_='text').text
        autor = quote.find('small', class_='author').text
        tags = quote.find('meta')['content']
        lista_quote = [texto, autor, tags]
        # append to final list
        final_list.append(lista_quote)
    return final_list

def find_next(bs):
    nav = bs.find('nav')
    u_list = nav.find('ul')
    try:
        next_page = u_list.find('li', {'class':'next'})
        link_next = next_page.find('a')['href']
    except:
        link_next = None
    return link_next

# create a csv file with pandas
def create_csv(final_list, columns, output_name):
    df = pd.DataFrame(final_list, columns=columns)
    df.to_csv(output_name)
    
url = 'https://quotes.toscrape.com'
final_list=[]

# while next_page is not None:
while True:
    bs = open_url(url)
    boxes_quotations = boxes_q(bs)
    quote_infos(boxes_quotations, final_list)
    next_page = find_next(bs)
    if next_page is None:
        print('Final da Raspagem.')
        break
    url = 'https://quotes.toscrape.com' + next_page
    print(url)
print(len(final_list))
print(final_list)


# name the columns
columns = ['texto', 'autor', 'tags']
output_name = 'quotes.csv'

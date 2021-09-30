# Fluxo simplificado de web scraping

# Ativar as libraries: rvest (e/ou xml2)

# 0) Selecione o endereço da página ou url e crie um objeto url

url <- "https://www.pagina.com.br"

# 1) ler o html da pagina escolhida

# função: 
read_html("url")

# 2) Selecione o node que contém a informação que você quer

# Função
# ATENÇÃO: esta é uma função antiga que foi descontinuada (deprecated)
html_node()
html_nodes()
# Prrefria usar esta aqui
html_element()
html_elements()
###############################################################
############### PARE TUDO E PRESTE ATENÇÃO NISSO AQUI #########

# Existem dois parâmetros fundamentais: "xpath =" e "css ="

# EX: 
html_elements(xpath = "bendito_xpath")
html_elements(css = "bendito_css")

# O web scraping ocorre aqui! Saber achar o caminho onde está
# sua informação dentro do site é a coisa mais fundamental

# Para saber qual é o XPATH OU CSS é preciso testar até ver o que funciona 
# melhor. Não se preocupe algumas ferramentas vão te ajudar nisso:

# https://selectorgadget.com/
# https://chrome.google.com/webstore/detail/scraper/mbigbapnjcgaffohmbkdlecaccepngjd
# Inspecção manual

# 3) Por fim, quando conseguirmos localizar o que queremos
# vamos usar umas três principais funcões para pegar o quw queremos:

# pega o texto do elemento
html_text()
# pega o link (href) do elemento ou outro atributo
html_attr("href")
# pega a presente no elemento no formato tibble
html_table()

# Vamos ver isto na prática no arquivo "Aula_4_exemplos_Quotes to Scrape.R"
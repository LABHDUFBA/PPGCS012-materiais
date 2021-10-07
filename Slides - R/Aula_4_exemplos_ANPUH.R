##################### ATIVIDADE DE HOJE ################

# vamos raspar as informações de todos os artigos publicados em todos os anais
# do site da ANPUH


rm(list = ls())
# Ativando o pacote
library(rvest)

# criando uma url base

url_base <- "https://anpuh.org.br/index.php/documentos/anais"

# pegando os links dos anais

links_anais <- url_base %>% 
    read_html() %>%  
    html_elements(xpath = "//h4/a") %>%
    html_attr("href") # função nova, para pegar os links "href"

# colando o pedaço que falta nos links

links_anais <- paste("https://anpuh.org.br", links_anais, sep = "")


# criando df vazio

df <- data.frame()

# loop

for (i in links_anais){
  print(i)
  html_anais <- read_html(i)
  # titulo
  titulo <- html_anais %>% 
  html_elements(xpath = "//h2") %>%
  html_text() 
  # autor
  autor <- html_anais %>% 
    html_elements(xpath = "//div/dl/dd[1]/a") %>%
    html_text() 
  # tipo
  tipo <- html_anais %>% 
    html_elements(xpath = "//div/dl/dd[2]/a") %>%
    html_text()
  # evento
  evento <- html_anais %>% 
    html_elements(xpath = "//div/dl/dd[3]/a") %>%
    html_text()
  # ano
  ano <- html_anais %>% 
    html_elements(xpath = "//div/dl/dd[4]/a") %>%
    html_text()
  # ano
  link_trab <- html_anais %>% 
    html_elements(xpath = "//dd/ul/li/a") %>%
    html_attr("href")
  # refbib
  refbib <- html_anais %>% 
    html_elements(xpath = "//dd/p") %>%
    html_text()
  # a cada loop ir jogando no data.frame
  df <- rbind(df, cbind(titulo, autor, tipo, evento, ano, link_trab, refbib)) #compilando tudo
} 








ano

arquivo <- links_anais %>% 
  read_html() %>%  
  html_elements(xpath = "//h4/a") %>%
  








# criando um data frame vazio
df <- data.frame()
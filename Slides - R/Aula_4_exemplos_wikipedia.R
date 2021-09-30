rm(list = ls())

# Ativando o pacote
library(rvest)

# lendo o html
url <- "https://pt.wikipedia.org/wiki/Bahia"

# pegando o titulo do site
titulo_wiki <- url %>% 
  read_html() %>%  
  html_elements(xpath = "//h1") %>%
  html_text()

# pegando o texto/citação
texto <- url %>% 
  read_html() %>% 
  html_elements(css = "p") %>%
  html_text()

# pegando as tabelas - com defeito
tabelas <- url %>% 
  read_html() %>% 
  html_elements(xpath = "//tbody") %>%
  html_table(header = T, trim = T)


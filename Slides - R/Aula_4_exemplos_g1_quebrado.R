rm(list = ls())

# Ativando o pacote
library(rvest)

# lendo o html
url <- "https://g1.globo.com/"

titulo <- url %>% 
  read_html() %>% 
  html_elements(css = ".gui-color-primary") %>%
  html_text()

link <- url %>% 
  read_html() %>%  
  html_elements(css = ".gui-color-primary") %>%
  html_attr("href")


rm(list = ls())

# Ativando o pacote
library(rvest)

# lendo o html
html_base <- "https://quotes.toscrape.com/page/numeracao/"


df <- data.frame()

for (i in 1:10){
  html <- gsub("numeracao", i, html_base)
  print(html)
  html <- read_html(html)
  # pegando o texto/citação
  texto <- html %>% 
    html_elements(css = ".text") %>%
    html_text()
  # pegando o autor
  autor <- html %>% 
    html_elements(css = ".author") %>%
    html_text()
  # pegando as tags
  tags <- html %>% 
    html_elements(css = ".tags") %>%
    html_text2()
  # a cada loop ir jogando no data.frame
  df <- rbind(df, cbind(texto, autor, tags)) #compilando tudo
}

# limpando (opcional)

df$tags <- gsub("Tags: ", "", df$tags)

# Parabéns HACKER DAS HUMANIDADES!
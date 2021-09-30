rm(list = ls())

# Ativando o pacote
library(rvest)

# lendo o html
html <- read_html("https://quotes.toscrape.com/")


# pegando o titulo do site
titulo_site <- html %>% 
  html_elements(xpath = "//h1/a") %>%
  html_text()

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

# convertendo para um df
df <- data.frame(texto, autor, tags)

# limpando (opcional)

df$tags <- gsub("Tags: ", "", df$tags)

# Parabéns HACKER DAS HUMANIDADES!


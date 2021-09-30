rm(list = ls())

# Ativando o pacote
library(rvest)

# lendo o html
url <- "https://quotes.toscrape.com/"


# pegando o titulo do site
titulo_site <- url %>% 
  read_html() %>% 
  html_elements(xpath = "//h1/a") %>%
  html_text()

# pegando o texto/citação
texto <- url %>% 
  read_html() %>% 
  html_elements(css = ".text") %>%
  html_text()
# pegando o autor
autor <- url %>% 
  read_html() %>% 
  html_elements(css = ".author") %>%
  html_text()
# pegando as tags
tags <- url %>% 
  read_html() %>% 
  html_elements(css = ".tags") %>%
  html_text2()

# convertendo para um df
df <- data.frame(texto, autor, tags)

# limpando (opcional)

df$tags <- gsub("Tags: ", "", df$tags)

# Parabéns HACKER DAS HUMANIDADES!


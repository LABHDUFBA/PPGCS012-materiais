rm(list = ls())

# Ativando o pacote
library(rvest)
library(tidyverse)

# criando uma url base
url_base <- "https://quotes.toscrape.com/page/numeracao/"

# criando um data frame vazio
df <- data.frame()

#
for (i in 1:10){
  #
  url <- gsub("numeracao", i, url_base)
  #
  print(url)
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
  # a cada loop ir jogando no data.frame
  df <- rbind(df, cbind(autor, texto, tags)) #compilando tudo
  }

?html_t
# limpando (opcional)

df$tags <- gsub("Tags: ", "", df$tags)

# Salvando em .csv

write.csv(df, "./Slides - R/csv/df_quotes_to_scrape.csv")

# salvando em excel
#install.packages("xlsx")

xlsx::write.xlsx(df, "./Slides - R/csv/df_quotes_to_scrape.xls")

# Parabéns HACKER DAS HUMANIDADES!
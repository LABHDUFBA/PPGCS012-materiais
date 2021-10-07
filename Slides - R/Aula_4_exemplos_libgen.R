rm(list = ls())

# Ativando o pacote
library(rvest)

# lendo o html
url <- "http://libgen.rs/search.php?&req=sociologia&phrase=1&view=simple&column=def&sort=def&sortmode=ASC&page=numeracao"


url_2 <- gsub("numeracao", 2, url)














tabela <- url %>% 
  read_html() %>% 
  html_element(xpath = "/html/body/table[3]") %>%
  html_table(header = T, trim = T)

# convertendo para df
df <- as.data.frame(tabela)

#pegando os links para download
links <- url %>% 
  read_html() %>% 
  html_elements(xpath = "//tr/td/a") %>%
  html_attr("href")
# final
links_final  <- links[grep("library.lol", links)]


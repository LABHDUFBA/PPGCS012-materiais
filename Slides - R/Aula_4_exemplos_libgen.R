rm(list = ls())

# Ativando o pacote
library(rvest)

# lendo o html
url <- "http://libgen.rs/search.php?req=sociologia&lg_topic=libgen&open=0&view=simple&res=25&phrase=1&column=def"

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


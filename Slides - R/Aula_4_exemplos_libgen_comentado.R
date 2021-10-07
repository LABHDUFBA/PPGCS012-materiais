rm(list = ls())
library(rvest)
library(tidyverse)

url_base <- "http://libgen.rs/search.php?&req=sociologia&phrase=1&view=simple&column=def&sort=def&sortmode=ASC&page=numeracao"

df <- data.frame()

# começar o loop ou a iteração
for (i in 1:23){# i vai assumir valores de 1 a 23
  # substitua "numeracao" pelos valor de "i" na url_base
  url <- gsub("numeracao", i, url_base)
  # print a url gerada
  print(url)
  # coletando a tabela
  tabela <- url %>% 
    read_html() %>% # leia o html da url
    html_element(xpath = "/html/body/table[3]") %>% # pegue o elemento baseado no xpath
    html_table(header = T, trim = T) # pegue a tabela que está no elemento, header = a tabela tem cabeçalho - trim = elimine espaços em branco nas células 
  df <- rbind(df, cbind(tabela)) # pegue o df vazio e cole linha a linha, coluna a coluna e forme o df final
}





#remotes::install_github("cienciadedatos/dados")
library(dados)
library(tidyverse)

df <- dados_starwars # como tibble
df <- as.data.frame(dados_starwars) # como data.frame


# Vamos ver a nossa base de uma forma mais legal?

glimpse(df)


# 1. filter

df 




# Qual a média de altura dos 
# personagens Masculinos agrupados por espécie?

df %>% 
  filter(genero == "Masculino") %>% 
  #drop_na() %>% 
  group_by(especie) %>% 
  summarise(mean(altura))
 

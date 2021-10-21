###############################################################
################## Aula tidyverse - DPLYR #####################
###############################################################

# 1. O que é o tidyverse??

#install.packages("tidyverse")
library(tidyverse)
tidyverse_packages()

## Coleção de pacotes para ciência de dados: 

### magrittr
### ggplot2
### dplyr
### tidyr
### readr
### purrr
### tibble
### stringr
### forcats

## Estes pacotes tem filosofia, gramática e estruturas de dados em comum 
## (criadas para um pacote trabalhar em conjunto com o outro além de que 
## quando voce aprende a usar um pacote, aprender a usar os outros pacotes 
## do tidyverse se torna muito mais tranquilo)

## Facilita a vida do cientista social computacional

#######################################################

# 2. O que é Tibble tbl_df

# - Tibbles são data frames com melhorias

# - Principal diferença (data.frame vs. tibble): forma em que a data frame é apresentada no console e tidyr recebem uma tibble e retornam uma tibble

# - Tibbles são data frames com melhorias

# - Principal diferença (data.frame vs. tibble): 
# forma em que a data frame é apresentada no console

# - Diversas funções do dplyr recebem uma tibble e retornam uma tibble

# Exemplos

# Criando um tibble denominado startwars_tbl

starwars_tbl <- dados::dados_starwars
starwars_tbl
# qual a classe?
class(starwars_tbl)

# Criando um datsframe denominado startwars_df

starwars_df <- as.data.frame(starwars_tbl)
starwars_df
head(starwars_df)

## outro jeito de visualizar

glimpse(starwars_tbl)

#######################################################

# 3. Pipe %>%

# Atalho: Control + Shift + M

# As funções do tidyverse foram projetadas para serem usadas 
# com o operador %>%

# pega o resultado da esquerda e joga para lado direito

# Leia assim: "e então..."

library(magrittr)
a <- c(5,7,9,10)
sqrt(sum(a))
a %>% sum %>% sqrt


# Funções básicas (verbos)

#O dplyr oferece 5 verbos (funções) básicos que resolvem 
# os principais problemas com dados:

# 1 - select: Seleciona colunas.

# 2 - filter: Filtra registros (linhas).

# 3 - mutate: Cria novas (ou modifica) variáveis (colunas).

# 4 - summarise (ou summarize): Reduz uma série de valores de uma coluna em um valor apenas.

# 5 - arrange: Ordena o data.frame de acordo com os valores de uma(s) coluna(s).

# 6 - group_by, que pode ser usada em conjunto com os verbos, de maneira a fazer operações por grupos de valores de coluna(s).
        

### Funcionamento:

## Todas essas funções recebem pelo menos dois argumentos: 

## o data.frame 

## o(s) argumento(s) pertinente(s) à função: 
## nomes de colunas, funções, condições. 

### A seguir vamos utilizar as funções para ficar mais clara sua sintaxe


        #####################################
        ######## Exemplos   dply ############
        #####################################

### Usando o pacote dados

#remotes::install_github("cienciadedatos/dados")
library(dados)
library(tidyverse)

starwars_tbl <- dados::dados_starwars# como tibble
#starwars_df <- as.data.frame(dados::dados_starwars) # como data.frame


# 1 - select: Seleciona colunas.

df %>% dplyr::select(nome_da_coluna OU indice_da_coluna)

## Selecionando as colunas massa, altura e cor_do_cabelo 

starwars_tbl %>%  
  select(massa, altura, cor_do_cabelo)


## Selecionando as colunas de 1:5

starwars_tbl %>%  
  select(1:5)


## Selecionar todas as colunas exceto filmes

starwars_tbl %>% 
  select(-filmes)

# Outras opções

starts_with(): #colunas que começam com um prefixo
ends_with(): #colunas que terminam com um sufixo
contains(): #colunas que contêm uma string
last_col(): #última coluna


# 2 - filter: Filtra registros (linhas).

## filtrar pelos humanos

starwars_tbl %>% 
  filter(especie == "Humano")

## filtrar pelo gênero feminino

starwars_tbl %>% 
  filter(genero == "Feminino")

## Filtrando por todas as especies EXCETO os Humanos

starwars_tbl %>% 
  filter(especie != "Humano") ## ATENÇÃO AO SINAL

## filtrar os personagens sem cabelo

starwars_tbl %>% 
  filter(is.na(cor_do_cabelo))

### Combinando filters

## filtrar pelas Fêmeas que nasceram em Tatooine (diferentes var)

starwars_tbl %>% 
  filter(sexo_biologico == "Fêmea", planeta_natal == "Tatooine")

## filtrar pelos Droides com pele cor de ouro (diferentes var)

starwars_tbl %>% filter(especie == "Droide", cor_do_cabelo == "Ouro")

## filtrar por todos os Wookiees OU Droides (mesma var)

starwars_tbl %>% 
  filter(especie == "Wookiee" | especie == "Droide")

## Importante!!! FILTRANDO OS NA

starwars_tbl %>% 
  # preste bem atenção abaixo
  # O sinal de exclação quer dizer: "não quero" ou "elimine"
  # is.na são os valores NA
  filter(!is.na(massa)) # experimente tirar e colocar !

### Combinando filter e select

## filtrar por personagens com mais de 130 kg 
#  e selecione os nomes, a massa e a cor dos olhos
  
starwars_tbl %>% 
  filter(massa > 130) %>% 
  select(nome, massa, cor_dos_olhos)

# 3 - mutate: Cria novas (ou modifica) variáveis (colunas).

# Cria a coluna altura em metros a partir da coluna altura 
# que esta em centimetros

starwars_tbl %>% 
  mutate(altura_em_metros = altura/100) %>% 
  # selecionar apenas o nome e a altura
  select(nome, altura_em_metros)

# Cria coluna com o indice de massa corporal

starwars_tbl %>% 
  mutate(IMC = massa / ((altura / 100)^2)) %>% 
  # selecionar apenas o nome e o IMC
  select(nome, IMC) 

# criar a variável massa2x com o dobro do valor da massa

starwars_tbl %>% 
  select(nome, massa) %>%
  mutate(massa2x = massa * 2)

# 4 - summarise (ou summarize): 
# Reduz uma série de valores de uma coluna em um valor apenas.
# ou seja, a funçÃO que recebem n elementos e retornam apenas um valor. 

# Vamos calcular a maior altura e a massa média:

starwars_tbl %>% 
  summarise(max_altura = max(altura, na.rm = T),
            massa_media = mean(massa, na.rm = T))


# 5 - arrange: Ordena o data.frame de acordo 
# com os valores de uma(s) coluna(s).

# Cria coluna com o indice de massa corporal e ordena do maior para o menor

starwars_tbl %>% 
  mutate(IMC = massa / ((altura / 100)^2)) %>% 
  # selecionar apenas o nome e o IMC
  select(nome, IMC) %>% 
  # ordenar do maior para o menor 
  arrange(-IMC) # usar (-) ou arrange(desc(IMC))

## Sabia que o Jabba the Hut era o mais obeso!

## filtrar por personagens com mais de 130 kg 
#  selecione os nomes, a massa e a cor dos olhos
#  Ordene do mais pesado para o menos pesado

starwars_tbl %>% 
  filter(massa > 130) %>% 
  select(nome, massa, cor_dos_olhos) %>% 
  arrange(-massa)

# 6 - group_by
# pode ser usada em conjunto com os verbos, 
# de maneira a fazer operações por grupos de valores de coluna(s).

# Qual a média de altura dos 
# personagens Masculinos agrupados por espécie?

starwars_tbl %>% 
  filter(genero == "Masculino") %>% 
  #drop_na() %>% 
  group_by(especie) %>% 
  summarise(mean(altura))

# Qual a media de altura e massa agrupadas por especie e sexo?

starwars_tbl %>% 
  group_by(especie, sexo_biologico) %>%
  select(altura, massa) %>%
  summarise(
    media_altura = mean(altura, na.rm = TRUE),
    media_massa = mean(massa, na.rm = TRUE)
    )


## Contando quantos personagens nós temos por espécie?

## dica: ordenando a gente já sabe quem é a especie que 
##       mais aparece

starwars_tbl %>% 
  group_by(especie) %>% 
  count()



## Exercícios

# Quantos humanos existem de cada gênero?
# Quantos indivíduos não são nem homens nem mulheres?



# objetos atomicos

# num, log, chr, int 

# Vectores

# num, log, chr, int 

# listas

# df

# c() - significa combine ou concatenate - 
#      é a função para fazer/criar vetores

# abeixo temos um vetor de nomes
nomes <- c("paulo", "maria", "joao")
# abaixo nos tempos um vertor de idades
idade <- c(12, 23, 43)
# abaixo nos temos um vetor de alturas
altura <- c(156, 162, 187)

# criando um df com a função "data.frame"
df <- data.frame(nomes, idade, altura)

# visualizar o df 
View(df)

# visualizar as primeiras observações (cabeça)
head(df)

# visualizar as últimas observações (cauda)
tail(df)

# visualizar a estrutura do df
str(df)

# visualizar as dimensões (qtas linhas e qtas colunas)

dim(df)

# use o $ para acessar a variável (ou o vetor) de um df
# OBS: tem que ser SEMPRE via colchetes
df$nomes[2]
df$altura[3]

# SUBSETTING: Outra forma de navegar 
# pelos valores de um df

df[1,1]
df[1,2]
df[1,3]

df[,1] 
df[,2]
df[,3]

df[1,]
df[2,]
df[3,]


### Instalação de pacotes/bibliotecas

# via CRAN - repositório oficial
# só precisa uma vez!
install.packages("tidyverse")
install.packages("remotes")

# Instalação via github

remotes::install_github("cienciadedatos/dados")
remotes::install_github("endereço")

## Existem duas formas de ativar as bibliotecas ou pacotes

library(remotes)
library(dados)

### Abrindo dfs do remotes

df_starwars <- dados_starwars

df_starwars
dim(df_starwars)
str(df_starwars)
head(df_starwars)
tail(df_starwars)
View(df_starwars)

class(df_starwars$filmes)

# df bebes

df_bebes <- bebes
str(df_bebes)
head(df_bebes)
View(df_bebes)

# formato comum de df é .CSV
# "comma separated values"

read.csv("caminho/path até o arquivo", 
         #escolha o separador dos valores
         sep = ";", 
         # Os meus dados possuem rótulo? se sim = T
         header = T)

df_voos_abril <- read.csv("./dados/voos_de_abril.csv",
                          #escolha o separador dos valores
                          sep = ";", 
                          # Os meus dados possuem rótulo? se sim = T
                          header = T)


## estruturas de Iteração

for (i in 1:100){
   resultado_da_soma <- i + 100
   print(resultado_da_soma)
  }


paginas <- c("01", "02", "03", "04")

for (i in paginas){
  colagem <- paste("www.endereco.com/", i, sep = "")
  print(colagem)
  }



















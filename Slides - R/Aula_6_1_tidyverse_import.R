########################################################
########### Aula tidyverse - Importando arquivos  ######
#######################################################

# COPYRIGHT ------------------------------------------------------------------ 

# Apresentação modificada de "https://github.com/curso-r/202110-r4ds-1)"

## A primeira coisa, fundamental para a ciência de dados são
## os próprios dados.

## Aprender a fazer o download e abrir as diferentes bases 
## de dados é parte importante e demanda muita atenção!!

getwd()

# Caminhos até o arquivo --------------------------------------------------

# Caminhos absolutos
"/home/william/Documents/Curso-R/main-r4ds-1/dados/imdb.csv"
"C:/Users/Fernando/Documents/202110-r4ds-1/dados/imdb.csv"

# Caminhos relativos
"./Slides - R/dados/"

# (cara(o) professora(o), favor lembrar de falar da dica 
# de navegação entre as aspas)

####### UNICODE - UTF-8 --------------------------------------------

# Unicode é um padrão que permite aos computadores representar 
# e manipular, de forma consistente, texto de qualquer sistema 
# de escrita existente

# "UTF-8", "Latin-1" e "ISO-8859-1" são exemplos 
# de UNICODE ou “encoding”. 

#Ao informar a codificação certa, 
# você evita ter um arquivo com 
# os acentos errados, o que dificulta 
# a leitura e o entedimento das informações.

# OBS: "UTF-8" É VIDA!!!!!!!!!!!!!!!!!

##############################################################
# Lendo arquivos -------------------------------------------------
##############################################################

# Lendo arquivos com o R básico!

# CSV = "comma separated values" - ‘valores separados por vírgula’

imdb <- read.csv("./Slides - R/dados/imdb.csv",  #caminho para o arquivo
                 #sep = ";", # não é necessário indicar o separador
                 header = T, # meus dados possuem tem cabeçalho?
                 encoding = "UTF-8") #Enconding

# Opcional read.csv2: tb se destinam à leitura de arquivos csv
# usada em países que usam uma vírgula como ponto decimal 
# e um ponto e vírgula como separador de campo.

imdb2 <- read.csv2("./Slides - R/dados/",  #caminho para o arquivo
                 #sep = ";", # não é necessário indicar o separador
                 header = T, # meus dados tem cabeçalho?
                 encoding = "UTF-8") #Enconding

# Lendo arquivos com o Tidyverse!

library(tidyverse)

imdb_csv <- read_csv(file = "./Slides - R/dados/imdb.csv", 
                     show_col_types = FALSE) # silenciar mensagem

# vem do pacote readr

class(imdb_csv)

# CSV, separado por ponto-e-vírgula (mesma coisa do R básico)
imdb_csv2 <- read_csv2()

# TXT, separado por tabulação (tecla TAB)
imdb_txt <- read_delim(file = "./Slides - R/dados/imdb.txt", delim = "\t")

# A função read_delim funciona para qualquer tipo de separador
imdb_delim <- read_delim("./Slides - R/dados/imdb.csv", delim = ",")
imdb_delim <- read_delim("./Slides - R/dados/imdb2.csv", delim = ";")

# direto da internet
imdb_web <- read_csv("https://raw.githubusercontent.com/curso-r/202005-r4ds-1/master/dados/imdb.csv")

# Interface point and click do RStudio também é útil!

# Lendo arquivos json

library(jsonlite)

imdb_json <- fromJSON("./Slides - R/dados/imdb.json",
  simplifyVector = TRUE,
  flatten = FALSE)
write.csv(imdb_json, "./Slides - R/dados/imdb_convertido.csv")


# Lendo arquivos do Excel -------------------------------------------------

library(readxl)

imdb_excel <- read_excel("./Slides - R/dados/imdb.xlsx")
excel_sheets("./Slides - R/dados/imdb.xlsx")

# quando queremos importar dados de uma planilha específica
imdb_excel <- read_excel("./Slides - R/dados/imdb.xlsx", sheet = "Sheet1" )

planilha1 <- read_excel("./Slides - R/dados/Pasta1.xlsx", sheet = "Planilha2" )


# Lendo arquivos zip

df <- unzip("./Slides - R/dados/discursos.zip", "discursos.csv") %>% 
       read_csv()

# Salvando dados ----------------------------------------------------------

# As funções iniciam com 'write'

# criar a pasta dados_output/
fs::dir_create("dados_output/")

# CSV
write_csv(imdb_csv, file = "dados_output/imdb.csv")

write_csv2(imdb_csv, file = "dados_output/imdb2.csv")

# Excel
library(writexl)
write_xlsx(imdb_csv, path = "dados_output/imdb.xlsx")

# O formato rds -----------------------------------------------------------

# .rds são arquivos binários do R
# Você pode salvar qualquer objeto do R em formato .rds

imdb_rds <- readr::read_rds("dados/imdb.rds")
readr::write_rds(imdb_rds, file = "dados/imdb_rds.rds")

write_rds(df2, "./Slides - R/dados/dfs.rds")



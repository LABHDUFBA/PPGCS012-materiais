########################################################
########### Aula tidyverse - Manipulando arquivos  ######
#######################################################
# COPYRIGHT ------------------------------------------------------------------ 
# Apresentação modificada de "https://github.com/curso-r/202110-r4ds-1)"
# ----------------------------------------------------------------------------

# Pacotes -----------------------------------------------------------------

library(tidyverse)

# Base de dados -----------------------------------------------------------

imdb <- read_rds("./Slides - R/dados/imdb.rds")

# Jeito de ver a base -----------------------------------------------------

glimpse(imdb)
names(imdb)
View(imdb)
head(imdb)

# dplyr: 6 verbos principais
# select()    # seleciona colunas do data.frame
# filter()    # filtra linhas do data.frame
# arrange()   # reordena as linhas do data.frame
# mutate()    # cria novas colunas no data.frame (ou atualiza as colunas existentes)
# summarise() + group_by() # sumariza o data.frame
# left_join()   # junta dois data.frames

# select ------------------------------------------------------------------

# Selecionando uma coluna da base

imdb %>% select(titulo)

# A operação NÃO MODIFICA O OBJETO imdb

imdb

# só vai salvar se usar o símbolo atribuição <-

titulo_dos_filmes <- imdb %>% select(titulo)

# Selecionando várias colunas

imdb %>% select(titulo, ano, orcamento)

# use o : para fazer sequencias
1:10

imdb %>% select(titulo:cor) # selecione de "titulo" a "cor"

# Funções auxiliares

imdb %>% select(starts_with("ator"))

imdb %>% select(contains("or"))

imdb %>% select(ends_with("or"))

# Principais funções auxiliares

# starts_with(): para colunas que começam com um texto padrão
# ends_with(): para colunas que terminam com um texto padrão
# contains():  para colunas que contêm um texto padrão

# Selecionando colunas por exclusão

imdb %>% select(-titulo)

imdb %>% select(-starts_with("ator"), -titulo, -ends_with("s"))

#  cuidado ao misturar o - e o +
imdb %>% select(-diretor, cor)

# arrange -----------------------------------------------------------------

# Ordenando linhas de forma crescente de acordo com 
# os valores de uma coluna

imdb %>% arrange(ano)

# Agora de forma decrescente

imdb %>% arrange(desc(ano))

# Ordenando de acordo com os valores 
# de duas colunas

imdb %>% arrange(desc(ano), desc(duracao))

# O que acontece com o NA?

df <- tibble(x = c(NA, 2, 1), y = c(1, 2, 3))
df %>% arrange(x)
df %>% arrange(desc(x))

# usando tudo junto

filmes_por_ano <- imdb %>% select(titulo, ano)

filmes_ordenados_por_ano <- filmes_por_ano %>%  arrange(ano)

View(filmes_ordenados_por_ano)

## View x view()

imdb_filmes_com_pipe <- imdb %>% 
  select(titulo, ano) %>% 
  arrange(ano) %>% 
  view()

imdb_filmes_com_pipe

View(imdb) # é do R base, não deixa salvar, salva como NULL

view() # faz parte do tidyverse, podemos salvar o resultado

# Conceitos importantes para filtros! --------------------------------------

## Comparações lógicas -------------------------------

x <- 1

# Testes com resultado verdadeiro - TRUE
x == 1

"a" == "a"

# Testes com resultado falso - FALSE
x == 2
"a" == "b"
"a" == "A"

# Maior
x > 3
x > 0

# Maior ou igual
x > 1
x >= 1

# Menor
x < 3
x < 0

# Menor ou igual
x < 1
x <= 1

# Diferente
x != 1
x != 2

x %in% c(1, 2, 3)
"a" %in% c("b", "c")

## Operadores lógicos -------------------------------

## & - E - Para ser verdadeiro, os dois lados 
# precisam resultar em TRUE

x <- 5
x >= 3 & x <= 7


y <- 2
y >= 3 & y <= 7

## | - OU - Para ser verdadeiro, apenas um dos 
# lados precisa ser verdadeiro

y <- 2
y >= 3 | y <=7

y <- 1
y >= 3 | y == 0


## ! - Negação - É o "contrário"

!TRUE

!FALSE


w <- 5
(!w < 4)


# filter ------------------------------------------------------------------

filter(imdb, ano >= 2010)

# Filtrando uma coluna da base
imdb %>% filter(ano >= 2010)
imdb %>% filter(diretor == "Quentin Tarantino")

# pergunta do Pedro
imdb %>% filter(diretor %in% c("Quentin Tarantino", 
                               "quentin tarantino"))

# Vendo categorias de uma variável
unique(imdb$cor) # saída é um vetor
imdb %>% distinct(cor) # saída é uma tibble

imdb %>% distinct(diretor)

# Filtrando duas colunas da base

## Recentes e com nota alta
imdb %>% 
  select(titulo, ano, nota_imdb) %>% 
  filter(ano > 2010, nota_imdb > 8.5)

imdb %>% 
  select(titulo, ano, nota_imdb) %>% 
  filter(ano > 2010 & nota_imdb > 8.5)

## Gastaram menos de 100 mil, faturaram mais de 1 milhão
imdb %>% filter(orcamento < 100000, receita > 1000000)

## Lucraram
imdb %>% filter(receita - orcamento > 0)

## Lucraram mais de 500 milhões OU têm nota muito alta
imdb %>% filter(receita - orcamento > 500000000 | nota_imdb > 9)

# O operador %in%
imdb %>% filter(ator_1 %in% c('Angelina Jolie Pitt', "Brad Pitt")) %>% View()

# Negação
imdb %>% filter(diretor %in% c("Quentin Tarantino", "Steven Spielberg"))  %>% View()
imdb %>% filter(!diretor %in% c("Quentin Tarantino", "Steven Spielberg"))  %>% View()

# O que acontece com o NA?
df <- tibble(x = c(1, NA, 3))

filter(df, x > 1)

# como manter os NAs quando filtrar
filter(df, is.na(x) | x > 1)

# Filtrando texto sem correspondência exata
# A função str_detect()
textos <- c("a", "aa","abc", "bc", "A", NA)

str_detect(textos, pattern = "a")

## Pegando os seis primeiros valores da coluna "generos"
imdb$generos[1:6]

str_detect(
  string = imdb$generos[1:6],
  pattern = "Action"
)

## Pegando apenas os filmes que 
## tenham o gênero ação
imdb %>% filter(str_detect(generos, "Action")) %>% View()

# Falamos até aqui em 14/10
# mutate ------------------------------------------------------------------

# Modificando uma coluna

# mutate(imdb, ....)


imdb %>% 
  mutate(duracao = duracao/60) %>% 
  View()

# Criando uma nova coluna

imdb %>% 
  mutate(duracao_horas = duracao/60) %>% 
  View()

imdb %>% 
  mutate(duracao_horas = duracao/60) %>% 
  select(titulo:duracao, duracao_horas, cor:ator_3) %>% 
  View()


imdb %>% 
  mutate(lucro = receita - orcamento) %>% 
  View()

imdb_com_lucro <- imdb %>% 
  mutate(lucro = receita - orcamento) %>% 
  view()


# A função ifelse é uma ótima ferramenta
# para fazermos classificação binária

imdb %>% mutate(lucro = receita - orcamento,
                houve_lucro = ifelse(lucro > 0, "Sim", "Não")) %>%
  View()

# summarise ---------------------------------------------------------------

# Sumarizando uma coluna

imdb %>% summarise(media_orcamento = mean(orcamento, na.rm = TRUE))

# repare que a saída ainda é uma tibble


# Sumarizando várias colunas
imdb %>% summarise(
  media_orcamento = mean(orcamento, na.rm = TRUE),
  media_receita = mean(receita, na.rm = TRUE),
  media_lucro = mean(receita - orcamento, na.rm = TRUE)
)

# Diversas sumarizações da mesma coluna
imdb %>% summarise(
  media_orcamento = mean(orcamento, na.rm = TRUE),
  mediana_orcamento = median(orcamento, na.rm = TRUE),
  variancia_orcamento = var(orcamento, na.rm = TRUE)
  # sd() = desvio padrao, min(), max()
)

# Tabela descritiva
tabela_descritiva <- imdb %>% summarise(
  media_orcamento = mean(orcamento, na.rm = TRUE),
  media_receita = mean(receita, na.rm = TRUE),
  qtd = n(),
  qtd_diretores = n_distinct(diretor)
)


distinct(imdb, diretor)

distinct(imdb, ator_1)

# versao do R base
unique(imdb$diretor)

# exportanto a tabela descritiva

write_csv2(tabela_descritiva,
           "dados_output/tabela_descritiva.csv")

# funcoes que transformam -> N valores
log(1:10)
sqrt()
str_detect()

# funcoes que sumarizam -> 1 valor
mean(c(1, NA, 2))
mean(c(1, NA, 2), na.rm = TRUE)
n_distinct(imdb$diretor)


# group_by + summarise ----------------------------------------------------

# Agrupando a base por uma variável.

imdb %>% group_by(cor)

# Agrupando e sumarizando
imdb %>% 
  group_by(cor) %>% 
  summarise(
    media_orcamento = mean(orcamento, na.rm = TRUE),
    media_receita = mean(receita, na.rm = TRUE),
    qtd = n(),
    qtd_diretores = n_distinct(diretor)
  ) %>% View()

imdb %>% 
  group_by(generos) %>% 
  summarise(n = n()) %>% 
  View()

imdb %>% 
  count(generos) %>% 
  View()

imdb %>% 
  count(diretor, ano) %>% 
  View()

# left join ---------------------------------------------------------------

# A função left join serve para juntarmos dois dataframes 
# tabelas a partir de uma chave. 
# Vamos ver um exemplo bem simples.

band_members <- dplyr::band_members 
band_instruments <- dplyr::band_instruments


band_members %>% left_join(band_instruments)
band_instruments %>% left_join(band_members)

# o argumento 'by'
band_members %>% left_join(band_instruments, by = "name")

# Fazendo de-para

depara_cores <- tibble(
  cor = c("Color", "Black and White"),
  cor_em_ptBR = c("colorido", "preto e branco")
)


imdb %>% 
  left_join(depara_cores, by = c("cor")) %>% 
  select(cor, cor_em_ptBR) %>% 
  View()

# OBS: existe uma família de joins
## Para entender mesmo vá aqui: "https://rpubs.com/CristianaFreitas/311735"

band_instruments %>% left_join(band_members)
band_instruments %>% right_join(band_members)
band_instruments %>% inner_join(band_members)
band_instruments %>% full_join(band_members)
band_instruments %>% anti_join(band_members)


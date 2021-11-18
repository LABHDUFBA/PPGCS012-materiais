library(tm) # Framework for text mining
library(dplyr) # Data preparation and pipes $>$
library(ggplot2) # for plotting word frequencies
library(wordcloud) # wordclouds!
library(tidyverse)


# Um corpus é uma coleção de textos, geralmente armazenados eletronicamente, 
# e a partir dos quais realizamos nossas análises. Um corpus pode ser uma coleção 
# de artigos de notícias ou das obras publicadas de um autor.

# Dentro de cada corpus, teremos artigos, histórias, volumes separados, 
# cada um tratado como uma entidade ou registro separado. 

#Cada unidade é chamada de "documento".

# Para esta unidade, usaremos os twees de  XXXXX como nosso corpus. 
# Vamos considerar cada tweet ou "pedaço" seja considerado um "documento".


## 1  - O pacote tm

### 1.1 Corpus Sources and Readers

#### O pacote `tm` suporta uma variedade de fontes e formatos. 

#### Execute o código abaixo para ver o que ele inclui

getSources() # fontes que podemos analisar
getReaders() # formatos que que podem ser lidos 


### Vamos criar um data-frame chamado "bozo" comos tweets de bozo


bozo <- read.csv("./Slides - R/dados/2021-11-12 - 11-14-22 - jairbolsonaro.csv", 
                encoding = "UTF-8") # lendo o arquivo CSV

# Se a coluna não tiver no encondig: bozo$tweet <- Encoding("UTF-8")

### Criando o corpus
corpus <- Corpus(VectorSource(csv$tweet))
corpus

### , podemos inspecionar os documentos usando inspec()

inspect(corpus[1]) # documento 1
inspect(corpus[24]) # documento 24

### 1.2 Funções de pré-processamento

#### Muitos aplicativos de análise de texto seguem uma 'receita' 
#### semelhante para pré-processament que envolvem: 
  
# 1. Tokenizar o texto para (unigram, bigrams, trigrams ou n-grams)
# 2. Converter todos os caracteres em minúsculas
# 3. Removendo pontuação
# 4. Removendo números
# 5. Removendo stopwords
# 6. "Stemming" ou lematização. 
# 7. Criação de matrizes de termos-documentos

#### ATENÇÃO: a ordem dessas etapas pode variar de acordo com a aplicação!!

#### O que é Token e Tokenizar?

# Na tokenização, pegamos um input (uma string) e dividimos ela
# em "tokens" (uma unidade de texto significativa, 
# que pode ser uma palavra/unigram, um pedaço dela, duas palavras, etc) 



#### O que é lematização e stemming?

# Lematização é a representação da palavra através de seu masculino singular, 
# adjetivos e substantivos e o infinitivo (no caso dos verbos)

# Stemming é a retirada de sufixos do radical, enquanto stem é o radical.


# 1.3  - Criar uma lista de stopwords
stopwords_pt <- stopwords("pt")
## Adding words in stopwords list
stopwords_add <- c("todo","hoje","pode","mil","dia","vai","saiba", "é", 
                  "sobre", "confira", "contra", "todos", "destes")
stopwords_pt <- c(stopwords_add, stopwords("pt"))


# 1.4 Criar uma DTM

### O pacote `tm` nos permite converter um corpus em uma matrizes de termos-documentos (DTM)
### enquanto completamos as etapas de pré-processamento em uma única etapa.



dtm <- DocumentTermMatrix(corpus,
                          control = list(stopwords_pt = TRUE,
                                         tolower = TRUE,
                                         removeNumbers = TRUE,
                                         removePunctuation = TRUE
                                         # opcional
                                         #stemming=TRUE
                                         ))

### 1.3 tf-idf - (weighted) ponderação/Peso das palavras

# Uma etapa de pré-processamento comum que alguns aplicativos podem exigir 
# é a aplicação do tf-idf (text de frequência inversa de termo, é um peso 
# que classifica a importância de um termo em seu documento contextual corpus. 
# O valor tf-idf aumenta proporcionalmente ao número de vezes que uma palavra 
# aparece no documento, mas é compensado pela frequência da palavra no corpus, 
# o que ajuda a ajustar o fato de que algumas palavras aparecem com mais 
# frequência em geral. Em outras palavras, dá importância a termos frequentes 
# no documento, mas raros no corpus.


dtm.weighted <- DocumentTermMatrix(corpus,
                                   control = list(weighting = function(x) weightTfIdf(x, normalize = TRUE),
                                                  stopwords = TRUE,
                                                  tolower = TRUE,
                                                  removeNumbers = TRUE,
                                                  removePunctuation = TRUE
                                                  ))
# inspecionar e comparar

inspect(dtm[1:5,1:5])
inspect(dtm.weighted[1:5,1:5])

## 2. Explorando o DTM

### 2.1 Dimensões

# Vamos ver a estrtura do DTM. 

# Imprima as dimensões do DTM. 

# Quantos documentos temos? Quantos termos?

dim(dtm)


### 2.2 Frequência

# Podemos obter a frequência dos termos 
# como um vetor convertendo a matriz de 
# termos do documento em uma matriz e usando
# colSums() para somar as contagens de colunas


freq <- colSums(as.matrix(dtm))
freq[1:5]
length(freq)


# Ordenando as frequências (termos mais ou menos frequentes)


# ordenando 
ord_freq <- sort(freq, decreasing = T)

# termos mais fequentes
head(ord_freq)

# termos menos frequentes
tail(ord_freq)


### 2.3 Plotando as Freqüências 

Vamos fazer um gráfico que mostra a frequência das frequências dos termos.
(Por exemplo, quantas palavras são usadas apenas uma vez? 5 vezes? 10 vezes?)


# frequencia de frequencias
head(table(freq),15)
tail(table(freq),15)

# plot
df_freq <- data.frame(freq)
df_freq <- tibble::rownames_to_column(df_freq, "palavra")


head(df_freq, 50) %>% 
  mutate(palavra = fct_reorder(palavra, -freq)) %>%
  ggplot(aes(x = freq, y = palavra, fill=freq))+
  geom_col()+
  gg



### 2.4 Explorando palavras comuns

# O pacote tm tem muitas funções úteis para ajudá-lo 
# a explorar palavras e associações comuns:
  
  
# Dê uma olhada nas palavras comuns

findFreqTerms(dtm, lowfreq = 30) # palavras que aparecem pelo menos 30 vezes

# Quais palavras se correlacionam com "brasil"? 
findAssocs(dtm, "brasil", 0.3)

# wordcoulds!

#install.packages("wordcloud")
library(wordcloud)
#install.packages("RColorBrewer")
library(RColorBrewer)
#install.packages("wordcloud2")
library(wordcloud2)

## wordcloud

set.seed(123)
wordcloud(words = df_freq$palavra, 
          freq = df_freq$freq, 
          max.words=100, 
          colors=brewer.pal(6,"Dark2"))

## wordcloud2

wordcloud2(data = df_freq,
           size = 0.5, 
           shape = 'pentagon')

# shape = 'circle'
# shape = 'star'

wordcloud2(data = df_freq,
           size = 2,
           minRotation = -pi/6,
           maxRotation = -pi/6,
           rotateRatio = 1)







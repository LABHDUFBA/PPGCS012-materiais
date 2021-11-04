library(tidyverse)

# Base de dados -----------------------------------------------------------

imdb <- read_rds("./Slides - R/dados/imdb.rds")

# Jeitos de ver a base -----------------------------------------------------

glimpse(imdb)
names(imdb)
View(imdb)
head(imdb)

# 20 Filmes com maior orcamento

imdb %>% 
  #top 20 mais caros
  top_n(20, orcamento) %>% 
  # para ordenar as barras do maior para o menor 
  mutate(titulo = fct_reorder(titulo, -orcamento)) %>%
  ggplot(aes(x = orcamento, y = titulo, fill = orcamento))+
  geom_col()+
  theme_gray()+
  ggtitle("20 filmes com o maior orçamento de todos os tempos", 
          subtitle = "elaborado no curso de ciência social computacional")+ 
  # para centralizar o título e o subtítulo (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))+
  # nomes dos eixos
  xlab("") + # Quando quiser suprimir o nome!
  ylab("") + # Quando quiser suprimir o nome!
  theme(legend.position = "") # Quando quiser suprimir a legenda!
  
#### Orçamento ao longo do tempo

imdb %>% 
  ggplot(aes(x = ano, y = orcamento))+
  geom_line(color="blue")+
  theme_gray()+
  ggtitle("20 filmes com o maior orçamento de todos os tempos", 
          subtitle = "elaborado no curso de ciência social computacional")+ 
  # para centralizar o título e o subtítulo (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))+
  # nomes dos eixos
  xlab("") + # Quando quiser suprimir o nome!
  ylab("") + # Quando quiser suprimir o nome!
  theme(legend.position = "")+ # Quando quiser suprimir a legenda!
  # ELEMENTO NOVO!
  # o que ele faz?
  annotate("text", 
           x = 2007, 
           y = 3.3e+08, 
           label = "Pirates of the Caribbean: \n At World's End",
           color = "red")


imdb %>%
  #
  mutate(lucro = receita - orcamento) %>%
  #
  top_n(20, lucro) %>% 
  # para ordenar as barras do maior para o menor 
  mutate(titulo = fct_reorder(titulo, -lucro)) %>%
  # plot
  ggplot(aes(x = lucro, y = titulo, fill = lucro))+
  geom_col()+
  theme_gray()+
  ggtitle("20 filmes com o maior lucro de todos os tempos", 
          subtitle = "elaborado no curso de ciência social computacional")+ 
  # para centralizar o título e o subtítulo (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))+
  # nomes dos eixos
  xlab("") + # Quando quiser suprimir o nome!
  ylab("") + # Quando quiser suprimir o nome!
  theme(legend.position = "") + # Quando quiser suprimir a legenda!
  # ELEMENTO NOVO! 
  # o que ele faz?
  scale_fill_gradient2(low="blue", high="red")
   

  

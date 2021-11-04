########################################################
########### Aula ggplot 2 - gerando gráficos      ######
#######################################################


# dplyr antes do plot + modificações estéticas ----------

# altura x nome

starwars %>% 
  # filtrando e eliminando os NA
  filter(!is.na(altura)) %>% 
  # filtrando pelos mais altos de 200cm(2metros)
  filter(altura >= 200) %>%
  # para ordenar as barras do maior para o menor 
  mutate(nome = fct_reorder(nome, -altura)) %>%
  # começa o plot
  ggplot(aes(x = altura, 
             y = nome, fill = altura)) +
  geom_col()+
  theme_gray()+
  ggtitle("Altura dos diferentes personagens")+ 
  # para centralizar o título (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5),
        # editando o tamanho do texto do eixo y 
        axis.text.y = element_text(size = 7))+
  # nomes dos eixos
  xlab("") + # Quando quiser suprimir o nome!
  ylab("") + # para o nome do eixo y
  theme(legend.position = "") # Quando quiser suprimir a legenda!


# EXERCÍCIOS -----------------------------------------------

## 1. Preencha com o que falta:

starwars %>% 
  # calcule o IMC
  mutate() %>%
  # filter NA
  filter() %>% 
  # selecionar apenas o nome e o IMC
  select() %>% 
  # para ordenar as barras do maior para o menor 
  mutate(nome = fct_reorder(nome, -IMC)) %>%
  # plot aes
  ggplot(aes(x = ,
             y = , 
             fill = )) +
  # escolha o geom de colunas
  geom_ +
  # tema de sua preferência
  theme_ +
  # insira um título
  __________ + 
  # para centralizar o título (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5),
        # editando o tamanho do texto do eixo y 
        axis.text.y = element_text(size = 7))+
  # suprima o nome do eixo x
  _______ + 
  # suprima o nome do eixo x
  ____________+
  # suprima a legenda!
  ___________________________
  


# 2.Faça um gráfico da média de altura das diferentes espécies

starwars %>% 
  # filter genero masculino
  filter() %>% 
  # agrupe por especie
  group_by(especie) %>% 
  # Summarise a média da altura
  summarise(media_altura = mean()) %>% 
  # filtrando e eliminando os NA de media_altura
  filter() %>%   
  # para ordenar as barras do maior para o menor 
  mutate(especie = fct_reorder(especie, -media_altura)) %>%
  # plot
  ggplot(aes(x = media_altura, y = , fill = ))+
  # escolha o geom
  geom_()+
  # escolha o seu tema
  theme_()+
  # título e subtítulo
  ggtitle("Gráfico da média de altura das diferentes espécies", 
          subtitle = "elaborado no curso de ciência social computacional")+ 
  # para centralizar o título e o subtítulo (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))+
  # suprima o nome do eixo x
  _______ + 
  # suprima o nome do eixo x
  ____________+
  # suprima a legenda!
  _______________________

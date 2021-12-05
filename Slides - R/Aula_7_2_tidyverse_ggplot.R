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
  mutate(IMC = massa / ((altura/100)^2)) %>%
  # filter NA
  filter(!is.na(IMC)) %>% 
  # selecionar apenas o nome e o IMC
  select(nome, IMC) %>% 
  # para ordenar as barras do maior para o menor 
  mutate(nome = fct_reorder(nome, -IMC)) %>%
  # plot aes
  ggplot(aes(x = IMC ,
             y = nome , 
             fill = IMC)) +
  # escolha o geom de colunas
  geom_col(show.legend = F) +
  # tema de sua preferência
  theme_gray() +
  # insira um título
  ggtitle("IMC dos personagens de Starwars")+ 
  # para centralizar o título (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5),
        # editando o tamanho do texto do eixo y 
        axis.text.y = element_text(size = 8))+
  # suprima o nome do eixo x
  xlab("") + 
  # suprima o nome do eixo x
  ylab("")
  


# 2.Faça um gráfico da média de altura das diferentes espécies

starwars %>% 
  # filter genero masculino
  filter(genero == "Masculino") %>% 
  # agrupe por especie
  group_by(especie) %>% 
  # Summarise a média da altura
  summarise(media_altura = mean(altura)) %>% 
  # filtrando e eliminando os NA de media_altura
  filter(!is.na(media_altura)) %>%   
  # para ordenar as barras do maior para o menor 
  mutate(especie = fct_reorder(especie, -media_altura)) %>%
  # plot
  ggplot(aes(x = media_altura, y = especie , fill = media_altura))+
  # escolha o geom
  geom_col(show.legend = F)+
  # escolha o seu tema
  theme_gray()+
  # título e subtítulo
  ggtitle("Gráfico da média de altura das diferentes espécies", 
          subtitle = "elaborado no curso de ciência social computacional")+ 
  # para centralizar o título e o subtítulo (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))+
  # suprima o nome do eixo x
  xlab("")+ 
  # suprima o nome do eixo y
  ylab("")

#### resposta exercícios

starwars %>% 
  mutate(IMC = massa / ((altura / 100)^2)) %>%
  # filter NA
  filter(!is.na(IMC)) %>% 
  # selecionar apenas o nome e o IMC
  select(nome, IMC) %>% 
  # para ordenar as barras do maior para o menor 
  mutate(nome = fct_reorder(nome, -IMC)) %>%
  # plot
  ggplot(aes(x = IMC,
             y = nome, 
             fill = IMC)) +
  geom_col()+
  theme_gray()+
  ggtitle("Índice de Massa Corporal dos diferentes personagens")+ 
  # para centralizar o título (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5),
        # editando o tamanho do texto do eixo y 
        axis.text.y = element_text(size = 7))+
  # suprima o nome do eixo x
  xlab("") + 
  # suprima o nome do eixo x
  ylab("") +
  # suprima a legenda!
  theme(legend.position = "") 
 

# Faça um gráfico da média de altura das diferentes espécies

starwars %>% 
  filter(genero == "Masculino") %>% 
  group_by(especie) %>% 
  summarise(media_altura = mean(altura)) %>% 
  filter(!is.na(media_altura)) %>% # função dplyr + pipe
  # para ordenar as barras do maior para o menor 
  mutate(especie = fct_reorder(especie, -media_altura)) %>%
  ggplot(aes(x = media_altura, y = especie, fill = especie))+
  geom_col()+
  theme_gray()+
  # título e subtítulo
  ggtitle("Gráfico da média de altura das diferentes espécies", 
          subtitle = "elaborado no curso de ciência social computacional")+ 
  # para centralizar o título e o subtítulo (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))+
  # nomes dos eixos
  xlab("") + # Quando quiser suprimir o nome!
  ylab("") + # Quando quiser suprimir o nome!
  theme(legend.position = "") # Quando quiser suprimir a legenda!
  
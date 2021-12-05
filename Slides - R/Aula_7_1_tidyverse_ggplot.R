########################################################
########### Aula ggplot 1 - gerando gráficos        ######
#######################################################

# COPYRIGHT ------------------------------------------------------------------ 
# Apresentação modificada de 
#"http://rday.leg.ufpr.br/materiais/intro_ggplo2_tomas.pdf"


# O que é um gráfico? -------------------------------------------------------


## O gráfico é um meio de comunicação e deve ser adequado ao seu
## público e objetivo. 

## É  diferente preparar um gráfico com conclusões ou fazer um 
## gráfico exploratório para você mesmo.

# O ggplot2 ---------------------------------------------------------------

## O ggplot2 é mais do que um pacote para fazer gráficos; 

## Trata-se de uma implementação da gramática dos gráficos 
## em camadas no R.

## ggplot2: 7 elementos ---------------------------------------------------

# FUNDAMENTAIS ---------------------------

   ### 1. data - dados
   ### 2. mapeamento de estéticas - aesthetic - aes() - cor/formato
   ### 3. geometrias - geom() - barra/linha/ponto

# ADICIONAIS ---------------------------

### 4. estatísticas - stat() - mediana, máximo
### 5. facetas - facet()
### 6. coordenadas - coord() - polar, cartesiana
### 7. t(h)emas - theme() - eixos, título

### 8. plus: annotated!


# Estrutura básica ---------------------------------------------------------


## data + aes + geom

ggplot(data = nome_de_um_dataframe,
       aes(x = variável1, y = variável2)) +
  geom_col()+
 

## ao vivo:

### dados

starwars <- dados::dados_starwars

### uma variável contínua: altura 

ggplot(data = starwars,
       aes(altura)) +
  # contagem com barras
  geom_histogram()


ggplot(data = starwars,
       aes(altura)) +
  # contagem com linhas
  geom_freqpoly()


### uma variável contínua: massa

ggplot(data = starwars,
       aes(massa)) +
  # contagem com barras
  geom_histogram()

ggplot(data = starwars,
       aes(massa)) +
  # contagem com linhas
  geom_freqpoly()

### duas variáveis

#### pontos: massa x altura

ggplot(data = starwars,
       aes(x = massa,
           y = altura)) +
  geom_point()

#### nomes: massa x altura

ggplot(data = starwars,
       aes(x = massa,
           y = altura)) +
  geom_label(aes(label = nome))


### duas variáveis: uma discreta outra contínua

### ATENÇÃO QUE VAMOS SIMPLIFICAR A COISA 
### eliminando o "data ="

#### nome x altura - coluna

ggplot(starwars,
       aes(x = altura,
           y = nome)) +
  geom_col()

#### nome x massa - coluna

ggplot(starwars,
       aes(x = massa,
           y = nome)) +
  geom_col()

#### genero x altura - o famoso boxplot

ggplot(starwars,
       aes(x = genero,
           y = altura)) +
  geom_boxplot()


#### genero x altura - o famoso violino (boxplot + histograma)

ggplot(starwars,
       aes(x = genero,
           y = altura)) +
  geom_violin()



### 4. estatísticas - stat() - mediana, máximo


# Em breve!


### 5. facetas - facet()

#### histograma separado por gêneros

ggplot(starwars,
       aes(altura)) +
  # contagem com barras
  geom_histogram()+
  # facetas por gênero
 facet_wrap(~genero)

#### histograma separado por especies

ggplot(starwars,
       aes(altura)) +
  # contagem com barras
  geom_histogram()+
  # facetas por especie
  facet_wrap(~especie)


#### histograma separado por gêneros + colorido!

ggplot(starwars,
       aes(altura,  fill = genero)) +
  # contagem com barras
  geom_histogram()+
  # facetas por gênero
  facet_wrap(~genero)

#### histograma separado por especies + colorido!

ggplot(starwars,
       aes(altura, fill = especie)) +
  # contagem com barras
  geom_histogram()+
  # facetas por especie
  facet_wrap(~especie)


#### massa x altura separado por genero + colorido

ggplot(starwars,
       aes(x = altura,
           y = massa,
           color = genero)) +
  geom_point()+
  facet_wrap(~genero)


### 6.coordenadas - coord() - polar, cartesiana

# Em breve!



### 7. t(h)emas - theme() - eixos, título


#### theme - variar a última linha e observar

ggplot(starwars,
       aes(x = massa,
           y = altura)) +
  geom_point()+
  # apague o final _bw e veja as variações
  theme_minimal()

#### Titulo do gráfico, nomes dos eixos 

ggplot(starwars,
       aes(x = massa,
           y = altura)) +
  geom_point()+
  theme_gray()+
  # para o titulo do gráfico
  ggtitle("Gráfico de massa por altura dos personagens de Starwars")+ 
  # para centralizar o título (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5))+
  # nomes dos eixos
  xlab("") + # para o nome do eixo x
  ylab("") # para o nome do eixo y


#### Titulo do gráfico, nomes dos eixos 

ggplot(starwars,
       aes(x = genero,
           y = altura)) +
  geom_boxplot()+
  # para o titulo do gráfico
  ggtitle("Boxplot da altura de acordo com o gênero do personagem StarWars")+ 
  # para centralizar o título (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5))+
  # nomes dos eixos
  xlab("") + # Quando quiser suprimir o nome!
  ylab("kg") # para o nome do eixo y



#### Titulo do gráfico, nomes dos eixos editando a posição da legenda

# top, bottom, left, right (padrão)


ggplot(starwars,
       aes(x = altura,
           y = massa,
           color = genero)) +
  geom_point()+
  facet_wrap(~genero)+
  ggtitle("Gráfico da massa por altura dos diferentes gêneros")+ 
  # para centralizar o título (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5))+
  # nomes dos eixos
  xlab("") + # Quando quiser suprimir o nome!
  ylab("") + # para o nome do eixo y
  theme(legend.position = "bottom") # legenda embaixo do gráfico


### Titulo + subtítulo e atribuindo a um objeto


graf1 <- ggplot(starwars,
       aes(altura, fill = especie)) +
  # contagem com barras
  geom_histogram(show.legend = F)+
  # facetas por especie
  facet_wrap(~especie)+
  # título e subtítulo
  ggtitle("Gráfico de altura das diferentes espécies", 
          subtitle = "elaborado no curso de ciência social computacional")+ 
  # para centralizar o título e o subtítulo (sempre vai ser isso)
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))+
  # nomes dos eixos
  xlab("") + # Quando quiser suprimir o nome!
  ylab("")  # Quando quiser suprimir o nome!
 

graf1


############# ATENÇÃO ####################

# Para salvar o gráfico na memória do R é preciso atribuí-lo a um objeto




### ===========================================================================
### INTRODUCAO AO R - MQ 2018
### ===========================================================================

# -----------------------------------------------------------------------------
# Professores: 
#             
#             Rogério Barbosa
#             antrologos@gmail.com
#             http://sociaisemetodos.wordpress.com
#
#             Denisson Silva  
#             denissoncsol@gmail.com
#             www.denissonsilva.com
#
# -----------------------------------------------------------------------------

#### Aula 1

# Material de referencia para principios basicos do R:
# Capitulo 4 do livro "R for data Science"
# http://r4ds.had.co.nz/workflow-basics.html


############################################

#### R como calculadora

##### Adicao
1 + 1 
1 + 1  + 1
45 + 68
(4+4) + 60
4 + 34.5
.00000001 + .01
.021 + 87


##### Subtracao
25 - 2
8 - 5
(4+4) - 60


##### Multiplicacao
6*5
(4 + 5)*6
4 + (5*6)


##### Divisao
250/25
(4 + 2)/3
4 + 2/3
10/3

#### Resto de divisao
10%%3

## #Potencia
2^10

#Raiz quadrada
sqrt(100)

#Quaisquer outras raizes
8^(1/3) #raiz cubica

# Exponencial (e^x)
exp(1) 
exp(2) 

# OBS: "e" (numero de Neper) = 2.718281828459045235360287^2

# Logaritmo natural (base e)
log(4)
log(exp(1))

# Logaritmo em qualquer base
log(4)/log(10) # log de quatro na base 10

# Uso de parentesis
1 + 3/4 + sqrt(65)
(1 + 3)/4 + sqrt(65)
1 + 3/(4 + sqrt(65))
(1 + 3)/(4 + sqrt(65))


############################################
#### Obtendo ajuda dentro do R: help

# Para saber mais sobre uma função e sua utilização, consulte-a no arquivo de ajuda
help(sqrt)
help(log)

# Há uma forma ainda mais fácil de fazer isso: simplesmente anteceda o nome da função com
# uma interrogação
?sqrt


# DICA: Quando erros ocorrem, especialmente com funcoes, a melhor coisa
# a se fazer é pedir ajuda. 
exp("a")

?exp  
# A razão para o erro é essa:
#       "x	a numeric or complex vector."
# 
# Como introduzimos algo não numérico dentro da função, não há como calcular a exponencial

############################################
#### Objetos (parte 1)

# Podemos guardar informacoes e resultados dentro de "objetos". Ou seja, objetos
# sao como "recipientes" de informacoes (de qualquer tipo). Podemos salvar o 
# numero 2 dentro de um objeto chamado "x". Para isso simplesmente dizemos que 
# x = 2. Depois, para recuperar a informacao guardada dentro desse objeto, basta
# digitar seu nome e pressionar ENTER:

x <- 2
print(x)
x #auto-printing
# Podemos ler a linha de comando acima de duas maneiras:
# -- atribuimos o valor 1 ao vetor "a"
# -- "a" recebe 1


# O operador de atribuicao tambem pode ser representado como <- 
x <- 5
x


# Objetos podem guardar resultados:
y = 4 + 5
y

# E podemos produzir novos resultados combinando objetos. Definimos que x=2 e 
# y=9. Logo, y-x deve ser 4 (pois atribuimos x <- 5 logo acima).
y-x


# E a operação realizada entre dois objetos pode ser ainda guardada num terceiro:
w = x - y


# Um objeto pode ser uma cópia de outro, inclusive:
z = w

############################################
#### Listando e removendo objetos existentes

# ls() ? o comando que lista os objetos que existem na memoria do R
ls()

# rm() ? o comando que remove da memoria os objetos existente. Mas 
# ? preciso nomear os objetos a serem deletados
rm(z)


# Mas podemos remover v?rios objetos de uma s? vez
rm(x, y, w)

# Ou remover TUDO o que houver... 
rm(list=ls())



############################################
### ESTILO (1): Dando nomes aos objetos


# Na nomeacao de objetos EVITE: 
# - Nomes que já são utilizados por alguma funcao: e.g. rm <- 1
# - Nomes que comecam por numero: 1x <- 1
# - Nomes que comecam com caracteres especiais: _a <- 1 ou .1 <- 1
# - Nomes com espaco: meu objeto <- 1
# - Tambem é boa pratica nao usar letras maiusculas porque o R é case sensitive.



############################################
### ESTILO (2): Dicas para a escrita do código

# Para manter a legibilidade do codigo, é interessante inserir espacos
# entre argumentos, objetos e parametros. Exemplos:

x<-1 # Ruim
x <- 1 # Bom

2*1+4+2 # Ruim
2 * 1 + 4 + 2 # Bom

x+x+sum(x,x,na.rm=TRUE) # Ruim
x + x + sum(x, x, na.rm = TRUE) # Bom


# Tambem é recomendável usar _ para espacar nomes dos objetos
meuobjeto <- 1 # Ruim
meu_objeto <- 1 # Bom


# E evitar acentos e caracters especiais, mesmo nos comentarios (porque pode abrir de 
# forma errada em outros computadores):

ação <- 1 # Ruim
acao <- 1 # bom


# Por fim, uma boa pratica é sempre pular uma linha entre codigos diferentes,
# do mesmo modo como este codigo esta organizado: cada bloco de codigo esta
# separado por dois espacos.

######################### LEIA COM ATENÇÃO ########################################

# CONCLUINDO: Um objeto de qualquer uma dessas classes é chamado de objeto atômico.
# Esse nome se deve ao fato de essas classes não se misturarem, isto é, para um objeto ter a classe numeric, por exemplo, todos os seus valores precisam ser numéricos.

####### Mas como atribuir mais de um valor a um mesmo objeto? 

##########   Para isso, precisamos criar VETORES.


############################################
#### Vetores (Parte 1)

##### Definicoes basicas

# Vetores são estruturas muito importantes dentro R. 

# Em especial, pensando em análise de dados, precisamos estudá-los pois cada 
# coluna de um DATA FRAME (calma que você vai saber o que é!) será representada como um vetor.

# Vetores no R são apenas conjuntos INXDEXADOS de valores. 
# Para criá-los, basta colocar os valores separados por vírgulas dentro de um c().

c(1,2,3,4,5,6)


# c() significa "combine". Com essa funcao, combinamos diversos valores num unico
# objeto, mais complexo, chamado **vetor**. Agora, _x_ sera um vetor que recebe 
# os valores 1,2,3,4,5,6. 

x <- c(1,2,3,4,5,6)
x


# E podemos fazer operacoes com vetores normalmente:
x <-  c(1 , 2 , 3 , 4 , 5 , 6)
y <- c(2,2,2,2,2,2)

x+y #soma elemento-a-elemento
x-y #substracao elemento-a-elemento
x*y #multiplicacao elemento-a-elemento
x/y #divisao elemento-a-elemento

x %*% y # produto escalar


# Para verificar o numero de componentes de um vetor, usamos a funcao **length**
length(x)
length(x + y)

z <- x + y
z
length(z)


# Podemos tambem atribuir nomes aos componentes
b = c(24,29,22)
b
names(b)
names(b) = c("Aluno 1","Aluno 2","Aluno 3")
b
names(b)


### Dizemos que "names" a um atributo do vetor b
# Os nomes podem ser conferindo no proprio momento da criacao do vetor
alunos <- c(Aluno1 = 25, Aluno2 = 22, Aluno3 = 21 )
alunos

# Posso combinar vetores (e nao apenas valores...)
alunos2 <- c(Aluno4 = 32, Aluno5 = 28, Aluno6 = 27)
alunos2

c(alunos,alunos2)

alunos <- c(alunos,alunos2)
alunos

############################################
##### Vetores (parte 2) - Introducao a classes de vetores

# Semelhantes aos objetos atômicos, há varios tipos (classes) de vetores. 

# A classificacao depende do tipo de informacao que é armazenada. 

# Vetores que contem numeros reais, sao chamados **numeric**. 
# Vetores que contem informacao textual sao chamados **character**. 

#Podemos descobrir a classe de um vetor atraves da funcao **class**.

nomes = c("Camila","Joao","Leandro","Alessandro","Rita")
idades = c(13,31,38,32,19,41)

class(nomes)
class(idades)


############################################
##### Vetores (parte 3) - Vetores textuais

# Acabamos de ver que o R tambem guarda informacoes nao numericas. Para armazenar 
# dados textuais, sempre utilizamos aspas

"rogerio"


# E podemos compor vetores textuais:
vetor_textual = c("rogerio","leonardo","denisson")
vetor_textual


# No entanto, dados e vetores textuais nao podem ser manipulados com operacoes 
# matematicas. Mas ha operacoes especificas para vetores textuais. Uma delas, 
# que utilizaremos com grande frequencia, e a funcao **paste()**. Ela concatena 
# elementos textuais (de modo semelhante ao que faz a funcao CONCATENAR do Excel):

paste("A","galinha","atravessou","a","rua")


# Por default, os elementos sao separados por espacos. Mas podemos alterar isso,
# com o uso do argumento **sep**:

paste("A","galinha","atravessou","a","rua",sep="$$")
paste("A","galinha","atravessou","a","rua",sep="")

frase <- paste("A","galinha","atravessou","a","rua",sep="$$")
frase

############################################
#### Vetores (parte 4) - Classes numeric e integer

# Os numeros reais sao registrados na classe **numeric** (double precision). 
# numeros inteiros sao guardados como **integer**. 

4 # numeric
.5 # numeric
9L # inteiro

# A letra L apos um valor indica que ele e um numero inteiro, isto e, nao tem
# valores em casas decimais. 

class(4)
class(.5)
class(9L)

inteiros <- c(9L, 2L, 4L)
class(inteiros)
inteiros

numeric <- c(9, 2, 4)
class(numeric)
numeric

##################### IMPORTANTE ########################################

# O R aloca menos memoria para numeros inteiros, o que faz com que ocupem menos
# espaco (em disco e na memoria RAM). Para grandes bancos de dados, isso faz
# muita diferenca



#########################################################
### Vetores (Parte 5) - Classes de vetores unitarios - Revisao e extensao

# Numeric (numeros reais: aceitam decimais)
1
class(1)

e = 34
class(e)

f = c(3,2,2,0)
f
class(f)

# Integer (numeros inteiros, nao aceitam decimais)
1L
class(1L)

g = c(3L,2L,2L,0L)
g
class(g)

# Logical (guardam apenas as informacoes "VERDADEIRO"/"FALSO")
TRUE
FALSE
T
F
i = c(T,F,T,T,T)
i
class(i)

# Character (Informacoes de tipo texto, "string")
"Rogerio"
"Leonardo"
class("Denisson")
j = c("Almeida","Castro","Barbosa","Jeronimo","Sangali")
j

# Complex
complex(real = 1, imaginary = 4)


# Para pensar... qual a diferenca entre 
# "1" e 1
# "132" e 132
# "A" e "a"


#########################################################
### Vetores (Parte 6) - Transformacao de vetores entre diferentes classes
###### Coercao implicita

# Observe que nao e possivel ter dados textuais e numericos num 
# unico vetor. Quando tentamos compor um vetor "misto" usando a funcao **c()**, 
# o R automaticamente transforma o resultado em textual. Dizemos assim que, no R,
# os vetores sao "atomicos". Isto e, nao podem pertencer a duas classes ao mesmo 
# tempo. 
misto = c("Camila",1, 2, 3, "Joao")
class(misto)


# Quando combinamos valores de diferentes classes, automaticamente o R 
# "coage" (ou "forca") o vetor para que se conforme a uma classe que exerce 
# dominancia. De modo geral, a dominancia segue a seguinte ordem:

##  character > numeric > integer > logic

x <- c(7,"a") #character
x <- c(TRUE,"Antonio") #character
x <- c(32,TRUE) #numeric
x <- c(6L, FALSE) #integer

# Dizemos que nesses casos houve "COERCAO IMPLICITA"

#########################################################
### Vetores (Parte 7) - Transformacao de vetores entre diferentes classes
###### Coercao explicita

# Podemos explicitamente alterar a classe de vetor com o uso de funcoes com 
# que se iniciam com as. : 

# - as.numeric()
# - as.logical()
# - as.character()
# - etc...

x <- 1:10 
x
class(x)

as.numeric(x)
y <- as.numeric(x)
y
class(y)

class(as.numeric(x))

as.logical(x)
as.character(x)


# Mas esse tipo de coercao nem sempre funciona:
x <- c("a","b","c")
as.numeric(x)
as.logical(x)
as.complex(x)


############################################ 
##### Selecionando componentes dentro de vetores (subsetting)

# Como vimos, vetores sao objetos compostos, que armazemam mais de uma informacao
# ao mesmo tempo. Dizemos que vetores tem componentes ou elementos. Para selecionar
# um componente dentro de um vetor, utilizamos os colchetes [] e, dentro deles, 
# indicamos a posicao do objeto. O numero dentro do colchete, que indica a posicao
# do componente e chamado de **indice**.

j = c("Pedro", "Antonio", "Fernando","Claudia")
j

j[1]
j[2] 
j[20] #nao existe valor na vigesima posicao de j
j[2:4]
b["Aluno 1"]
b[1]

vetor_textual[1]
vetor_textual[2]
vetor_textual[3]

# Podemos utilizar vetores como indices. No exemplo abaixo, exibimos os valores 
# do vetor_textual cujos indices (posicoes) sao 1,2,3:
vetor_textual
vetor_textual[1:3]
1:3
x <- 1:3
x
class(x)
vetor_textual[x]


selecao <- c(1,3)
class(selecao)
vetor_textual[selecao]
vetor_textual[c(1,3)]

class(vetor_textual[c(1,3)])

# Os indices sao muitissimo utilizados para criar subconjuntos ou fazer selecoes
# especificas. 

b
b["Aluno 1"]
b[c("Aluno 1", "Aluno 3")]


############################################
##### Sequencias

# Ha diversas formas de criar vetores. Com os comandos **seq** e **:** sao 
# bastante usados para criar sequencias de valores sucessivos. Usando **:**, 
# temos os seguintes exemplos:
1:10
1:30
32:100
1.5:10  
20:1
0:-10


# No entanto, a funcao **seq** permite mais opcoes e detalhes:
seq(from = 1, to = 30)
seq(from = 1, to = 30, by=.1)
seq(1, 30, .1)
seq(5,10,length=30) #sequencia de tamanho delimitado

sequencia <- seq(5,10,length=30)
sequencia
length(sequencia)

seq(100,50,by=-.5)



# Podemos tambem criar sequencias com repeticoes com o uso da funcao **rep**.
rep(0, times = 40)
rep(1,10)

rep(1:3,10)
rep(c(1, 2, 4), times = 10)
rep(c(0, 1, 2), each = 10)
rep(c(TRUE,FALSE), each = 10)
rep(c("Joao","Maria"), times = 10)

Joao_Maria <- rep(c("Joao","Maria"), times = 10)
Joao_Maria[7]


############################################ 
#### Missing values

# No R, os valores ou casos "perdidos" sao marcados com o simbolo 
# **NA**. As funcoes **is.na()** e **is.nan()** retornam valores 
# logicos que indicam *missing values*. 

# E importante notar que:
## - Os valores missing pertencem a classes atomicas dos vetores de 
## que fazem parte. NaN e um caso de NA (isto e, NaN e um NA, mas o 
## contrario nao e verdadeiro)

x <- c(1,2,NA,10,3) # Numerico!!!
class(x)
is.na(x)
is.nan(x)

# NaN - Significa "Not a number" 
0/0
is.na(0/0)
is.nan(0/0)


x <- c(1,2,NA,NaN,4)
x
class(x)
is.na(x)
is.nan(x)


############################################
#### Matrizes

# Matrizes sao outra classe de objetos do R. sao vetores cujos valores foram 
# ordenados em linhas e colunas. Matrizes sao criadas atraves do comando 
# **matrix()**. Devemos especificar, como argumentos, os dados que farao 
# parte da matriz, o numero de linhas e o numero de colunas:

A = matrix(c(1,2,3,4,5,6,7,8),nrow=2,ncol=4)
A

B = matrix(1:200,nrow=20,ncol=10)
B


m <- matrix(nrow=2, ncol=3)
m

matrix(seq(1,99.9,by=.1),nrow=90,ncol=11)

matrix(1:100,nrow=90,ncol=10)

A
class(A)



# Para selecionar um elemento especifico de uma matriz, tambem utilizamos 
# os colchetes []. 
A[5] # quinto elemento da matriz
class(A[5])

A[1,4] # elemento localizado na primeira linha, quarta coluna
class(A[1,4])

A[,2] # Segunda coluna inteira
class(A[,2])

A[1,] # primeira linha inteira


# Matrizes tambem sao vetores atomicos. Ou seja, so podem conter um tipo de 
# informacao: **ou** numerica **ou** textual; mas nao os dois tipos ao mesmo tempo.
# O tamanho de uma matriz pode ser verificado de diferentes modos:

length(A) # numero de elementos
dim(A) # dimensoes da matriz, isto e, o numero de linhas e columas

dim(A)[2]

nrow(A) # numero de linhas
ncol(A) # numero de colunas

# No R e sempre importante saber com que tipo de objeto estamos trabalhando. 
# Cada tipo de objeto (ou classe) tem propriedades especificas e sao acessadas 
# e analisadas com o uso de funcoes e metodos especificos. Os comandos **nrow** 
# e **ncol** nao funcionam, por exemplo com os vetores comuns. Para descobrir o 
# tipo de objeto com o qual estamos lidando, sempre devemos usar a funcao **class**. 

class(A) # Observem que "matrix" e um tipo de classe!


# Multiplicação de matrizes (linhas por colunas)
A %*% A 


############################################
#### Dataframes

# Como as matrizes, Dataframes tambem sao objetos organizados em linhas e colunas. Mas 
# diferentemente das matrizes, cada coluna tem suas proprias propriedades e pode conter 
# informacoes de tipos diferentes. Uma coluna pode ser character, outra numeric. Nesse 
# sentido, os dataframes ocupam, no R, a mesma funcao dos bancos de dados nos softwares 
# convencionais de estatistica e analise de dados (como SPSS ou Stata). Podemos
# entender os dataframes como um conjunto de vetores atomicos de diferentes tipos,
# que devem, no entanto, conter sempre o mesmo numero de componentes. Ora, num
# banco de dados todas as variaveis (colunas) tem o mesmo numero de observacoes 
# (linhas). Num dataframe e a mesma coisa.

# Para criar um dataframe, usamos a funcao **data.frame()**. Devemos tambem especificar
# o nome das colunas/variaveis:

dados = data.frame(Nomes=c("Antonio","Gilberto","Mauricio","Isabela"),
                   Profissoes=c("Video Maker","Comerciante","Bancario","Estudante"),
                   Cidades=c("Belo Horizonte","Sao Paulo","Belo Horizonte","Sao Paulo"),
                   Idades=c(65,50,67,19),
                   stringsAsFactors=F)
dados

# E facil reconhecer visualmente um dataframe. Mas uma avaliacao precisa pode ser
# feita:  **data.frame** e um tipo especifico de objeto (classe) do R:
class(dados)
class(dados[4])
class(dados[[4]])

# Assim como nas matrizes, verificar o tamanho dos dataframes de diversas maneiras
# (mas o comando "length" nao funciona):
nrow(dados)  #numero de linhas/observcoes/casos
ncol(dados)  #numero de colunas/variaveis
dim(dados)   #dimensao do dataframe (linhas por colunas)


# Podemos acessar elementos de um dataframe de diversas maneiras. 
dados[1] #retorna a primeira coluna (com a class data.frame)
class(dados[1])

dados[[1]] #retorna a primeira coluna (com a class "character")
class(dados[[1]])

dados[4] #retorna a quarta coluna (com a class data.frame)
class(dados[4])

dados[[4]] #retorna a quarta coluna (com a class "numeric")
class(dados[[4]])

## **E interessante verificar essa diferenca entre colchetes simples e duplos**. 
# Os colchetes simples retornam um "sub-objeto" que possui a mesma classe que o 
# objeto original. Os colchetes duplos retornam um objeto que pode ter uma classe
# diferente -- possivelmente de tipo mais simples. **Essa diferenca sera muito 
# importante futuramente**.

# Elementos de dataframes tambem podem ser selecionados indicando coordenadas de
# linhas e colunas dentro de colchetes simples, tal como fizemos com as matrizes
dados[1,] #retorna a primeira coluna (com a class data.frame)
class(dados[1,])

dados[3,4] #retorna o conteudo da terceira linha, quarta coluna (com a class numeric)
class(dados[3,4])


# Por fim, podemos selecionar as variaveis/colunas de um data.frame usando seus 
# nomes. A funcao **names** exibe o nome das colunas do dataframe:
names(dados)


# E agora podemos usar esses nomes de varias maneiras:
dados["Profissoes"]  # O resultado e um dataframe
class(dados["Profissoes"])  

dados[["Profissoes"]]  # O resultado e um vetor
class(dados[["Profissoes"]])  

dados$Profissoes # O resultado e um vetor
class(dados$Profissoes)


# Podemos combinar essas formas de selecao:
dados[["Idades"]][1]  #Primeiro elemento da variavel idade
dados[["Idades"]][2:4]  # Elementos 2,3 e 4 da variavel idade


# Vamos tentar agora um tipo mais avancado de selecao: **todas os individuos do 
# dataframe cuja idade e superior a 30 anos**. Informamos o criterio de selecao 
# das linhas dentro de colchetes simples, antes de uma virgula (lembrem-se: a 
# virgula e o criterio que separa linhas de colunas; o que esta a esquerda da 
# virgula diz respeito a linhas, o que esta a esquerda refere-se a colunas).
dados[dados$Idades>30,]


# E possivel acrescentar novas informacoes ao banco de dados. Para acrescentar 
# novas linhas, usamos o comando **rbind** (row bind):
rbind(dados,data.frame(Nomes="Fernando",Profissoes="Bancario", Cidades="Belo Horizonte",Idades=28))


# E com o comando **cbind** (column bind), acrescentamos novas colunas
cbind(dados,Time=c("Cruzeiro","Galo Doido","Cruzeiro","Galo Doido"))


############################################
#### Listas

# Podemos pensar que os objetos da classe **list** sao uma extensao do dataframe.
# Dataframes continham colunas que poderiam ser vetores de diversos tipos. Mas 
# todos deveriam ter o mesmo tamanho...

# Listas sao objetos que contem qualquer tipo de outros objetos. O primeiro elemento
# de uma lista pode ser um vetor character de 100 componentes. O segundo objeto 
# pode ser um vetor numeric de 50 elementos. O terceiro elemento pode ser um 
# dataframe inteiro!! E assim por diante... Nao ha nem mesmo o requisito de que 
# os componentes da lista tenham o mesmo numero de observacoes. 

# Listas sao criadas com o comando **list()**. E devemos especificar os seus 
# componentes.
exemplo_lista = list(
  vetor_numerico = c(1,2,3,1,2,3,4,5,3,4,5),
  vetor_textual  = c("Machado de Assis foi um grande escritor brasileiro"),
  banco_de_dados = data.frame(nomes = c("Karina","Joelma","Thiago","Juliano","Janaina"),
                              idades = c(32L,40L,23L,38L,NA),
                              salario = c(2350.99, NA,3700,2010,NA),
                              escolaridade=c("Superior","Medio","Superior","Medio","Medio")
  ),
  matriz = matrix(c(1,2,3,4,5,6),ncol=3,nrow=2)
)
exemplo_lista


# Justamente por essa versatilidade, pelo fato de comportarem simultanemente 
# objetos de diferentes tipo, listas sao muito uteis e frequentemente utilizadas nas mais diversas aplicacoes.
class(exemplo_lista)

# Os componentes de uma lista sao acessados da mesma forma que os componentes de
# um dataframe. 
exemplo_lista[1] # colchetes simples: retorna o "vetor_numerico", que e o primeiro componente da lista. Mas com a classe "list"
class(exemplo_lista[1])

exemplo_lista["vetor_numerico"] # identico ao anterior
class(exemplo_lista["vetor_numerico"])

exemplo_lista[[1]] # com os colchetes duplos, obtemos um objeto com a classe "numeric"
class(exemplo_lista[[1]])

exemplo_lista[["vetor_numerico"]] # identico ao anterior
class(exemplo_lista[["vetor_numerico"]])

exemplo_lista$vetor_numerico # Usando o $ obtemos os mesmos resultados dos colchetes duplos
exemplo_lista$vetor_textual

exemplo_lista$banco_de_dados[2] #podemos fazer selecoes mais precisas
exemplo_lista$banco_de_dados[[2]]
exemplo_lista$banco_de_dados[2,1]

exemplo_lista[[4]]
exemplo_lista[[4]][2,]
exemplo_lista[[4]][2,3]


exemplo_lista$matriz[2,]


#### Subsetting (Revisao e extensao)

# Podemos executar operacoes para extrair informacoes, trechos e subconjuntos de 
# objetos do R. Em linhas gerais, ha 3 tipos basicos de subsetting:

# [ :  colchete simples: retorna um objeto da mesma classe do objeto original. E 
#      pode ser usado para retornar mais de um elemento (ha uma excecao)
# [[ : colchete duplo : usado para extrair elementos de listas ou data.frames. O 
#      tipo de objeto retornado depende da natureza da informacao
# $ :  mesmo uso do [[ (mas com algumas particularidades)

#Exemplos:
x <- c(1,2,3,3,3,4,4,5,6,8)
x[1]
x[2]
x[1:4]

x > 4 # teste logico que retorna um vetor

x[x > 4]
x[x >= 4]
u <- x > "3"
class(u)
u
x[u]
x

x <- x[x > 4]
x

#### Subsetting de uma matriz
x <- matrix(1:6,2,3)
x
x[1,2]
x[2,1]

# Mas nao e sempre necessario especificar os dois indices
x[1,]
x[,2]

x <- matrix(1:8,2,4)
x[1,2] # retorna um vetor
class(x[1,2])

x[1,2,drop=FALSE] #preserva o atributo "dimension", nao o "dropa"
class(x[1,2,drop=FALSE])

x <- matrix(0:7,2,4)
x[1, ] # retorna um vetor
x[1, ,drop=FALSE] #preserva o atributo "dimension", nao o "dropa"


#### Subsetting de listas
x <- list(ID = c(1:5), 
          Peso = c(65,58,70,56,87,90),
          nome = c("Felipe","Hirdan","Augusto","Vera","Edmilson","Carlos")
)
x[1]
x[[1]]
x$ID


class(x[1])
class(x$ID)
class(x[[1]])

x$Peso
x[["Peso"]]
x["Peso"]

# Para selecionar mais de um elemento de uma lista, devemos usar o colchete simples:
x[c(1,3)]

# Podemos tambem atribuir um valor string a um vetor e depois utiliza-lo no subsetting
variavel <- "Peso"
x["Peso"]
x[variavel]


x[[variavel]]
x$variavel # da erro -- DIFERENCA IMPORTANTE ENTRE $ e [[


# Usando dois colchetes, nao selecionamos dois objetos da lista... Na realidade
# estamos fazendo um subsetting "duplo"
x[[c(1,3)]]
x[[1]][[3]] # esses dois comandos sao a mesma coisa


################################################
#### Removendo valores missing

# O comando is.na retorna valores logicos
x <- c(1, 2, NA, 4, NA, 5)
missing = is.na(x)

# E podemos usar esses valores logicos para fazer um subsetting apenas dos 
# valores missing
x[missing]

# Ou entao... apenas dos valores nao-missing
missing
!missing
x[!missing]

x_sem_missing <- x[!missing]
x_sem_missing

# Se tivermos dois ou mais vetores (ou entao um data.frame), podemos usar o 
# comando complete.cases, para selecionar apenas casos que tenham valores 
# nao missing em todas as variaveis simultaneamente
y <- c("a","b",NA,"d",NA,"f")

complete.cases(x,y)

casos_completos <- complete.cases(x,y)
casos_completos

x[casos_completos]
y[casos_completos]


# Um exemplo com um banco de dados
airquality

airquality[1:6, ]

good <- complete.cases(airquality)
airquality[good,]
airquality_completo <- airquality[good,]


bad_ozone <- is.na(airquality$Ozone)
airquality_semNA_ozone <- airquality[!bad_ozone,]
airquality_semNA_ozone


################################################
#### Factors 

# Sao um tipo especial de vetor, usados para guardar informacoes de 
# variaveis categoricas. Podem ser ordenados ou nao ordenados.Sao tratados de forma 
# diferente em modelos como lm() e glm(). A diferenca entre fatores e vetores 
# numericos reside no fato de que os fatores contem "rotulos" (labels) associados 
# aos seus valores:

x <- factor(c("sim","nao","nao","sim","nao"))
# A ordem dos "niveis" dos valores e conferida alfabeticamente
x
class(x)

table(x) # pedindo uma tabela de frequencias 

x <- factor(c("sim","sim","nao","nao","nao","talvez","sim","nao","talvez"))
x

# Atraves do comando **unclass()**, podemos acessar os valores numericos do fator, 
# bem como conhecer seus atributos:
unclass(x) 


#A ordem dos valores pode ser atribuida de forma personalizada, usando o argumento 
x <- factor(c("sim","nao","nao","sim","nao"),
            levels=c("sim","nao")
)
x # agora o valor sim vem primeiro


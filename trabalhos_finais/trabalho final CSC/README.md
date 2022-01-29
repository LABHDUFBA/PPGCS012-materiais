# Trabalho_Final_CSC_Gr-gori

Trabalho final para a disciplina Ciência Social Computacional 2021.2
 
 
Objetivo da análise
 
Com o avanço da economia da atenção bem como do processo de plataformização da sociedade, há o surgimento de uma nova categoria de influenciadores: os gerados por computador. São personagens criados a partir de ferramentas de modelagem computacional e são em sua maioria geridos por empresas de dados e entretenimento. Por serem personagens criados para emular as ações dos influenciadores humanos com o objetivo de captar a atenção e produzir influência nas plataformas digitais, há o uso de métodos de monitoramento de suas ações na rede para aumentar a probabilidade de alcançar o melhor engajamento. O uso de tais métodos se faz necessário uma vez que não há transparência nas plataformas de como os sistemas algorítmicos na rede funcionam, fazendo com que os usuários não tenham controle sobre os resultados das suas ações nesse ecossistema midiático.
 
Diante disso, tal análise tem como objetivo identificar os influenciadores gerados por computador mais relevantes da plataforma Instagram, entendendo relevância como o número de seguidores do perfil, e fazer um mapeamento das performances de engajamento alcançadas dos perfis analisados. Foram extraídos os 19 perfis mais relevantes dessa categoria de influenciadores usando a ferramenta de extração Phantombuster e feito um tratamento prévio no google sheets.
 
 
Descrição do método:
 
- Foi importado o dataframe com a biblioteca pandas e depois feito uma tratamento e renomeação e limpeza de colunas e linhas.
 
- Depois dessa etapa começaram as análises, primeiro efetuando uma contagem dos valores da coluna "categoria comercial" seguido de uma nova contagem e agrupamento de algumas colunas para a criação de um novo dataframe com o intuito de mapear a performance dos perfis.
 
- A partir do dataframe criado, um gráfico foi produzido para visualizar a proporção geral das performances (High performance, Good performance, Bad performance) alcançadas pelos influenciadores contidos no dataframe. O resultado dessa classificação se dá pela diferença entre o engajamento esperado em função do número de seguidores e o engajamento do perfil do influenciador. Essa classificação foi feita previamente com base em relatórios de agências de marketing.
 
- Por último foram filtrados do novo dataframe os valores das performances de cada influenciador e separados em 3 contagens High, Good, Bad performances.
 
 
Descrição do código
 
1 - Importação das bibliotecas pandas e plotly;
2 - Importação do dataframe e a sua visualização;
3 - Renomear as colunas do dataframe;
4 - Exclusão de colunas (inicialmente havia 33 colunas, foram excluídas 15 tendo no final 18 colunas)
5 - Impressão dos valores da coluna "categoria comercial"
6 - Substituição das células vazias da coluna pelo nome "sem categoria"
7 - Impressão da coluna "categoria comercial" atualizada
8 - Contagem dos valores atualizados da coluna "categoria comercial"
9 - Filtragem e agrupamento de colunas para criar um novo dataframe
10 - Criação do novo dataframe (performance) a partir dos valores agrupados e contados
11 - Criação de gráfico mostrando a proporção de performance alcançada pelos influenciadores contidos no dataframe
12 - Filtragem, contagem e exibição dos valores da performances dos influenciadores separados em High, Good e Bad performance





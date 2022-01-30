# Busca por termo utilizando as bases de dados de Ciências Humanas do Scielo e as apresentações de trabalhos no 43º e 44º encontros da Anpocs

O objetivo deste trabalho é criar uma ferramenta que leia as bases de dados Scielo e Anpocs disponibilizadas pelo Repositório Digital das Humanidades - PT-BR (REDHBR) <https://labhdufba.github.io/redhbr/> e filtre os dados de acordo com palavra-chave definida pelo pesquisador.

⚠️Para rodar o script, é necessário baixar os arquivos das raspagens mais recentes no site do REDHBR e salvá-los na mesma pasta onde se encontra o arquivo .py da ferramenta, que está programada para ler os arquivos com seus nomes originais (Scielo: metadata_scielo_2021-05-05_025214 ; Anpocs: resumos_anpocs43 e resumos_anpocs44), portanto não os renomeie!

1. **O script vai MANTER os CSVs com os dados originais e gerar diversos novos CSVs contendo:**
   1. O resultado geral da busca, com seguintes dados:
      1. No caso da base Scielo: filiação dos autores, título do artigo, nome da revista onde foi publicado, data de publicação, resumo, palavras-chave, referências, doi e link para o pdf;
      2. No caso da base Anpocs: título do trabalho apresentado, resumo, sessão onde foi apresentado (GT/ST/SPG), edição do evento onde foi apresentado.
   
   2. Alguns dados estatísticos básicos, que além dos CSVs, também terão gráficos salvos em HTML:
      1. **No caso da base Scielo:** 
         1. Os maiores publishers sobre o tema no período de 1974 a jan/2021 (tempo coberto pelo dataset). O CSV abrange todos, mas o gráfico retrata apenas os dez mais;
         2. As revistas que publicaram artigos sobre o tema nos ultimos 10 anos, mais o quantitativo dessas publicações por revista;
         3. A quantidade de publicações por revista, por ano, sobre o tema, nos ultimos dez anos;
         4. A quantidade de publicações sobre o tema em cada ano desde 1974 (o gráfico abrange os dez últimos anos).
   
      2. **No caso da base Anpocs:**
         1. Todos os GTs, ST e SPG que aceitaram trabalhos sobre o tema e o quantitativo de apresentações por GT, ST e SPG nos eventos cobertos pela base de dados (O CSV abrange todos, mas o gráfico retrata apenas os dez mais);
         2. A quantidade de trabalhos apresentados sobre o tema em cada edição do evento coberta pela base de dados.
   
2. **Como fazer uso da ferramenta:**
   1. Baixe os arquivos das raspagens mais recentes no site do REDHBR e crie uma pasta para salvá-los. Não os renomeie! A ferramenta está programada para ler os arquivos com seus nomes originais (Scielo: metadata_scielo_2021-05-05_025214 ; Anpocs: resumos_anpocs43 e resumos_anpocs44);
   2. Baixe o script da ferramenta e salve na mesma pasta criada para os arquivos do REDHBR. Você vai precisar ter o python instalado em seu computador (a ferramenta foi escrita na versão 3.9.7 do python);
   3. Execute a ferramenta, digite a palavra-chave quando for solicitado e aguarde a conclusão.
⚠️ **Após a realização da busca, lembre-se sempre de renomear os novos CSVs ou retirá-los da pasta, pois caso não o faça, uma nova busca sobrescreverá os dados**

3. **Como o trabalho foi desenvolvido?**
   1. Esta ferramenta foi primeiramente pensada para auxiliar pesquisadores na busca por publicações relacionadas aos temas de seu interesse na base de dados Scielo. Em um segundo momento, pensando na área das Ciências Sociais, da qual faço parte, decidi inserir os dados dos encontros da Anpocs.
   2. O potencial desta ferramenta, que ainda está em sua primeira versão, é de auxiliar no levantamento bibliográfico necessário para o desenvolvimento de pesquisas e gerar dados que possam ajudar o pesquisador a rastrear o interesse sobre o tema ao longo do tempo, bem como os espaços onde pesquisas envolvendo objetos relacionados ao tema costumam ter maior aceitação.
   3. Tendo em vista estes objetivos, seguimos os seguintes passos:
      1. Baixamos os CSVs disponibilizados pelo REDHBR, fruto de raspagens recentes. No caso da base Scielo, o CSV é referente às revistas inseridas na área de Ciências Humanas da plataforma;
      2. Tratamos estes CSVs com pandas e geramos novos CSVs para preservarmos os originais;
      3. Os novos CSVs também receberam tratamentos para limpar diversas questões que poderiam gerar ruídos no output da busca e receberam uma coluna chamada "text", que concatena todos os dados das colunas que podem servir de referência para uma busca por palavra-chave. Especificamente, estas colunas foram as seguintes: 
         1. Para a base Scielo: "article_title", "abstract" e "key_words";
         2. Para a base Anpocs: "titulo" e "resumo".
      Desta forma, o código não precisaria iterar coluna por coluna, fazendo tudo em uma só.
   4. Por fim, criamos funções para automatizar ao máximo a busca, cabendo ao usuário inserir apenas a palavra-chave que lhe interessar e aguardar a criação dos arquivos na pasta.
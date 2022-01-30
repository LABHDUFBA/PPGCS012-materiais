#Função para pegar o caminho de um arquivo no diretório atual
def get_directory_path():
    dir_path = os.path.abspath("")
    return dir_path


#Função para ajudar a criar um novo arquivo CSV usando os.path.join (caminho atual + nome do arquivo)
def create_file(file_name):
    file_path = os.path.join(get_directory_path(), file_name)
    return file_path


#Função para buscar a palavra chave no dataframe Scielo e retornar um novo df contendo o resultado correspondente
def busca_scielo(palavra_chave):
    a1 = scielo_df[scielo_df['text'].str.contains(palavra_chave, case=False)]
    csv_name = create_file('scielo_resultado_busca.csv')
    return a1.to_csv(csv_name, encoding='utf-8', index=True)


#Função para buscar a palavra chave no dataframe Anpocs e retornar um novo df contendo o resultado correspondente
def busca_anpocs(palavra_chave):
    a2 = anpocs_concat_df[anpocs_concat_df['text'].str.contains(palavra_chave, case=False)]
    csv_name2 = create_file('anpocs_resultado_busca.csv')
    return a2.to_csv(csv_name2, encoding='utf-8', index=True)


#Função para organizar os dados sobre os journals que mais publicaram sobre o tema nos últimos 10 anos, 
#plotando cada um dos gráficos e deixando cópia salva no formato HTML
#Aplica-se ao df Scielo
def publishers(scielo_pub):
#Retorna os maiores publishers sobre o tema no período de 1974 a jan/2021 (tempo coberto pelo dataset) + CSV + gráfico em HTML com os 10 maiores
    df_scielo_pub = scielo_pub.groupby('journal_title').size().sort_values(ascending=False)\
        .reset_index(name='publicacoes_totais')\
        .rename(columns={'index': 'publicacoes_totais'})\
        .sort_values(by='publicacoes_totais', ascending=False)
#Cria um CSV contendo os dados completos (o gráfico só retorna os 10 maiores)
    csv_name3 = create_file('df_scielo_publishers_completo.csv')
    df_scielo_pub.to_csv(csv_name3, encoding='utf-8', index=True)
#Cria um gráfico retornando os 10 maiores publishers ao longo do tempo e seu arquivo de salvamento em HTML
    fig_name = create_file('grafico_scielo_dez_maiores_publishers.html')
    fig_maiores_publishers_dez_anos1 = px.bar(df_scielo_pub.head(10)\
        .sort_values(by='publicacoes_totais'), 
        x='publicacoes_totais', y='journal_title', text='publicacoes_totais', 
        title='Os 10 maiores publishers sobre o tema (1974-2021)', height=800, width=1600)\
        .update_layout(xaxis_title='Total de Publicações', yaxis_title='Nome da revista')\
        .write_html(fig_name)
#Serve de base para organizar as próximas variáveis
    df_scielo_pub2 = scielo_pub.sort_values('pub_date', ascending=False, ignore_index=True)
    df_scielo_pub2 = df_scielo_pub2[['journal_title', 'pub_date']]
    df_scielo_pub2 = df_scielo_pub2.loc[(df_scielo_pub2['pub_date'] > 2010)]
#Retorna as revistas que publicaram artigos sobre o tema nos ultimos 10 anos + quantitativo dessas publicações por revista + CSV + gráfico em HTML
    df_scielo_pub3 = df_scielo_pub2['journal_title'].value_counts(ascending=False)\
        .reset_index(name='publicacoes_10_anos').rename(columns={'index': 'journal_title'})
#Cria o CSV
    csv_name4 = create_file('df_scielo_maiores_publishers_10_anos.csv')
    df_scielo_pub3.to_csv(csv_name4, encoding='utf-8', index=True)
#Cria o gráfico para visualização e salvamento em HTML
    fig_name2 = create_file('grafico_scielo_maiores_publishers_10_anos.html')
    fig_maiores_publishers_dez_anos2 = px.bar(df_scielo_pub3.sort_values(by='publicacoes_10_anos'), 
        x='publicacoes_10_anos', y='journal_title', text='publicacoes_10_anos', 
        title='As revistas que mais publicaram sobre o tema nos últimos 10 anos', height=1000, width=1600)\
        .update_layout(xaxis_title='Total de Publicações em 10 anos', yaxis_title='Nome da revista')\
        .write_html(fig_name2)
#Retorna a quantidade de publicações por revista, por ano, sobre o tema, nos ultimos 10 anos em um novo CSV
    df_scielo_pub4 = df_scielo_pub2.filter(items=['journal_title','pub_date']).groupby(['journal_title', 'pub_date']).size()\
        .reset_index(name='publicacoes_por_ano').rename(columns={'index': 'publicacoes_por_ano'})\
        .sort_values(by='pub_date', ascending=False, ignore_index=True)
#Cria o CSV
    csv_name5 = create_file('publicacoes_por_ano_por_revista_10_anos_scielo.csv')
    df_scielo_pub4.to_csv(csv_name5, sep=',', encoding='utf-8', index=False)
#Retorna tudo para que possa ser chamado depois
    return df_scielo_pub, df_scielo_pub3, df_scielo_pub4


#Função para organizar os dados da quantidade de publicações sobre o tema nos últimos 10 anos, criando um CSV, plotando os gráficos e deixando cópias salvas no formato HTML.
#Aplica-se ao df Scielo
def publicacoes_dez_anos(scielo_tempo):
    df_scielo_tempo = scielo_tempo.groupby('pub_date').size().sort_values(ascending=False)\
        .reset_index(name='publicacoes_totais')\
        .sort_values(by='pub_date', ascending=False, ignore_index=True)
    #Retorna um CSV com a quantidade de publicações sobre o tema em cada ano desde 1974 (o gráfico só retorna os 10 últimos anos)
    csv_name6 = create_file('df_scielo_total_publicacoes_sobre_o_tema_por_ano.csv')
    df_scielo_tempo.to_csv(csv_name6, encoding='utf-8', index=True)
    #Cria e Salva o gráfico em HTML
    fig_name3 = create_file('grafico_scielo_line.html')
    fig_publicacoes_dez_anos = px.line(df_scielo_tempo.head(10), x='pub_date', y='publicacoes_totais', title='Publicações por ano', height=600, width=1000)\
        .update_layout(xaxis_title='Ano', yaxis_title='Quantidade de Publicações')\
        .write_html(fig_name3) 
    return df_scielo_tempo


#Função para organizar os dados sobre a quantidade de trabalhos apresentados sobre o tema nos eventos da Anpocs (43 e 44) e gerar gráficos em HTML
#Aplica-se ao df Anpocs_concat
def trabalhos_por_sessao_id_evento (anpocs_data):
#Retorna todos os GTs, ST e SPG que aceitaram trabalhos sobre o tema e o quantitativo de publicações por GT, ST e SPG
    df_anpocs_data = anpocs_data.groupby('sessao').size().sort_values(ascending=False)\
        .reset_index(name='trabalhos_totais_por_sessao')\
        .sort_values(by='trabalhos_totais_por_sessao', ascending=False, ignore_index=True)
#Cria o CSV
    csv_name7 = create_file('df_anpocs_trabalhos_totais_sobre_o_tema_por_sessao.csv')
    df_anpocs_data.to_csv(csv_name7, encoding='utf-8', index=True)
#Retorna o gráfico com os 10 que mais aceitaram trabalhos sobre o tema e o quantitativo de cada um
    fig_name4 = create_file('grafico_anpocs_trabalhos_totais_por_sessao.html')
    fig_trabalhos_por_sessao = px.bar(df_anpocs_data.head(10).sort_values(by='trabalhos_totais_por_sessao'), 
        x='trabalhos_totais_por_sessao', y='sessao', text='trabalhos_totais_por_sessao', 
        title='Os 10 GT/ST/SPG que mais aceitaram artigos sobre o tema (Anpocs 43 e 44)', height=800, width=1600)\
        .update_layout(xaxis_title='Total de trabalhos apresentados', yaxis_title='Nome do GT/ST/SPG')\
        .write_html(fig_name4)
#Retorna a quantidade de trabalhos apresentados sobre o tema em cada edição do evento (Anpocs 43 e 44)
    df_anpocs_data2 = anpocs_data.groupby('id_evento').size().sort_values(ascending=False)\
        .reset_index(name='trabalhos_totais_sobre_o_tema_por_evento')\
        .sort_values(by='trabalhos_totais_sobre_o_tema_por_evento', ascending=False, ignore_index=True)
#Cria o CSV
    csv_name8 = create_file('df_anpocs_trabalhos_totais_sobre_o_tema_por_evento.csv')
    df_anpocs_data2.to_csv(csv_name8, encoding='utf-8', index=True)
#Retorna o gráfico em html com a quantidade de trabalhos apresentados sobre o tema em cada edição do evento (Anpocs 43 e 44)
    fig_name5 = create_file('grafico_anpocs_trabalhos_totais_sobre_o_tema_por_evento.html')
    fig_trabalhos_por_evento = px.bar(df_anpocs_data2.sort_values(by='id_evento'), 
        x='id_evento', y='trabalhos_totais_sobre_o_tema_por_evento', 
        text='trabalhos_totais_sobre_o_tema_por_evento', title='Quantidade de publicações sobre o tema por evento (Anpocs 43 e 44)', height=800, width=1600)\
        .update_layout(xaxis_title='Edição do evento', yaxis_title='Total de trabalhos apresentados sobre o tema por evento')\
        .update_xaxes(tickvals=[43, 44])\
        .write_html(fig_name5)
    return df_anpocs_data, df_anpocs_data2


#Importa o pandas como pd
import pandas as pd
#Importa o plotly express como px e o graph_objects como go 
import plotly.express as px
import plotly.graph_objects as go
#Importa o os.path para poder manejar os diretórios em qualquer SO
import os.path

#Cria as variáveis para cada um dos CSVs que serão filtrados
scielo_df = pd.read_csv(create_file('metadata_scielo_2021-05-05_025214.csv'), sep=',', index_col=0)
anpocs43_df = pd.read_csv(create_file('resumos_anpocs43.csv'), sep=',', index_col=None)
anpocs44_df = pd.read_csv(create_file('resumos_anpocs44.csv'), sep=',', index_col=None)
#Cria um novo df contendo apenas as colunas que nos interessam, preservando os originais
scielo_df2 = scielo_df[['authors affiliation', 'article_title', 'journal_title', 'pub_date', 'abstract', 'key_words', 'refs', 'doi', 'link pdf']]
anpocs43_df2 = anpocs43_df[['titulo', 'resumo', 'sessao', 'id_evento']]
anpocs44_df2 = anpocs44_df[['titulo', 'resumo', 'sessao', 'id_evento']]
#Cria um novo df contendo apenas as colunas que interessam da base de dados scielo original
scielo_df2.to_csv(create_file('df_2_metadata_scielo_2021-05-05_025214.csv'), encoding='utf-8', index=True)
#Como mantivemos a coluna "id_evento" nos df Anpocs, vamos concatenar os dois, assim trabalharemos com menos dataframes únicos
anpocs_concat_df = pd.concat([anpocs43_df2, anpocs44_df2], axis=0)
#Criamos um novo df com o objeto dataframe dos df Anpocs concatenados
anpocs_concat_df.to_csv(create_file('df_anpocs_concat.csv'), encoding='utf-8', index=None)
#Retorna as variaveis objeto dataframe agora contendo os novos df
scielo_df = pd.read_csv(create_file('df_2_metadata_scielo_2021-05-05_025214.csv'), sep=',', index_col=0)
anpocs_concat_df = pd.read_csv(create_file('df_anpocs_concat.csv'), sep=',', index_col=None)
#Padronizamos os nomes das colunas "authors affiliation e "link pdf" do df Scielo, pois estavam fora do padrão das outras colunas com nomes compostos
scielo_df.rename(columns={'authors affiliation': 'authors_affiliation', 'link pdf': 'link_pdf'}, inplace=True)
#Modificamos os valores NA para strings que não atrapalhe nossa análise dos dados. Simplesmente dropar as linhas poderia comprometer o resultado da busca
scielo_df['authors_affiliation'].fillna('NO_INFO_AUTHORS_AFFILIATION', inplace=True)
scielo_df['key_words'].fillna('NO_INFO_KEY_WORDS', inplace=True)
anpocs_concat_df['resumo'].fillna('NO_INFO_ABSTRACT', inplace=True)
#Limpamos as vírgulas no início da coluna "authors_affiliation" do df Scielo
scielo_df['authors_affiliation'].replace({',': ''}, regex=True, inplace=True)
#Criamos uma coluna "text" em cada um dos df. Esta coluna será o centro da nossa busca por palavra-chave
# e conterá os conteúdos das colunas que nos interessam para isso.
scielo_df['text'] = scielo_df['article_title'] + ' | ' + scielo_df['abstract'] + ' | ' + scielo_df['key_words']
anpocs_concat_df['text'] = anpocs_concat_df['titulo'] + ' | ' + anpocs_concat_df['resumo']
#Dropamos três linhas do df Scielo porque estão completamente preenchidas com "None"
scielo_df.drop([399, 1014, 1880], axis=0, inplace=True)
#Tratamos a coluna "pub_date" do df Scielo, pois seus valores estavam em formato de string e com ano/mês. 
# Para nosso tratamento, queremos apenas o ano e em formato de numero inteiro
scielo_df['pub_date'] = scielo_df['pub_date'].str[0:4].astype(int)
#Criamos um input para que seja inserida a palavra a ser buscada.
#Apesar de a função que busca a palavra não ser case sensitive, decidimos colocar o input em caixa baixa para evitar possíveis problemas
palavra = str(input('Digite a palavra a ser buscada: ')).lower()
#Criamos a variável que vai atribuir a palavra do input às funções de busca
busca = busca_scielo(palavra), busca_anpocs(palavra)
#Criamos as variáveis objeto dataframe para abrir os CSV criados e testar se deu certo
a1 = pd.read_csv(create_file('scielo_resultado_busca.csv'), sep=',', index_col=0)
a2 = pd.read_csv(create_file('anpocs_resultado_busca.csv'), sep=',', index_col=0)
#Dropamos a coluna "text" dos novos CSV porque não serão mais úteis e podem poluir os dados
a1.drop('text', axis=1, inplace=True)
a2.drop('text', axis=1, inplace=True)
#Criamos as variáveis que vão chamar os CSV resultado das buscas e aplicá-los nas respectivas funções de extração de dados quantitativos básicos
publishers_scielo = publishers(a1)
total_publicacoes_ano_scielo = publicacoes_dez_anos(a1)
publicacoes_anpocs = trabalhos_por_sessao_id_evento(a2)
print(f'A busca pelo termo {palavra} foi concluida com sucesso! Os arquivos estão na mesma pasta do script.')
print('Por favor, caso queira manter os arquivos retornados, renomeie ou retire-os da pasta pois em caso de uma nova busca eles serão sobrescritos')
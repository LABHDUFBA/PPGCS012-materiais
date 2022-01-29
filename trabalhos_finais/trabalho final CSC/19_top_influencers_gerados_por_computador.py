
#1 importar  as bibliotecas

import pandas as pd
import plotly.express as px 


#2 Abrir o csv e imprimir

influencers_cgi_df = pd.read_csv('C:\\Users\\Gregs\\Desktop\\trabalho final CSC\\top_19_Influenciadores_gerados_por_computador.csv', engine='python')

influencers_cgi_df

influencers_cgi_df.head()
print(influencers_cgi_df.head())


# Infos do df

influencers_cgi_df.info()


#3 Renomear colunas

influencers_cgi_df.columns= ['link_perfil', 'número_identificação_perfil', 'nome_perfil',\
    'foto_perfil', 'nome_completo_perfil', 'verificação_perfil', 'informações_da_bio',\
         'etnia', 'gênero', 'número_palavras_bio', 'perfis_mencionados', 'emojis_usados_bio',\
             'número_emojis', 'número_seguidores', 'número_perfis_seguidos', 'número_de_publicações',\
                 'proporção_entre_seguidores_seguidos', 'qualidade_proporção_entre_seguidores_seguidos',\
                     'engajamento', 'engajamento_esperado_categoria_influencer', 'razão_engajamento_categoria_influencer',\
                         'categoria_perfil', 'performance_perfil', 'tipo_de_conta', 'categoria_comercial',\
                             'tempo_de_uso_perfil', 'perfil_público_privado_info', 'imagem_perfil_png',\
                                 'link_imagem_perfil', 'link_externos_bio', 'link_perfil_instagram', 'timestamp',\
                                     'link_email_vinculado']

influencers_cgi_df.columns
print(influencers_cgi_df.columns)


# csv com nomes atualizados

influencers_cgi_df

influencers_cgi_df.head()
print(influencers_cgi_df.head())


#4 Excluir colunas 

influencers_cgi_df.drop(['link_perfil', 'número_identificação_perfil', 'foto_perfil', 'etnia', 'gênero',\
    'perfis_mencionados', 'proporção_entre_seguidores_seguidos', 'qualidade_proporção_entre_seguidores_seguidos',\
        'tempo_de_uso_perfil', 'perfil_público_privado_info', 'imagem_perfil_png', 'link_imagem_perfil',\
            'timestamp', 'link_email_vinculado'], axis=1, inplace=True)

print(influencers_cgi_df.columns)


# Infos atualizadas do df (antes havia 33 colunas e agora apenas 18 colunas)

influencers_cgi_df.info()


#6 Imprimir uma coluna categoria_comercial

print(influencers_cgi_df['categoria_comercial'])

#7 Imprimir uma coluna categoria_comercial com substituição das celulas vazias por sem "categoria"

influencers_cgi_df['categoria_comercial'].fillna('Sem categoria', inplace=True)
print(influencers_cgi_df['categoria_comercial'])


#8 Contar valores da coluna categoria_comercial

influencers_cgi_df['categoria_comercial'].value_counts()
print(influencers_cgi_df['categoria_comercial'].value_counts())


#9 filtrar um dataframe com algumas colunas, agrupar e contar 

influencers_cgi_df.filter(items=['nome_perfil', 'engajamento', 'engajamento_esperado_categoria_influencer', 'performance_perfil'])\
    .groupby(['nome_perfil', 'engajamento', 'engajamento_esperado_categoria_influencer', 'performance_perfil'])\
        .size()

performance = influencers_cgi_df.filter(items=['nome_perfil', 'engajamento', 'engajamento_esperado_categoria_influencer', 'performance_perfil'])\
    .groupby(['nome_perfil', 'engajamento', 'engajamento_esperado_categoria_influencer', 'performance_perfil'])\
        .size()


performance
print(performance)



#10 criar um novo dataframe da serie acima

performance = influencers_cgi_df.filter(items=['nome_perfil', 'engajamento', 'engajamento_esperado_categoria_influencer', 'performance_perfil'])\
    .groupby(['nome_perfil', 'engajamento', 'engajamento_esperado_categoria_influencer', 'performance_perfil'])\
        .size()\
            .reset_index(name= 'index')\
                .sort_values(by='engajamento', ascending=False) 
performance.drop('index', axis=1, inplace=True)

print(performance)


# Salvar o dataframe performance

performance.to_csv("performance.csv", encoding='utf-8', index=False)



#11 Gráfico mostrando a proporção de perfomance alcançada pelos influenciadores contidos no df


proporção_performance = performance['performance_perfil'].value_counts()
print(proporção_performance)


proporção_performance = proporção_performance\
    .reset_index(name='quantidade')\
        .rename(columns={'index':'qualidade_performance'})\
            .sort_values(by='quantidade')
proporção_performance
print(proporção_performance)


fig = px.bar(proporção_performance, 
   x='qualidade_performance',  
   y='quantidade')

fig.show()
fig.write_html('proporção_performance.html')



#12 Valores filtrados na coluna performance_perfil contendo High Performance, Good Performance, Bad Performance

high_performance = performance[performance['performance_perfil'].str.contains('High Performance')]
good_performance = performance[performance['performance_perfil'].str.contains('Good Performance')]
bad_performance = performance[performance['performance_perfil'].str.contains('Bad Performance')]


# Contar os valores da filtragem

high_performance.shape
print(high_performance.shape)

good_performance.shape
print(good_performance.shape)

bad_performance.shape
print(bad_performance.shape)



# exibir a contagem com os valores High, Good, Bad filtrados

high_performance.head()
print(high_performance.head())

good_performance.head()
print(good_performance.head())

bad_performance.head()
print(bad_performance.head())






































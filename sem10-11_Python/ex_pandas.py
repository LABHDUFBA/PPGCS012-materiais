# Pandas - Básico I
# Semana 10, Curso PPGCS012
# Importar e manipular os dados do dataset dos resumos da Anpuh com Pandas
import pandas as pd

df = pd.read_csv('CSVs/resumos_anpuh_2013-2021.csv', encoding='utf-8', index_col=0)

print(df.head())
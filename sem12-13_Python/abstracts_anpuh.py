import spacy
from spacy import displacy
from collections import Counter
import pandas as pd

# load model
nlp = spacy.load('pt_core_news_sm')
corpus_pt = open('abstract.txt', 'r').read()

chunked_text_pt = corpus_pt.split('paper_abstract')
print(len(chunked_text_pt))

chunked_documents_pt = list(nlp.pipe(chunked_text_pt))

people = []
for document in chunked_documents_pt:
    for named_entity in document.ents:
        if named_entity.label_ == "PER":
            people.append(named_entity.text)

people_tally = Counter(people)

df_people = pd.DataFrame(people_tally.most_common(), columns=['sujeito', 'contagem'])
print(df_people)
# save to csv
df_people.to_csv('abstracts_sujeitos.csv', index=False)

# get places
places = []
for document in chunked_documents_pt:
    for named_entity in document.ents:
        if named_entity.label_ == 'LOC':
            places.append(named_entity.text)

places_tally = Counter(places)

df_places = pd.DataFrame(places_tally.most_common(), columns=['lugar', 'contagem'])
print(df_places)
# save to csv
df_places.to_csv('abstracts_lugares.csv', index=False)

# get verbs
verbs = []
for document in chunked_documents_pt:
    for token in document:
        if token.pos_ == 'VERB':
            verbs.append(token.lemma_)

verbs_tally = Counter(verbs)

df_verbs = pd.DataFrame(verbs_tally.most_common(), columns=['verbo', 'contagem'])
print(df_verbs)
# save to csv
df_verbs.to_csv('abstracts_verbos.csv', index=False)

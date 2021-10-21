# Quantos humanos existem de cada gênero?

starwars_tbl %>% 
  filter(especie == "Humano") %>%
  group_by(genero) %>%
  count()

## resposta: 35 humanos no total: 9 femininos, 26 masculinos.

# Quantos indivíduos tem como gênero NA?

starwars_tbl %>% 
  group_by(genero) %>%
  count()


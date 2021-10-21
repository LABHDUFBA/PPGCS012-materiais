# Quantos humanos existem de cada gênero?

starwars_tbl %>% 
  filter(especie == "Humano") %>%
  group_by(genero) %>%
  count()

## resposta: 35 humanos no total: 9 femininos, 26 masculinos.

# Quantos indivíduos não são nem homens nem mulheres?

starwars_tbl %>% 
  group_by(genero) %>%
  count()

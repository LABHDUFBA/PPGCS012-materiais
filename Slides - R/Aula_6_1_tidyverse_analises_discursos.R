
df <- read.csv("./Slides - R/dados/discursos.csv", encoding = "UTF-8")


df %>% filter(categoria_discursante == "Senador/a") %>% 
  group_by(nome_discursante) %>% 
  count() %>% 
  ungroup() %>% 
  arrange(n) %>% 
  mutate(nome_discursante = as.factor(fct_reorder(nome_discursante, -n))) %>% 
  ggplot(aes(x=n, y= nome_discursante, fill=nome_discursante))+
  geom_col(show.legend = F) +
  xlab("")+
  ylab("")

df %>% 
  filter(sigla_partido != "Sem partido/Não se aplica") %>% 
  group_by(sigla_partido) %>% 
  count() %>% 
  ungroup() %>% 
  arrange(n) %>% 
  mutate(sigla_partido = as.factor(fct_reorder(sigla_partido, -n))) %>% 
  ggplot(aes(x=n, y= sigla_partido, fill=sigla_partido))+
  geom_col(show.legend = F) +
  xlab("")+
  ylab("")


df %>% 
  filter(sigla_partido != "Sem partido/Não se aplica") %>% 
  filter(sigla_partido != "Sem partido/Não se aplica") %>% 
  

df %>%
  filter(categoria_discursante == "Senador/a") %>%
  filter(sigla_partido != "Sem partido/Não se aplica") %>%
  filter(sigla_partido == "PT") %>%
  group_by(nome_discursante) %>%
  count() %>%
  ungroup() %>%
  arrange(n) %>%
  mutate(nome_discursante = as.factor(fct_reorder(nome_discursante, -n))) %>%
  ggplot(aes(x=n, y= nome_discursante, fill=nome_discursante))+
  geom_col(show.legend = F) +
  xlab("")+
  ylab("")
  


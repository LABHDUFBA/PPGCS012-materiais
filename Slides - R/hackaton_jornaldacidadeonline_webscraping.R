rm(list = ls())
library(rvest)
library(tidyverse)

# Scraping data

urlbase <- "https://www.jornaldacidadeonline.com.br/noticias/"
df <- data.frame()


for (i in 52:34858){
    url <- paste0(urlbase, i, "")
    tryCatch({
      url_html <- rvest::read_html(url)
      print(url)
      # titulo
      titulo <- url_html %>% 
        html_element(css = "div.post__header > h1") %>%
        html_text()
      # data-hora
      data_hora <- url_html %>% 
        html_element(css = "div.post__header > small") %>%
        html_text()
      # texto
      texto <- url_html %>% 
        html_element(css = "div.post__description") %>%
        html_text()
      df <- rbind(df, cbind(titulo, data_hora, texto, url))
      }
      , error = function(e){NA})
}

# sanitize 

df$data <- substr(df$data_hora, 1, 10)
df$hora <- substr(df$data_hora, 15, 19)
df$data <- lubridate::dmy(df$data)

# saving

write.csv(df, "I:\\Dropbox\\Proposta Internetlab\\internetlab\\csv_intermediarios\\jco.csv", fileEncoding = "UTF-8")
saveRDS(df, file = "I:\\Dropbox\\Proposta Internetlab\\internetlab\\csv_intermediarios\\jco.rds")       

# Analyzing

p1 <- df %>% 
  ggplot(aes(x = lubridate::floor_date(data, "month"))) + 
  geom_bar() +
  ggthemes::theme_economist()+
  xlab("")+
  ylab("")+
  labs(title = "Postagens do Jornal da Cidade Online")+
  theme(plot.title = element_text(hjust = 0.5))
p1


# Scrapper da revista Katálysis

[Página oficial](https://periodicos.ufsc.br/index.php/katalysis/issue/archive)
                               
Este projeto teve como objetivo extrair as publicações da revista de Serviço Social, Katálysis. Para isso, tornou-se necessário percorrer diferentes páginas do site, adicionando
novas camadas de complexidade: Edições > "Espaço Temático" > Publicação. Percorrendo cada página da revista.
O projeto entregue conseguiu percorrer a primeira página das Edições e do espaço temático buscando informações como o nome, a url e a série, em seguida, data da publicação e uma
lista com as publicações. Ao final, exibe em json as informações coletadas.

## Pontos de melhorias:
  
- Bugs na exibição dos nomes por conta da formatação;
- Bug na coleta dos títulos das públicações. Filtragem de títulos que não deveriam estar inclusos.    
- Permitir coleta da paginação dos dados (edições e publicações)
- Finalizar a coleta de mais dados relacionados às publicações

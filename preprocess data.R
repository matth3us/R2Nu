library(tidyverse)
library(stringr)
library(lubridate)
atual <- read_csv('data_2018_11_03.csv') %>% 
          mutate(
            categoria = as.factor(categoria), 
            payee = as.factor(payee),
            dia = dmy(paste(dia, " 2018")),
            valor = str_extract(valor, "[\\d,]+"),
            valor = as.double(str_replace(valor, ',', '.')),
            valor = ifelse(categoria == 'Pagamento recebido', valor, -valor)
          )

#3 de novembro: selecionar apenas os dados a partir de 3 de outubro
atual <- atual %>% 
          filter(
            dia > '2018-10-02'
          )

write_csv(atual, 'data_clean_2018_11_03.csv')

# no futuro, por código no js e no R para escrever data de rodagem dos scripts nos próprios arquivos de resultado
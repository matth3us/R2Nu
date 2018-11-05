library(tidyverse)
library(stringr)
library(lubridate)
atual <- read_csv(file.choose()) %>% 
  mutate(
    categoria = as.factor(categoria), 
    payee = as.factor(payee),
    Payee = payee,
    dia   = dmy(paste(dia, " 2018")),
    Date = dia,
    valor = str_extract(valor, "[\\d,]+"),
    valor = as.double(str_replace(valor, ',', '.')),
    valor = ifelse(categoria == 'Pagamento recebido', valor, -valor)
    tipo  = ifelse(categoria == 'Pagamento recebido', 'Inflow', 'Outflow'),
    Memo = tag
    ) %>%
  select(-one_of(c('tag', 'dia', 'payee'))) %>% 
  spread(key = tipo, value = valor, fill = 0) %>% 
  select(Date, Payee, Memo, Outflow, Inflow)

#3 de novembro: selecionar apenas os dados a partir de 3 de outubro
atual <- atual %>% 
  filter(
    dia > '2018-10-02'
  )

write_csv(atual, 'data_clean_2018_11_03.csv')

# no futuro, por código no js e no R para escrever data de rodagem dos scripts nos próprios arquivos de resultado

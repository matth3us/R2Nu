library(tidyverse)
library(stringr)
library(lubridate)
library(jsonlite)

atual <- fromJSON(file.choose())
atual <- atual %>% 
  mutate(
    categoria = as.factor(categoria), 
    payee = as.factor(payee),
    Payee = payee,
    dia  = dmy(paste(dia, " 2018")),
    Date = dia,
    valor = str_extract(valor, "[\\d,]+"),
    valor = as.double(str_replace(valor, ',', '.')),
    Inflow = ifelse(categoria == 'Pagamento recebido', valor, 0),
    Outflow = ifelse(categoria == 'Pagamento recebido', 0, valor),
    Memo = tag
  )  %>% 
  select(id, Date, Payee, Memo, Outflow, Inflow)

saveRDS(atual, file = paste("nubank_",ymd(today()),".RDS",  sep = ""))


library(tidyverse)

atual <- readRDS('./data_rds/nubank_2018-11-16.RDS') %>%  select(-id)
#Juntar diversos arquivos RDS
#Identificar CSV mais novo
#Usar CSV mais novo para identificar apenas as transa??es novas
#Gerar arquivo CSV com formato apropriado para o YNAB [Date, Payee, Memo, Outflow, Inflow)]
#Escrever CSV com data no nome



write_csv(atual, paste("ynab_",ymd(today()),".csv",  sep = ""))
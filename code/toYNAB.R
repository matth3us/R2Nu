library(tidyverse)
#3 de novembro: selecionar apenas os dados a partir de 3 de outubro

#Juntar diversos arquivos RDS
#Identificar CSV mais novo
#Usar CSV mais novo para identificar apenas as transa??es novas
#Gerar arquivo CSV com formato apropriado para o YNAB [Date, Payee, Memo, Outflow, Inflow)]
#Escrever CSV com data no nome



write_csv(atual, paste("ynab_",ymd(today()),".csv",  sep = ""))
library(tidyverse)
library(stringr)
library(lubridate)
library(jsonlite)

readAllCsv = function(caminho){
  arquivos = list.files(path = caminho, full.names = TRUE)
  datalist = lapply(filenames, 
                    function(x){read_csv(file = x,
                                         header = TRUE,
                                         stringsAsFactors = FALSE)})
  Reduce(function(x,y) {merge(x, y, all = TRUE)}, datalist)
}

readAllRds = function(caminho){
  arquivos = list.files(path = caminho, full.names = TRUE)
  datalist = lapply(filenames, function(x){readRDS(file = x)})
  Reduce(function(x,y) {merge(x, y, all = TRUE)}, datalist)
}

# Transformação de dados JSON em dados RDS
atual <- fromJSON(file.choose())
atual <- atual %>% 
  mutate(
    categoria = as.factor(categoria), 
    Payee = payee,
    Payee = ifelse(categoria == 'Pagamento recebido', 'Pagamento recebido', payee),
    payee = as.factor(payee),
    dia  = dmy(paste(dia, " 2018")),
    Date = dia,
    valor = str_extract(valor, "[\\d,]+"),
    valor = as.double(str_replace(valor, ',', '.')),
    Inflow = ifelse(categoria == 'Pagamento recebido', valor, 0),
    Outflow = ifelse(categoria == 'Pagamento recebido', 0, valor),
    Memo = tag
  )  %>% 
  select(id, Date, Payee, Memo, Outflow, Inflow)

saveRDS(atual, file = paste("./data_rds/nubank_",ymd(today()),".RDS",  sep = ""))

# Atualização de dados
rdsAtual <- readAllRds('./data_rds/')
csvAtual <- readAllCsv('./data_csv/')
newdata  <- dplyr::setdiff(rdsAtual, csvAtual) #e se for vazio?
newcsv   <- newdata %>% select(-id)
write_csv(newcsv, paste("./data_csv/csv_",ymd(today()),".csv",  sep = ""))
write_csv(newdata, paste("./data_ynab/ynab_",ymd(today()),".csv",  sep = ""))

# TODO: funcionando, buscar deletar arquivos e dados supérfluos



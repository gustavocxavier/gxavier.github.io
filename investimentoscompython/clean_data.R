library(readxl)
library(dplyr)
library(tidyr)

ds <- read_excel("data_index.xlsx", na = "-", skip = 3)

ds <- ds %>% 
  pivot_longer(LC_2016:ROE_2020, names_to = "Nome_indice", values_to = "Valor_indice") %>% 
  select(Codigo, Empresa=Nome, Nome_indice, Valor_indice, everything()) %>% 
  select(-N, -Tipo, -Bolsa, -Status) %>% 
  mutate(Nome_indice = substr(Nome_indice,1,nchar(Nome_indice)-5))

write.csv(ds, "indice_ultimos5anos.csv", row.names = FALSE)

### CORRELAÇÃO

correlacao = cor(dados_iris[,1:4]) 
  
## CORRELOGRAMA
library(GGally)
# 1
ggcorr(dados_peixe1, label = TRUE) 

# HEATMAP
heatmap()

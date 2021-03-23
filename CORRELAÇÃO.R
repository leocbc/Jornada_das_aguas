### CORRELAÇÃO


## CORRELOGRAMA
library(GGally)
# 1
ggcorr(dados) 

# 2
ggpairs(dados, ggplot2::aes(colour=sex)) 

# HEATMAP

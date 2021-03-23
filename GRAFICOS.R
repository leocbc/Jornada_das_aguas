
library(ggplot2)
library(latticeExtra) 
library(tidyverse)

### grafico geral - densidade populacional - exemplo
a <- data.frame( x=rnorm(20000, 10, 1.9), y=rnorm(20000, 10, 1.2) )
b <- data.frame( x=rnorm(20000, 14.5, 1.9), y=rnorm(20000, 14.5, 1.9) )
c <- data.frame( x=rnorm(20000, 9.5, 1.9), y=rnorm(20000, 15.5, 1.9) )
data <- rbind(a,b,c)

ggplot(data, aes(x=x, y=y) ) +
  geom_hex(bins = 30) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()

## aplicando aos nossos dados:
## dados peixes2

# Em relaçao ao comprimento corporal

## dados tartaruga:
levelplot(length ~ width * height, dados, 
          panel = panel.levelplot.points, cex = 1.2
) + layer_(panel.2dsmoother(..., n = 200))

### Em relação ao sexo
dados$sexo = ifelse(dados$sex=="f",1,0)
levelplot(sexo ~ width * height, dados, 
          panel = panel.levelplot.points, cex = 1.2
) + layer_(panel.2dsmoother(..., n = 200))






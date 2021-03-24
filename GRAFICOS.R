library(latticeExtra) 
## dados tartaruga:

str(dados_tartaruga)

### Em relação ao sexo
dados_tartaruga$sexo = ifelse(dados_tartaruga$sex=="f",1,0)

levelplot(sexo ~ width * height, dados_tartaruga, 
          panel = panel.levelplot.points, cex = 1.2
) + layer_(panel.2dsmoother(..., n = 200))


library(ggplot2)
library(tidyverse)

### grafico geral - densidade populacional - exemplo
# Criando/simulando um arquivo de dados
a <- data.frame( x=rnorm(20000, 10, 1.9), y=rnorm(20000, 10, 1.2) )
b <- data.frame( x=rnorm(20000, 14.5, 1.9), y=rnorm(20000, 14.5, 1.9) )
c <- data.frame( x=rnorm(20000, 9.5, 1.9), y=rnorm(20000, 15.5, 1.9) )
data <- rbind(a,b,c)

str(data)
# str(dados_peixe2)


ggplot(data, aes(x=x, y=y) ) +
  geom_hex(bins = 30) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()

## aplicando aos nossos dados:
## dados peixes2
str(dados_peixe2)

ggplot(dados_peixe2, aes(x=Mouth_width, y=Mouth_length) ) +
  geom_hex(bins = 30) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()


### Boxplot
install.packages("ggpubr")
library(ggpubr)
p <- ggboxplot(iris, x = "Sepal.Length", y = "Sepal.Width",
               color = "Species", palette =c("#00AFBB", "#E7B800","#FC4E07"),
               add = "jitter", shape = "Species")
p


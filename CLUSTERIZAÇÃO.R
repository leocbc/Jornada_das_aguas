library(vegan)

### Métodos de distância

# Dados de peixes
dados_peixe1
dist_peixe = dist(dados_peixe1, method = "euclidean")
heatmap(as.matrix(dist_peixe))

# Iris

dist_iris = dist(iris[,1:4], method = "euclidean")
heatmap(as.matrix(dist_iris))

# Marcadores moleculares

dados_gen = read.csv("Dados_genotipagem.csv", header = TRUE)


#### Desenhando dendrogramas
dista.hc=hclust(d=dist_peixe, method="average")

plot(dista.hc)
rect.hclust(dista.hc, k = 4, border = 2:5)

library("factoextra")
fviz_dend(dista.hc, cex=0.5)


library(pvclust)
resultado = pvclust(t(dados_peixe1), method.dist="euclidean", 
        method.hclust="average", nboot=10)

plot(resultado)


# alternativos
library(ape)
plot(as.phylo(hc2),type= "cladogram")
plot(as.phylo(hc2), type = "fan")

library(circlize)
library(dendextend)

dendrograma <- dados_iris[1:50,-5] %>% dist %>% hclust %>% as.dendrogram %>%
  set("branches_k_color", k=3) %>% set("branches_lwd", c(5,2,1.5)) %>%
  set("branches_lty", c(1,1,3,1,1,2)) %>%
  set("labels_colors") %>% set("labels_cex", c(0.9,1.2)) %>%
  set("nodes_pch", 19)
par(mar = rep(0,4))
circlize_dendrogram(dendrograma)

### Comparando distâncias:
distancia1 <- dist(dados_peixe1, method = "euclidean")
distancia2 <- dist(dados_peixe1, method = "maximum")

# Computando dendrogramas
hc1 <- hclust(distancia1, method = "complete")
hc2 <- hclust(distancia2, method = "complete")

# Criar dois dendrogramas
dend1 <- as.dendrogram (hc1)
dend2 <- as.dendrogram (hc2)

# Comparando dendrogramas
# tanglegram(dend1, dend2)








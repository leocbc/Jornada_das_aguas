### Analise de Componentes Principais - PCA ####

library(factoextra)
library(FactoMineR)

pca_iris = prcomp(dados_iris[,1:4], scale = TRUE)
summary(pca_iris)

fviz_eig(pca_iris, addlabels = TRUE)


# grafico 1 # tratamentos e variaveis

fviz_pca_biplot(pca_iris)

# Grafico 2 - Variaveis
fviz_pca_var(pca_iris,col.var = "contrib",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07","#800000"),
             repel = TRUE)

# grafico 3 - alternativo
fviz_pca_ind(pca_iris,
             geom.ind = "point",
             col.ind = iris$Species, 
             palette = c("#00AFBB", "#E7B800", "#FC4E07"),
             addEllipses = TRUE, 
             legend.title = "Grupos"
)
# grafico 4 - alternativo
fviz_pca_biplot(pca_iris, 
                geom.ind = "point",
                pointshape = 21,
                pointsize = 2.5,
                fill.ind = iris$Species,
                col.ind = "black",
                col.var = factor(c("sepal", "sepal", "petal", "petal")),
                legend.title = list(fill = "Espécies", color = "Clusters"),
                repel = TRUE       
)+
  ggpubr::fill_palette("jco")+     
  ggpubr::color_palette("npg")  

## pca 3D
## iris
tratamentos = iris$Species

library(pca3d)

pca3d(pca_iris, 
      group = tratamentos,
      show.ellipses=TRUE,
      ellipse.ci=0.75)

princomp(dados_peixe2[,10:ncol(dados_peixe2)])

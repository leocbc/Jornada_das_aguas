#### PREDIÇÃO DE VALORES
### Função discriminante de Fisher

library(MASS)

fit <- lda(species ~ sepal_length + sepal_width + petal_length + petal_width,          
           data = dados_iris)
names(fit)

fitclass <- predict(fit, dados_iris)
fitclass = fitclass$class


tabela2 <- xtabs(~ fitclass + species, data = dados_iris)
tabela2

coef(fit)
FD <- as.matrix(dados_iris[, -5]) %*% coef(fit)
dim(FD)

cores <- rainbow(length(levels(dados_iris[, "species"]))) 
plot(FD[, 1], FD[, 2], pch = 20, col = cores[dados_iris$species],     
     xlab = "Função discriminante 1", 
     ylab = "Função discriminante 2")

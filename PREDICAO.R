#### PREDIÇÃO DE VALORES
### Função discriminante de Fisher

library(MASS)

dados <- iris   
names(dados)

fit <- lda(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,          
           data = dados)
names(fit)

fitclass <- predict(fit, dados)
fitclass = fitclass$class


tabela2 <- xtabs(~ fitclass + Species, data = dados)
tabela2

coef(fit)
FD <- as.matrix(dados[, -5]) %*% coef(fit)
dim(FD)

cores <- rainbow(length(levels(dados[, "Species"]))) 
plot(FD[, 1], FD[, 2], pch = 20, col = cores[dados$Species],     
     xlab = "Função discriminante 1", 
     ylab = "Função discriminante 2")

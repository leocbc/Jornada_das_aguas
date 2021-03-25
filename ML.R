install.packages("caret")


library(caret)

## Criandos os dados
indice <- createDataPartition(dados_iris$species, p=0.80, list=FALSE)

validacao <- dados_iris[-indice,]
treinamento <- dados_iris[indice,]


## Metricas

controle <- trainControl(method="cv", number=10)
metrica <- "Accuracy"


## Métodos Random Forest

ajuste_rf <- train(species~., data=treinamento, method="rf", metric=metrica, trControl=controle)
print(ajuste_rf)


## Predicoes

predicoes <- predict(ajuste_rf, validacao)
confusionMatrix(predicoes, as.factor(validacao$species))

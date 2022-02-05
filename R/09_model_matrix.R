## ?model.matrix
## model.matrix(log(Y) ~ log(X_1) * log(X_2)) para variables X dependientes
## model.matrix(log(Y) ~ log(X_1) + log(X_2)) para variables X independientes
##  with() evalua una expresión en datos de un df
mat <- with(trees, model.matrix(log(Volume) ~ log(Height) + log(Girth)))
mat
colnames(mat)
## Modelo lineal creado para una fórmula dada de la forma Y~X1+X2
## Se visualizan los datos con summary
summary(lm(log(Volume) ~ log(Height) + log(Girth), data = trees))

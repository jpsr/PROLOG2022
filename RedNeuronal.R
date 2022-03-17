file <- "https://raw.githubusercontent.com/fhernanb/datos/master/propelente"
Resistencia <- c(2158.7,1678.15,2316,2061.3,2207.5,1708.3,1784.7)
Edad <- c(15.5,23.5,8,17,5.5,19,24)
datos <- data.frame(Resistencia, Edad)
 
head(datos) # Muestra las 6 primeras filas
#install.packages("ggplot2", dependencies = TRUE)   # Se instala una sola vez
library(ggplot2)                                   # Se carga cada session
ggplot(datos, aes(x=Edad, y=Resistencia)) + geom_point()
#install.packages("neuralnet", dependencies = TRUE) # Se instala una sola vez

library(neuralnet)  

maxs <- apply(datos, 2, max) # Máximo valor de las variables
mins <- apply(datos, 2, min) # Mínimo valor de las variables
print(maxs)
print(mins)
scaled <- as.data.frame(scale(datos, center=mins, scale=maxs-mins))
print(scaled)
ggplot(scaled, aes(x=Resistencia, y=Edad)) + geom_point

head(cbind(datos, scaled))

install.packages("gridExtra", dependencies = TRUE) # Se instala una sola vez
require(gridExtra)                                 # Se carga cada session
plot1 <- ggplot(datos, aes(x=Edad, y=Resistencia)) + geom_point()
plot2 <- ggplot(scaled, aes(x=Edad, y=Resistencia)) + geom_point()
grid.arrange(plot1, plot2, ncol=2)

mod1 <- neuralnet(Resistencia ~ Edad, data=scaled, hidden=c(2,3), threshold=0.01)

plot(mod1, rep="best")

names(mod1)

mod1$act.fct # Activation function

unlist(mod1$weights) 

test <- data.frame(Edad = scaled$Edad)
print(test)
myprediction <- compute(x=mod1, covariate=test)
myprediction$net.result[1:5]
print(scaled)

yhat_red <- myprediction$net.result * (max(datos$Resistencia)-min(datos$Resistencia))+min(datos$Resistencia)
datos$yhat_red <- yhat_red
yhat_red[1:5] # Para ver los primeros 5 valores estimados

ggplot(datos, aes(x=Resistencia, y=yhat_red)) + geom_point() +
  geom_abline(intercept=0, slope=1, color="blue", linetype="dashed", size=1.5)
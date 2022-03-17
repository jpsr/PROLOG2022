#install.packages("ggplot2", dependencies = TRUE)  
#install.packages("neuralnet", dependencies = TRUE) # Se instala una sola vez
#install.packages("gridExtra", dependencies = TRUE) # Se instala una sola vez

library(neuralnet)
library(ggplot2)   

Resistencia <- c(2158.7,1678.15,2316,2061.3,2207.5,1708.3,1784.7)
Edad <- c(15.5,23.5,8,17,5.5,19,24)
datos <- data.frame(Resistencia, Edad)

maxs <- apply(datos, 2, max) # Máximo valor de las variables
mins <- apply(datos, 2, min) # Mínimo valor de las variables
print(maxs)
print(mins)
scaled <- as.data.frame(scale(datos, center=mins, scale=maxs-mins))

mod1 <- neuralnet(Resistencia ~ Edad, data=scaled, hidden=c(10,2), threshold=0.01)


test <- data.frame(Edad = scaled$Edad)
myprediction <- compute(x=mod1, test)
pred_Resistencia <- myprediction$net.result[1:7]
pred_Edad <- scaled$Edad
pred_datos <- data.frame(pred_Resistencia, pred_Edad)

plot(mod1)


print(pred_datos)
print(scaled)

require(gridExtra)                                 # Se carga cada session
plot1 <- ggplot(data= scaled, aes(x=Resistencia, y=Edad))  + geom_point()
plot2 <- ggplot(data= pred_datos, aes(x=pred_Resistencia, y=pred_Edad))  + geom_point()
grid.arrange(plot1, plot2, ncol=2)
### Set up

setwd("/home/jcmo/JCMO.Trabajo/@Mis.Cursos/2017-A_Aprendizaje Estadistico/sesiones")

rm(list=ls())

### Plot curve levels

library(ggplot2)
library(dplyr)

f <- function(x,y) x^2 + 3*y^2 - 2*x*y - 20
seq(-10,+10,length=100) %>%
  expand.grid(x=.,y=.) %>%
  mutate(z=f(x,y)) %>%
  ggplot +
  aes(x=x,y=y,z=z) +
  stat_contour(breaks=c(0.0,1,12))


factual <- function(x1, x2) 2*(x2 + x1 + .25*sin(pi*x1))-1
seq(-1,+1,length=100) %>%
  expand.grid(x1=.,x2=.) %>%
  mutate(z=factual(x1,x2)) %>%
  ggplot +
  aes(x=x1,y=x2,z=z) +
  stat_contour(breaks=seq(-3,5,0.1))


gauss.rb1 <- function(r) exp(-0.3*r^2)
gauss.rb2 <- function(r) exp(-3*r^2)
f <- ggplot(data.frame(r = c(-10, 10)), aes(r))
f + 
  stat_function(fun = gauss.rb1, colour = "red") +
  stat_function(fun = gauss.rb2, colour = "blue")

### Plot 3D figures

rm(list=ls())
x = seq ( - pi , pi , length =50)
y=x
f = outer (x ,y , function (x , y ) cos ( y ) /(1+ x ^2) )

contour (x ,y , f )

contour (x ,y ,f , nlevels =45 , add = T )

fa =( f - t ( f ) ) /2
contour (x ,y , fa , nlevels =15)

image (x ,y , f )

image (x ,y , fa )
persp (x ,y , fa )
persp (x ,y , fa , theta =30)
persp (x ,y , fa , theta =30 , phi =20)
persp (x ,y , fa , theta =30 , phi =70)
persp (x ,y , fa , theta =30 , phi =40)

### Simulación de curvas de respuesta

f <- function(x){
  sin(2*pi*x) + cos(2*pi*x)
}

f_sim  <- function(n_sim, s){
  x <- runif(n_sim, 0, 1) 
  y <- f(x) + rnorm(length(x), mean = 0, sd = s)
  data.frame(x, y)
}

set.seed(28) 

sd_mod <- 0.5

datos <- f_sim(5000, sd_mod)

datos

### Example 4 -- Gianola et al. (2011).

library("brnn")

data(Jersey)

#Fit the model with the FULL DATA
out=brnn(pheno$yield_devMilk~G,neurons=2,verbose=TRUE)

#Obtain predictions and plot them against fitted values
plot(pheno$yield_devMilk,predict(out))

#Predictive power of the model using the SECOND set for 10 fold CROSS-VALIDATION
data=pheno
data$X=G
data$partitions=partitions

#Fit the model for the TESTING DATA
out=brnn(yield_devMilk~X,
         data=subset(data,partitions!=2),neurons=2,verbose=TRUE)
#Plot the results
#Predicted vs observed values for the training set
par(mfrow=c(2,1))
plot(out$y,predict(out),xlab=expression(hat(y)),ylab="y")
cor(out$y,predict(out))

#Predicted vs observed values for the testing set
yhat_R_testing=predict(out,newdata=subset(data,partitions==2))
ytesting=pheno$yield_devMilk[partitions==2]
plot(ytesting,yhat_R_testing,xlab=expression(hat(y)),ylab="y")
cor(ytesting,yhat_R_testing)

### Saving
list = ls()
save(list, file = "R_Script_Auxiliar.RData")

### Datos simulados - Clasificacion supervisada

setwd("/home/jcmo/JCMO.Trabajo/@Mis.Cursos/2017-A_Aprendizaje Estadistico/sesiones")

rm(list=ls())

target <- function(x1, x2) {
  2*(x2 - x1 + .25*sin(pi*x1) >= 0)-1
}

N <- 3000
X <- data.frame(x1=runif(N, min=-1, max=1),
                x2=runif(N, min=-1, max=1))
Y <- target(X$x1, X$x2)

Y[which(Y==-1)] <- 0

datos <- cbind(Y,X)
save(datos, file="EST25134_ClasifSup.RData")

### Datos embarazo prematuro - Clasificacion supervisada

setwd("/home/jcmo/JCMO.Trabajo/@Mis.Cursos/2017-A_Aprendizaje Estadistico/sesiones")

rm(list=ls())

datos <- read.csv('SSVS_Probit_Data.csv', 
                header = TRUE, sep = ",", 
                quote="\"", dec=".", fill = TRUE)

#	Inputs
# x = dde 	# dosis
# Y = 0/1 	# variable indicadora sobre embarazo prematuro
# z1-z5 	  # covariables (variables confundidas)

# Normalizando los datos
datos$x<- (datos$x - mean(datos$x))/sqrt(var(datos$x)) 
datos$z1<- (datos$z1 - mean(datos$z1))/sqrt(var(datos$z1)) 
datos$z2<- (datos$z2 - mean(datos$z2))/sqrt(var(datos$z2)) 
datos$z3<- (datos$z3 - mean(datos$z3))/sqrt(var(datos$z3)) 
datos$z4<- (datos$z4 - mean(datos$z4))/sqrt(var(datos$z4))

datos <- datos[,c("y","x","z1","z2","z3","z4")]
datos <- as.data.frame(datos)

colnames(datos) <- c("Y","X","Z1","Z2","Z3","Z4")

save(datos, file="EST25134_Pregnancy.RData")

### Plots

rm(list=ls())

library(ggplot2)
library(dplyr)
f <- function(x,y) x^2 + 3*y^2 - 2*x*y - 20
seq(-10,+10,length=100) %>%
  expand.grid(x=.,y=.) %>%
  mutate(z=f(x,y)) %>%
  ggplot +
  aes(x=x,y=y,z=z) +
  stat_contour(breaks=c(0.0,1,12))


factual <- function(x1, x2) 2*(x2 + x1 + .25*sin(pi*x1))-1

seq(-1,+1,length=100) %>%
  expand.grid(x1=.,x2=.) %>%
  mutate(z=factual(x1,x2)) %>%
  ggplot +
  aes(x=x1,y=x2,z=z) +
  stat_contour(breaks=seq(-3,5,0.1))


gauss.rb1 <- function(r) exp(-0.3*r^2)
gauss.rb2 <- function(r) exp(-3*r^2)
f <- ggplot(data.frame(r = c(-10, 10)), aes(r))
f + 
  stat_function(fun = gauss.rb1, colour = "red") +
  stat_function(fun = gauss.rb2, colour = "blue")

### Quantmod

#
#	Consulta de datos financieros usando "quantmod"
#

# install.packages("quantmod")

rm(list=ls())

require("quantmod")

setwd("/home/jcmo/JCMO.Trabajo/@Mis.Cursos/2017-A_Aprendizaje Estadistico/sesiones")

#	Apple
getSymbols("AAPL",src="google")

#	Microsoft
getSymbols("MSFT",src="google")

#	Yahoo
getSymbols("YHOO",src="google")

#	Data 4 analysis (levels)
data4analysis_l <- cbind(AAPL$AAPL.Close,MSFT$MSFT.Close,YHOO$YHOO.Close)
colnames(data4analysis_l) <- c("AAPL","MSFT","YHOO")
write.csv(data4analysis_l, file = paste(path.data,"data4analysis_l.csv",sep=""), row.names = TRUE)

#	Data 4 analysis (returns)
data4analysis_r <- cbind(Delt(AAPL$AAPL.Close),Delt(MSFT$MSFT.Close),Delt(YHOO$YHOO.Close))
colnames(data4analysis_r) <- c("AAPL","MSFT","YHOO")
write.csv(data4analysis_r, file = paste(path.data,"data4analysis_r.csv",sep=""), row.names = TRUE)

datos <- data4analysis_r

save(datos, file="EST25134_StockPrices.Rdata")

### Contours

rm(list=ls())
x = seq ( - pi , pi , length =50)
y=x
f = outer (x ,y , function (x , y ) cos ( y ) /(1+ x ^2) )

contour (x ,y , f )

contour (x ,y ,f , nlevels =45 , add = T )

fa =( f - t ( f ) ) /2
contour (x ,y , fa , nlevels =15)

image (x ,y , f )

image (x ,y , fa )
persp (x ,y , fa )
persp (x ,y , fa , theta =30)
persp (x ,y , fa , theta =30 , phi =20)
persp (x ,y , fa , theta =30 , phi =70)
persp (x ,y , fa , theta =30 , phi =40)

### Jersey data

rm(list=ls())
setwd("C:\\JCMO.Trabajo\\@Mis.Cursos\\2017-A_Aprendizaje Estadistico\\est25134_git\\datos")

### Simulación de curvas de respuesta

f <- function(x){
  sin(2*pi*x) + cos(2*pi*x)
}

f_sim  <- function(n_sim, s){
  x <- runif(n_sim, 0, 1) 
  y <- f(x) + rnorm(length(x), mean = 0, sd = s)
  data.frame(x, y)
}

set.seed(28) 

sd_mod <- 0.5

datos <- f_sim(5000, sd_mod)

datos

save(f, f_sim, datos, file = "Curve_Data.RData")


# ------
###############################################################
#Example 4
#Gianola et al. (2011).
#Warning, it will take a while
#Load the Jersey dataset
data(Jersey)
#Fit the model with the FULL DATA
#Formula interface
out=brnn(pheno$yield_devMilk~G,neurons=2,verbose=TRUE)
#Obtain predictions and plot them against fitted values
plot(pheno$yield_devMilk,predict(out))
#Predictive power of the model using the SECOND set for 10 fold CROSS-VALIDATION
data=pheno
data$X=G
data$partitions=partitions
#Fit the model for the TESTING DATA
out=brnn(yield_devMilk~X,
         data=subset(data,partitions!=2),neurons=2,verbose=TRUE)
#Plot the results
#Predicted vs observed values for the training set
par(mfrow=c(2,1))
plot(out$y,predict(out),xlab=expression(hat(y)),ylab="y")
cor(out$y,predict(out))
#Predicted vs observed values for the testing set
yhat_R_testing=predict(out,newdata=subset(data,partitions==2))
ytesting=pheno$yield_devMilk[partitions==2]
plot(ytesting,yhat_R_testing,xlab=expression(hat(y)),ylab="y")
cor(ytesting,yhat_R_testing)

  
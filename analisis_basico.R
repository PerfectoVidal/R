#Documento de análisis básico
summary(mydata)
#Miramos las cabeceras
names(mydata)
#Por ejemplo vemos un resumen del nox
summary(mydata$nox)
#preguntamos sobre la media de nox
mean(mydata$nox)
#Nos devuelve NA, esto significa que tenemos falta de valores en alguna estación
#Vemos la media sin los NA
mean(mydata$nox,na.rm=TRUE)
#Tenemos una medai de 178.7986

#Vamos a ver el histograma del NO2
hist(mydata$no2, main = "Histograma del Dioxido de Nitrógeno",xlab = "Dioxido de nitrógeno (ppb)")

#Podemos eliminar aquellos valores que son NA
newdata<-na.omit(mydata)

#Estudiamos la densidad de NO2
densidadNO2<-density(mydata$no2,na.rm = TRUE) 
plot(densidadNO2,main="Densidad del dioxido de nitrógeno",xlab = "Dioxido de nitrógeno (ppb)")

#Vamos a dibujar el valor de nox respecto al tiempo
plot(mydata$date,mydata$nox,type = "l",main="Evolucion de los oxidos de nitrogenos",xlab="año",ylab = "Oxidos de nitrogenos (ppb)")

#Vamos a ver solamente las 500 primeras mediciones
plot(mydata$date[1:500],mydata$nox[1:500],type = "l",main="Evolucion de los oxidos de nitrogenos",xlab="fecha",ylab = "Oxidos de nitrogenos (ppb)")

#Creamos Agregados de datos,es decir, cogemos la media mensual y quitamos aquellos datos NA
means<-aggregate(mydata["nox"], format(mydata["date"],"%Y-%m"),mean, na.rm = TRUE)
#Creamos un vector que tenga desde el primer día hasta el último, que tenga tantas filas como means
means$date <- seq(min(mydata$date), max(mydata$date), length = nrow(means))
plot(means$date, means[, "nox"], type = "l")



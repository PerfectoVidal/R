#Lectura de datos
library(openair)
#extraemos los datos
mydata<-read.csv("OpenAir.csv",header=TRUE)
#debemo convertir la fecha a un formato en que R entienda
mydata$date <- as.POSIXct(strptime(mydata$date, format = "%d/%m/%Y %H:%M", tz = "GMT"))
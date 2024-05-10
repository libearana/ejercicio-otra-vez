setwd("C:/ASIGNATURAS/Data Science/ejercicio otra vez/ejercicio-otra-vez/Datos")
library(readxl)
library(lubridate)
library(dplyr)
datos <- read_xlsx("online_retail_II.xlsx")
str(datos)

datos$InvoiceDate <- ymd_hms(datos$InvoiceDate)
datos$Invoice <- as.factor(datos$Invoice)

summary(datos)
head(datos)
str(datos)
class(datos)
length(datos)
dim(datos)

pedidos_diferentes<-length(unique(datos$Invoice))

precio_medio<- datos %>% group_by(Invoice) %>% summarise(media=mean(n()))

media_producto<-datos %>% group_by(Invoice) %>% summarise(total=sum(Quantity))
precio_por_pedido<-datos %>% group_by(Invoice) %>% summarise(precio_total=sum(Price))





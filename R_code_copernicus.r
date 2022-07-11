# Lezione 14.04.21
# Visualizzazione di dati presi da copernicus
library(raster)
install.packages("ncdf4")
library(ncdf4)
setwd("C:/lab/")
# scegliamo un nome da dare al nostro dataes e dato che usiamo un solo dato usiamo la funzione raster
lst10<-raster("lst10.nc")
# stabiliamo la nostra coloRampPalette
cl<-colorRampPalette(c('light blue','green','red', 'yellow'))(100)
plot(lst10, col=cl)
# questo dato si può ricampionare, ovver possiamo diminure la risoluzione usando pixel più grandi in modo che sia più gestibile
# utilizzando la funzione aggregate per diminuire la risoluzione utilizzando un fattore 100
lst10res<-aggregate(lst10, fact=100)
plot(lst10res, col=cl)

# R_code_spectral_signatures.r
library(raster)
library(ggplot2)
library(rgdal)
# settiamo la working directory
setwd("C:/lab/")
# Carichiamo il dataset (tutte e 3 le bande)
# le tre mande corrispondo a NIR, red, green
defor2 <- brick("defor2.jpg")
# plottiamo l'immagine con stretch lineare 
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
# la funzione per creare le firme spettrali è click 
# sevre per cliccare sulla mappa e chiedere qualsiasi tipo di informazione, in questo caso verrano fuori informazioni relatove alla riflettanza 
# serve il pacchetto rgdal
# Id= T(true), xy(significa se vogliamo usare una informaizone di tipo spaziale)=T
# cell(per dire che andremo a cliccare su un pixel, type (tipo di click, noi farmo un punto)
#pch (per definir eil tipo di pinuto) cex (per la dimensione), col (per il colore)
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, col="magenta") 
# risultati
#x     y   cell defor2.1 defor2.2 defor2.3
#1 155.5 270.5 148575      210       18       29
#      x     y   cell defor2.1 defor2.2 defor2.3
#1 120.5 219.5 185107      139       29       56
# costruiamo una colonna con i valori di riflettanza per la banda 1, 2 e 3 per la foresta e per l'acqua
band <- c(1,2,3)
forest <- c(210,18,29)
water <- c(139,29,56)
# attraverso la funzione data.frame costruiamo una tabella 
spectrals <- data.frame(band,forest,water)
attach(spectrals)
# attraverso la funzione ggplot andiamo a plottare 
# attraverso le aesteticts definiamo cosa deve essere l'asse delle x, mettiamo le bande
# sull'asse delle y mettiamo la riflettanza mettendo una linea per la foresta e una per l'acqua 
# attrvaerso le funzione geom_line inseriamo le geometria nel plot 
ggplot(output, aes(x=band)) + 
    geom_line(aes(y = forest), color = "green")+
    geom_line(aes(y = water), color = "blue", linetype = "dotted")+
    labs(x="wavelength", y="reflectance")

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


# costruiamo ua colonna con i valori di riflettanza per la banda 1, 2 e 3 per la foresta e per l'acqua
band <- c(1,2,3)
forest <- c(187,23,34)
water <- c(39,87,125)

# col.lab="red")
# press esc or close window

# store data
dw <- c(1,2,3)
forest <- c(187,23,34)
water <- c(39,87,125)

output <- data.frame(dw,forest,water)
attach(output)
 
library(ggplot2)
ggplot(output, aes(x=dw)) + 
    geom_line(aes(y = forest), color = "green")+
    geom_line(aes(y = water), color = "blue", linetype = "dotted")+
    labs(x="wavelength", y="reflectance")

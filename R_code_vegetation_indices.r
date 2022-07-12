# R_code_vegetation_indices.r
library(raster)
setwd("C:/lab/)
# carichiamo le due immagini attraverso la funzione brick 
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")
# plottiamo in RGB le due immagini 
# b1 = NIR, b2 = red, b3 = green 
# mettendo l'infrarosso sul rosso, il rosso sul verdo e il verdo sul blu
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

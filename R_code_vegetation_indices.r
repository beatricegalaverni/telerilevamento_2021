# R_code_vegetation_indices.r
library(raster)
library(RStoolbox)
library/rasterdiv)
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
# DVI 1
# NIR della defor 1 - red defor 1
# uniamo il nome del dataset con il nome dell banda con il simbolo $
# per ogni pixel prendiamo valore dell'NIR e del RED e li sottraiamo 
dvi1 <- defor1$defor1.1 - defor1$defor1.2
# plottiamo
# il plot rappresenta lo stato della vegetazione 
plot(dvi1)
# definiamo una nuova coloRamppalette
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
# plottiamo l'immagine con la coloRampPalette decisa e attribuiamo un titola all'immagine
plot(dvi1, col=cl, main="DVI at time 1")
# DVI 2
dvi2 <- defor2$defor2.1 - defor2$defor2.2
plot(dvi2, col=cl, main="DVI at time 2")
# Facciamo un par a 2 righe e una colonna delle due immagini ottenute 
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")
# Differenza tra il DVI1 e il DVI2
difdvi <- dvi1 - dvi2
difdvi 
# stabiliamo una colorRamPalette (molto utilizzata per le differenze)
# la mappa evidenzia i punti, in rosso, doce c'è stato un cambiamento maggiore
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cld)
# NDVI
# in modo da poter paragonare immagine che hanno una definirione radiometrica differente
# (NIR-RED) / (NIR+RED)
# NDVI1
ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)
plot(ndvi1, col=cl)
# un'altra alternativa è utilizzarle DVI e dividerlo per la somma tra NIR e RED
# ndvi1 <- dvi1 / (defor1$defor1.1 + defor1$defor1.2)
# plot(ndvi1, col=cl)
# NDVI2
ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)
plot(ndvi2, col=cl)
# ndvi2<- dvi2 / (defor2$defor2.1 + defor1$defor2.2)
# plot(ndvi2, col=cl)
# utilizziamo la funzione spectralIndices per calcolare una serie di indici insieme
# otteniamo degli indici di vegetazione delle nostre immagini
# devono essere dichiarate le bande: la banda del verde, del rosso e del vicino infrarosso
vi1 <- spectralIndices(defor1, green = 3, red = 2, nir = 1)
# plottiamo con la colorampPalette decisa in precedenza
plot(vi1, col=cl)
# Facciamo la stessa cosa per la seconda immagine
vi2 <- spectralIndices(defor2, green = 3, red = 2, nir = 1)
plot(vi2, col=cl)
# differenza tra tra NDVI1 e NDVI2
# in rosso le aree con la maggior perdita di vegetazione
difndvi <- ndvi1 - ndvi2
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)
# richiamando la libreria rasterdiv plottiamo copNDVI
plot(copNDVI)
# per rimuovere i valori che riguardano l'acqua usiamo la funziona cbind
# trasformiamo i pixel con i valori 253,254 e 255 e li trasformiamo in non valori 
# riclassifichiamo l'immagine originale copNDVI
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
# otteniamo una mappa dell'NDVI a scala globale
plot(copNDVI)
# utilizziamo la funzione levelplot che ci mostra le medie dei valori sulle righe e sulle colonne
levelplot(copNDVI)






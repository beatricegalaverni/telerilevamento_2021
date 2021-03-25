# Il mio primo codice in R per il telerilevamento 
setwd("C:/lab/")
library(raster)
p224r63_2011<-brick("p224r63_2011_masked.grd")
p224r63_2011
plot(p224r63_2011)
# Per cambiare la scala dei colori con i quali visualizziamo la nostra immagine
colore<-colorRampPalette(c("black","gray","light gray"))(100)
plot(p224r63_2011, col=colore)
# Cambiare colore ed avere scala di colori differenti 
colore<-colorRampPalette(c("pink","black","green"))(100)
plot(p224r63_2011, col=colore)
Vado a richiamare il paccheto raster 
library(raster)
Vado a richiamare la cartella lab
setwd("C:/lab/") 
p224r63_2011 <- brick("p224r63_2011_masked.grd")
cls <- colorRampPalette(c("red","pink","orange","purple")) (200)
plot(p224r63_2011, col=cls)
Andiamo ad interrogare imamgine per avere informazioni principali
p224r63_2011
Queste sono le bande di Landsat contenute all'interno dell'immagine
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio
Ripuliamo finestra grafica 
dev.off()
Plottiamo la banda1, quella del blu che è B1_sre
plot(p224r63_2011$B1_sre)
cls <- colorRampPalette(c("red","pink","orange","purple")) (200)
plot(p224r63_2011$B1_sre, col=cls)
plot(p224r63_2011$B1_sre)
# 1 riga, 2 colonne
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
# 2 righe, 1 colonna
par(mfrow=c(2,1))
Se usassi per prima le colonne 
par(mfcol=c(1,2))
# plot the first four bands of Landsat
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

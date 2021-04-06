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
# Andiamo ad interrogare imamgine per avere informazioni principali
p224r63_2011
# Queste sono le bande di Landsat contenute all'interno dell'immagine
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio
# Ripuliamo la finestra grafica 
dev.off()
# Plottiamo la banda1, quella del blu che è B1_sre con i colori predefiniti da R 
plot(p224r63_2011$B1_sre)
# Plottiamo banda 1 con colorRampPalette da noi definita
cls <- colorRampPalette(c("red","pink","orange","purple")) (200)
plot(p224r63_2011$B1_sre, col=cls)
# Ripuliamo la finestra grafica 
dev.off()
# 1 riga, 2 colonne
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
# 2 righe, 1 colonna
par(mfrow=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
# Se usassi per prima le colonne 
par(mfcol=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
# Plottiamo le prime 4 bande di landsat, in 1 colonna e 4 righe 
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)
# Ora plottiamo le 4 bande in una grafico 2 x 2 
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)
# Associo ad ogni banda una color ramp palette che richiami quella banda 
par(mfrow=c(2,2))
# Per prima lo faccio con la banda del blu
clb <- colorRampPalette(c("dark blue","blue","light blue")) (100)
plot(p224r63_2011$B1_sre, col=clb)
# Vado a fare quella del verde 
clg <- colorRampPalette(c("dark green","green","light green")) (100)
plot(p224r63_2011$B2_sre, col=clg)
# e poi le altre 
clr <- colorRampPalette(c("dark red","red","light pink")) (100)
plot(p224r63_2011$B3_sre, col=clr)
cln <- colorRampPalette(c("red","orange","yellow")) (100)
plot(p224r63_2011$B4_sre, col=cln)


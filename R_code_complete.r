# R_code_complete.r telerilevamento geoecologico 
#-----------------------------------------------
# summary
# 1- remote sensing remote first
# 2- R code time series
# 3- R code Compenicus data
# 4- R code knitr
# 5- R code multivariate analysis
# 6- R code classification
# 7- R code ggplot 2
# 8- R code vegetation indices
# 9- R code land cover 
# 10- R code variability 
# 11- R code spectral signatures
#----------------------------------------------
# 1- remote sensing remote first
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
# plottiamo la ostra immagine con la scala di colore cambiata
plot(p224r63_2011, col=colore)
# Lezione 24.03.21
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
# Lezione 26.03.21
library(raster)
setwd("C:/lab/")
p224r63_2011 <- brick("p224r63_2011_masked.grd")
# Queste sono le bande di Landsat contenute all'interno dell'immagine
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio
# RGB
# Utilizziamo schema RBG per vedere immagine in colori naturali
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
# Utilizziamo altre bande 
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
# Utilizziamo funzione #par per creare un multiframe 2x2 delle 4 immagini che abbiamo creato
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
# Creare un PDF e inserirlo nella cartella LAB
pdf("il_mio_primo_pdf.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
dev.off()
# utilizziamo la funzione #hist per fare uno stretch non lineare 
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")
# Multiframe a 3 righe e 1 colonna di immagine a colori naturali, immgine con infrarosso e con histogram stretch
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")
# Lezione 31.03.21
library(raster)
setwd("C:/lab/")
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
# Inseriamo il file del 1988
p224r63_1988 <- brick("p224r63_1988_masked.grd")
p224r63_1988
# plottiamo l'intera immagine 
plot( p224r63_1988)
# Queste sono le bande di Landsat contenute all'interno dell'immagine
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio
# Plottiamo immagine con sistema RGB in colori naturali e con stretch lineare
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")
# Andiamo a visualizzare infrarosso
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
# Utilizziamo funzione #par per creare multiframe e mettere a confronto le immagini del 1988 e del 2011
par(mfrow=c(1,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
# Utilizziamo funzione #par per creare multiframe e mettere a confronto le immagini del 1988 e del 2011 sia con strecht lineare che con histogram 
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
# Facciamo PDF di questo grafico 2 x 2 utilizando la funzione # pdf e salviamo nella cartella lab 
pdf("multitemp.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
dev.off()
#-----------------------------------------------
# 2- R code time series
# Time series analysis
# Greenland increase of temperature 
# Data and code from Emanuela Cosma 
library (raster)
setwd("C:/lab/greenland")
# utilizziamo funzione raster per caricare dei singoli dati 
lst_2000<-raster("lst_2000.tif")
# Andiamo a plottarla
plot(lst_2000)
lst_2005<-raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")
# apriamo un multipanel con le 4 immagini
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)
# Creiamo una lista di file con la funzione # list.files e lo associamo ad un oggetto rlist
rlist<-list.files(pattern="lst")
# andiamo a vedere che abbiamo ottenuto la lista di file
rlist
# attraverso la funzione lapply applichiamo la funzione #raster a tutta a lista di file creata in precedenza 
import<-lapply(rlist, raster)
# Creiamo un file unico composto da diversi file raster attraverso funzione #stack
TGr<-stack(import)
# sovrapposzione di 3 immagini tutte insieme, di tre diversi anni 
plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 1, 2, 3, stretch="Lin") 
plotRGB(TGr, 2, 3, 4, stretch="Lin") 
plotRGB(TGr, 4, 3, 2, stretch="Lin") 
# lezione 09/04/21
install.packages("rasterVis")
library(rasterVis)
# settiamo la cartella greenland
setwd("C:/lab/greenland")
# ripetiamo i passaggi della scorsa lezione 
rlist<-list.files(pattern="lst")
import<-lapply(rlist, raster)
TGr<-stack(import)
# per vedere tutte le informazioni del file che abbiamo creato
TGr
# utilizziamo comando level plot che ci da un'immagine più chiara 
levelplot(TGr)
#level plot vhr ci fa vedere come varia la temperatura nell'area in esame
levelplot(TGr$lst_2000)
# Cambiare la colore ramp palette, possiamo farlo perchè stiamo usando immagini singole 
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
# per cambiare colore dobbiamo usare l'argomento col.regions
levelplot(TGr, col.regions=cl)
# rinominiamo i vari layers all'interno dell'immagine
levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
# attraverso l'argomento main possiamo mettere il titolo alla nostra immagine
levelplot(TGr,col.regions=cl, main="LST variation in time",
          names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
# Utilizziamo i dati sullo scioglimento, sono molti dati, quindi facciamo un lista dei file che hanno come pattern comune melt
meltlist <- list.files(pattern="melt")
# applichiamo la funzione lapplay per applicare la funzione raster a tutta la lista 
melt_import <- lapply(meltlist,raster)
# raggruppo tutti i file attraverso la funzione stack 
melt <- stack(melt_import)
melt
# osserviamo valore dello scioglimento del ghiaccio con level plot
levelplot(melt)
# Possiamo fare delle "operazioni algebriche", fare la sottrazione tra uno strato e un altro e a questo associamo un nome. prima dobbiamo legare il singolo raster interno al proprio file 
melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt
melt_amount
# creiamo una nuoca colorRampPalette dove associamo ai valori più bassi il blu, ai valori medi il bianco e ai valori più alti in rosso
clb <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount, col=clb)
# facciamo un level plot
levelplot(melt_amount, col.regions=clb)
install.packages("knitr")
#--------------------------------------------
# 3- R code Compenicus data
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
#---------------------------------------------------------------------------
# 4- R code knitr
# R_code knitr
# utilizziamo il pacchetto knitr per creare un report in R
library(knitr)
setwd("C:/lab/")
# utilizziamo la funzione stitch, il primo argomento è come si chiama il nostro codice, poi il tamplate e il pacchetto da utilizzare 
stitch("R_code_greenlad.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
#---------------------------------------------------------------------------------------------
# 5- R code multivariate analysis
# R_code_multivariate_analysis.r
library(raster)
library/RStiilbox)
setwd("C:/lab/")
# l'immagine è composta da 7 bande quindi dobbiamo usare la funzione brick 
224r63_2011 <- brick("p224r63_2011_masked.grd")
# plottiamo l'immagine 
plot(p224r63_2011)
p224r63_2011
# plottiamo la banda del blu contro la banda del verde 
# B1_sre è la banda del blu, B2_sre è la banda del verde 
# leghiamo il la banda al attraverso il $
# col=red così i punti diventano rossi, usiamo un pch e attraverso cex aumentiamo la dimensione dei punti
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)
# cambiamo l'ordine delle bande sugli assi 
plot(p224r63_2011$B2_sre, p224r63_2011$B1_sre, col="red", pch=19, cex=2)
# attraverso la funzione pairs, plottiamo tutte le correlazioni possibili tra la bande di un dataset
pairs(p224r63_2011)
# usiamo la funzione aggregate per aggregare i pixel e avere una risoluzione più bassa per avere un dato un po' più leggero
# attraverso factor decidiamo di quante volte aumentare la grandezza del pixel
# questo processo si chiama ricampionamento, da qui il nome "res"
p224r63_2011res <- aggregate(p224r63_2011, fact=10)
# facciamo un pannello con due immagini dentro per confrontare le due immagini 
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")
# Analisi delle componenti principali (PCA)
# attraverso la funzione "rasterPCA" prendiamo il pacchetto di dati e li compatti lungo un numero minore di bande  
p224r63_2011res_pca <- rasterPCA(p224r63_2011res)
# utilizziamo la funzione summary che ci da un sommario del modello 
summary(p224r63_2011res_pca$model)
# andiamo a fare un plot totale, vedremo tutte le componenti, la prima con il massimo della varianza spiegata 
plotRGB(p224r63_2011res_pca$map)
# plottiamo in RGB l'immagine legata al modello usando uno stretch lineare 
plotRGB(p224r63_2011res_pca$map, r=1, g=2, b=3, stretch="lin")
#-----------------------------------------------------------------------------
# 6- R code classification
R_code_classification
settiamo la working directory 
setwd("C:/lab/")
library(raster)
library(RStoolbox)
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
# Funzione che ci serve per visualizzare la nostra immagine per i tre livelli che abbiamo importato
plotRGB(so, 1,2,3, stretch="lin")
# per vedere le informazioni 
so 
# classificazione non supervisionata, il software sceglie i treandig set
#usiamo la funzione unsuperClass che opera la classificacazione non supervisionata
# ci sono lacuni parametri da definire come: l'immagine da usare, il numero di campioni, quante classi vogliamo fare 
#associamo la funzione ad un oggetto 
soc <- unsuperClass(so, nClasses=3)
soc
# facciamo un plot della nostra immagine classificata in particolare alla mappa
# leghiamo la mappa alla nostra immagine 
plot(soc$map)
# Facciamo un'altra classificazione impostando il numero di classi=20
soc20 <- unsuperClass(so, nClasses=20)
cl <- colorRampPalette(c('white','orange','pink'))(100)
plot(soc20$map,col=cl)
# scarichiamo un'altra immagine da Solar Orbiter
sun <- brick("sun.png")
# classifichiamola secondo 3 classi 
sunc <- unsuperClass(sun, nClasses=3)
plot(sunc$map)

# Utilizziamo immagini Gran Canyon
# https://landsat.visibleearth.nasa.gov/view.php?id=80948
library(raster)
library(RStoolbox)
setwd("C:/lab/")
# dato che la nostra immagine è formata da più livelli utilizziamo la funzione brick per caricare più livelli insieme
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
# per visualizzare l'immagine rgB usiamo, usando lo stretch per aumentare la potenza visiva dei colori 
plotRGB(gc, r=1, g=2, b=3, stretch="lin")
# cambiando il tipo di streach
plotRGB(gc, r=1, g=2, b=3, stretch="hist")
# procediamo con la la classificazione non supervisionata utilizzand la funnzione unsuperClass
# definiamo il numero di classi =2
gcc2 <- unsuperClass(gc, nClasses=2)
gcc2
# plottiamo l'immagine legata alla mappa
plot(gcc2$map)
# classfichiamo stabileno 4 classi 
gcc4 <- unsuperClass(gc, nClasses=4)
plot(gcc4$map)
#---------------------------------------------------------------------------------------------------------------------
# 7- R code ggplot 2
library(raster)
library(RStoolbox)
library(ggplot2)
library(gridExtra)

setwd("~/lab/")

p224r63 <- brick("p224r63_2011_masked.grd")

ggRGB(p224r63,3,2,1, stretch="lin")
ggRGB(p224r63,4,3,2, stretch="lin")

p1 <- ggRGB(p224r63,3,2,1, stretch="lin")
p2 <- ggRGB(p224r63,4,3,2, stretch="lin")

grid.arrange(p1, p2, nrow = 2) # this needs gridExtra
#----------------------------------------------------------------------------------------
# 8- R code vegetation indices
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
#------------------------------------------------------------------------------------
# 9- R code land cover 
# R_code_land_cover.r
library(raster)
# per la classificazione usiamo la libreria RStoolbox
library(RStoolbox) 
library(ggplot2)
library(gridExtra)
# utilizziamo immagini satelittarei con varie bande
# NIR 1, RED 2, GREEN 3
# utilizziamo la funzione brick
defor1 <- brick("defor1.jpg")
# plottiamo in RGB il file con uno stretch lineare
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
# attraverso il pacchetto ggplot possiamo plottare le immagini un mood migliore
# usiamo la funzione ggRGB
ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
# facciamo la stessa cosa con la seconda immagine
defor2 <- brick("defor2.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
# possiamo fare un multiframe delle immagini ottenute dalla funzione plotRGB
par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
# non possiamo usare la funzione par per le immagini ottenute con ggRGB
# nominiamo i due plot fatti in ggRGB
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
# la funzione grid.arrange compone come ci piace di più il multiframe
# in questo caso in due righe 
grid.arrange(p1, p2, nrow=2)
# Classificazione non supervisionata utilizzando la funzione unsuperClass 
# definiamo come argometo 2 classi 
d1c <- unsuperClass(defor1, nClasses=2)
# per plottare dobbiamo legare il modello alla mappa
plot(d1c$map)
# classe 1: zona agricola 
# classe 2: foresta tropicale
# set.seed() si può utilizzare per dare un numero alla funzione e ottenere gli stessi risultati
# applicchiamo le stesse funzioni e le applichiamo alle seconda immagine 
d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)
# classe 1: zona agricola foresta tropicale
# classe 2: foresta tropicale
# Facciamo una classificazione con 3 classi 
d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map)
# calcoliamo quanto abbiamo perso di foresta
# calcoliamo la frequenza dei pixel di una certa classe (foresta, arcolo)
# utilizziamo la funzione freq()
freq(d1c$map)
value  count
[1,]     1  34724
[2,]     2 306568
# calcoliamo la proporzione 
s1 <- 306583 + 34709
prop1 <- freq(d1c$map) / s1
# proporzione foresta: 0.8983012
# proporzione agricoltura: 0.1016988
# calcoliamo le proporzioni anche per la seconda mappa
s2 <- 342726
prop2 <- freq(d2c$map) / s2
# proporzione foresta: 0.5206958
# proporzione agricoltura: 0.4793042
# generiamo un dataset, in R chiamato dataframe
# facciamo una prima colonna dove mettiamo i fattori (variabili categoriche): cover
cover <- c("Forest","Agriculture")
# facciamo altre due colonne dove mettiamo i volori percentuali dei due anni 
percent_1992 <- c(89.83, 10.16)
percent_2006 <- c(52.06, 47.93)
# attraverso la funzione data.frame creiamo un data frame 
percentages <- data.frame(cover, percent_1992, percent_2006)
percentages
# facciamo un grafico con la funzione ggplot
# la funzione plotta un dataset(percentages)
# è composta dalla partr aestetics, definiamo le colonne e il colore e il tipo di grafico 
# stat=identity significa che utilizziamo i dati così come sono 
# fill definisce il colore all'interno
ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")
# nominiamo i grafici che abbiamo creato
p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")
# utilizziamo la funzione grid.arrange per posizionare più grafici all'interno di una pagina
# stabiliamo un'unica riga
grid.arrange(p1, p2, nrow=1)
#--------------------------------------------------------------------------------------------------
# 10- R code variability
# R_code_variability.r
library(raster)
library(RStoolbox)
library(ggplot2)
library(gridExtra)
# viridis serve per colorare i ggplot
library(viridis) 
setwd("C:/lab/") 
# L'immagine sentinel è formata da 3 bande per questo utilizziamo la funzione brick
# utilizziamo brick per importare l'immagine 
sent <- brick("sentinel.png")
# NIR 1, RED 2, GREEN 3
# siccome questa sequenza è di defolt r=1, g=2, b=3 possiamo non specificare (plotRGB(sent, r=1, g=2, b=3, stretch="lin") )
# applichiamo un stretch lineare
plotRGB(sent, stretch="lin") 
# possiamo cambaire composizione 
plotRGB(sent, r=2, g=1, b=3, stretch="lin") 
# per calcolare la deviazione standar prendiamo una sola banda
# per usare ndvi ci servono banda del nir e del red
# leghiamo il nome delle bande di sentinel con l'immagine sent
# associamo alla banda sentinel.1 un oggetto chiamato nir
# associamo alla banda sentinel.2 un oggetto chiamato red
nir <- sent$sentinel.1
red <- sent$sentinel.2
# calcoliamo l'indice NDVI 
ndvi <- (nir-red) / (nir+red)
# plottiamo NDVI così otteniamo un unico strato sul quale calcolare le deviazioni standard 
plot(ndvi)
# possiamo cambiare coloRampPalette
cl <- colorRampPalette(c('black','white','red','magenta','green'))(100) # 
plot(ndvi,col=cl)
# andiamo a calcolare la variabilità di questa immagine 
# abbiamo un singolo strato
# utilizziamo la funzione focal per calcolare la statistica di interesse
# l'argomento w=window definiamo come è formata la nostra matrice
# come funzione (fun) selezioniamo la deviazione standard=sd
ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
# cambiamo la coloRampPalette
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
# andiamo a visualizzare la deviazione standard sull'ndvi
plot(ndvisd3, col=clsd)
# Calcoliamo la media della deviazione standard attraverso la funzione mean
ndvimean3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(ndvimean3,col=clsd))
# cambiamo le dimensione delle window, della finestra
# stabiliamo una dimensione della finiestra 13 per 13
ndvisd13 <- focal(ndvi, w=matrix(1/169, nrow=13, ncol=13), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(ndvisd13, col=clsd)
# selezioniamo una finestra che sia intermedia tra quelle selezionate in precedenza
# utilizziamo una finestra 5 per 5 
ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(ndvisd5, col=clsd)

# Facciamo analisi multivariata 
# e per calcolare la deviazione standard dato che abbiamo bisogno di un solo strato usiamo la PC1
# la funzione che usiamo è rasterPCA: fa l'analisi delle componenti principali per le immagini raster
# diamo un nome al nostro modello
sentpca <- rasterPCA(sent) 
plot(sentpca$map)  
# facciamo un summary del modello per vedere quanta variabilità iniizale spiegano le componenti
summary(sentpca$model)
# la prima componente spiega il 67.36804% dell'informazione iniziale
# la prima componente PC1
# per usare la prima componente leghiamo la mappa con il dollaro alla prima componente 
# lo associamo ad un nome
pc1 <- sentpca$map$PC1
# calcoliamo la deviazione standar della prima componente principale
pc1sd5 <- focal(pc1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
# definiamo una coloRampPalette
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(pc1sd5, col=clsd)
# attraverso la funzione source si salva il pezzo di codice e lo facciamo partire dentro r
# questo è il pezzo di codice
# pc1 <- sentpca$map$PC1
# pc1sd7 <- focal(pc1, w=matrix(1/49, nrow=7, ncol=7), fun=sd)
# plot(pc1sd7)
# lo scrichiamo da virtuale
# lo salviamo con il nome source_test_lezione.r nel computer
#questo codice è il calcolo di una deviazione standard su 7 per 7 pixel
# usciamo da R e portiamo dentro il codice
source("source_test_lezione.r")
# carichiamo un altro codice dall'esterno 
source("source_ggplot.r")
# attraverso ggplot possiamo fare dei plot migliori 
# attraverso la funzione ggplot() creiamo un finestra nuova vuota
# la funzione funziona aggiungendo blocchi attraverso + 
p1 <- ggplot() +
# si deve definire il tipo di geometria (es: geom_point che crea dei punti nel ggplo, geom_line punti connessi tra linee)
# stiamo utilizzando un raster quindi useremo geom_raster
# geom_raster della mappa della PCA
# definiamo l'estetiche attraverso l'argomento mapping definiaimo cosa vogliamo mappare
# avremmo x=x y=y e come riempimento avremo il layer
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
# il pacchetto viridis contine 5 alternative “magma”, “plasma”, “inferno”, “civids”, “mako”, “rocket” e  “turbo”.
# la funzione per usare queste legende è scale_fill_viridis
# possiamo non scrivere niente viene usata l'alternativa di defolt
scale_fill_viridis()  +
# attraverso ggtitle possiamo mettere il titolo
ggtitle("Standard deviation of PC1 by viridis colour scale")

# prendiamo lo stesso codice ma applichiamo l'opzione magma cambiando anche il titolo
p2 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "magma")  +
ggtitle("Standard deviation of PC1 by magma colour scale")

# prendiamo lo stesso codice ma applichiamo l'opzione turbo cambiando anche il titolo
p3 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "turbo")  +
ggtitle("Standard deviation of PC1 by turbo colour scale")

# abbiamo 3 mappe disponibili
# attraverso la funzione grid.arrange possiamo mettere insime più mappe di ggplot
# ogni plot deve essere associato ad un oggetto 
# definiamo il numero di righe nrow=3
grid.arrange(p1, p2, p3, nrow = 1)
#-----------------------------------------------------------------------------
# 11- R code spectral signatures
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
# attraverso la funzione labs definiamo i nomi dell'asse delle x e delle y
ggplot(spectrals , aes(x=band)) + 
    geom_line(aes(y = forest), color = "green")+
    geom_line(aes(y = water), color = "blue", linetype = "dotted")+
    labs(x="band", y="reflectance")
# ----------------------------------------------------------------------
# facciamo un'analisi multiteporale delle firme spettrali utilizzando le immagine defor1 e defor2
# richiamiamo l'immagine defor1
defor1 <- brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
click(defor1, id=T, xy=T, cell=T, type="p", pch=16, col="magenta") 
# selezioniamo 5 pixel 
#    x     y   cell defor1.1 defor1.2 defor1.3
#1 52.5 333.5 102869      214       13       29
#     x     y   cell defor1.1 defor1.2 defor1.3
#1 98.5 331.5 104343      226       17       36
#      x     y   cell defor1.1 defor1.2 defor1.3
#1 132.5 335.5 101521      228        6       31
#      x     y  cell defor1.1 defor1.2 defor1.3
#1 134.5 373.5 74391      219      141      139
#     x     y  cell defor1.1 defor1.2 defor1.3
#1 87.5 381.5 68632      222       16       36
# Faccio la stessa con per defor 2, selezione 5 pixel sulla stessa zona 
# x     y  cell defor2.1 defor2.2 defor2.3
#1 60.5 341.5 97573      189      176      168
#      x     y   cell defor2.1 defor2.2 defor2.3
#1 124.5 334.5 102656      233      127      131
#      x     y  cell defor2.1 defor2.2 defor2.3
#1 134.5 379.5 70401      142      119      113
#      x     y  cell defor2.1 defor2.2 defor2.3
#1 103.5 380.5 69653      209       11       26
#     x     y   cell defor2.1 defor2.2 defor2.3
#1 93.5 334.5 102625      195      153      155
# costruiamo una colonna con i valori di riflettanza per la banda 1, 2 e 3 per IL TEMPO 1 E IL TEMPO 2 
band<-c(1,2,3)
tempo1<-c(214,13,29)
tempo2<-c(189,176,168)
# costruiamo il data frame 
spectralst <- data.frame(band,tempo1,tempo2)
spectralst
#attraverso ggplot plottiamo 
ggplot(spectralst , aes(x=band)) + 
    geom_line(aes(y = tempo1), color = "green")+
    geom_line(aes(y = tempo2), color = "blue")+
    labs(x="band", y="reflectance")
# inseriamo i valori anche del secondo pixel     
band<-c(1,2,3)
tempo1p1<-c(214,13,29)
tempo1p2<-c(226,17,36)
tempo2p1<-c(189,176,168)
tempo2p1<-c(233,127,131)
# aggiugiamo questi valori al data.frame 
spectralst <- data.frame(band,tempo1p1,tempo1p2,tempo2p1,tempo2p2)
# aggiungimao pezzi al ggplot
ggplot(spectralst , aes(x=band)) + 
    geom_line(aes(y = tempo1p1), color = "green", linetype="dotted")+
    geom_line(aes(y = tempo1p2), color = "green", linetype="dotted")+
    geom_line(aes(y = tempo2p1), color = "blue", linetype="dotted")+
      geom_line(aes(y = tempo2p2), color = "blue", linetype="dotted")+
    labs(x="band", y="reflectance")
  
# lavoriamo su immagine presa da earth observatory 
eo<-brick("immagine18.jpg")
plotRGB(eo, 1,2,3, stretch="hist")
click(eo, id=T, xy=T, cell=T, type="p", pch=16, col="magenta")
# selezione tre pixel 
# x     y  cell immagine18.1 immagine18.2 immagine18.3
#1 139.5 351.5 92300            6           31           25
#      x     y   cell immagine18.1 immagine18.2 immagine18.3
#1 157.5 151.5 236318          194          226          223
#      x     y   cell immagine18.1 immagine18.2 immagine18.3
#1 328.5 167.5 224969           42           47           50
band<-c(1,2,3)
pixel1<-c(6,31,25)
pixel2<-c(194,226,223)
pixel3-c(42,47,50)
#costruisco il dataframe 
spectraleo<- data.frame(band,pixel1,pixel2,pixel3)
# plottiamo attraverso ggplot
ggplot(spectraleo , aes(x=band)) + 
    geom_line(aes(y = pixel1), color = "green", linetype="dotted")+
    geom_line(aes(y = pixel2), color = "red", linetype="dotted")+
    geom_line(aes(y = pixel3), color = "blue", linetype="dotted")+  
    labs(x="band", y="reflectance")










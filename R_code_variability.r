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

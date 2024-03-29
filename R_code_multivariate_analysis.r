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




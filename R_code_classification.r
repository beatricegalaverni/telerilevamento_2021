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


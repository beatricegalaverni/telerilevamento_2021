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






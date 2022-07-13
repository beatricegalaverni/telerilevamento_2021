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

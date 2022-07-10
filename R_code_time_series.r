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

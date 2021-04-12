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
# apriamo un multipanel 
par(mfrow=c(2,2))
> plot(lst_2000)
> plot(lst_2005)
> plot(lst_2010)
> plot(lst_2015)
# Creiamo una lista di file con la funzione # list.files
rlist<-list.files(pattern="lst")
# andiamo a vedere che abbiamo ottenuto la lista di file
rlist
# attraverso la funzione lapply apllichiamo la funzione #raster a tutta a lista di file creata in precedenza 
import<-lapply(rlist, raster)
# Creiamo un file unico composto da diversi file raster attraverso funzione #stack
TGr<-stack(import)
# sovrapposzione di 3 immagini tutte insieme 
plotRGB(TGr, 1, 2, 3, stretch="Lin")


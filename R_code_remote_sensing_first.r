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

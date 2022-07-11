# R_code knitr
# utilizziamo il pacchetto knitr per creare un report in R
library(knitr)
setwd("C:/lab/")
# utilizziamo la funzione stitch, il primo argomento è come si chiama il nostro codice, poi il tamplate e il pacchetto da utilizzare 
stitch("R_code_greenlad.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))



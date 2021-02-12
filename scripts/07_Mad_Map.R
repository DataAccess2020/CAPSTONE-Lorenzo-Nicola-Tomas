

capmap<-read.csv(here::here ("dataset", "concap.csv"))
capmap<-dplyr::filter(capmap, capmap$ContinentName == "Europe")
capmap<- dplyr::rename(capmap, state = CountryName)

techmap<-merge(capmap, techn, by = "state")

#Load the library
install.packages("mapdata")
install.packages("maptools")
library("ggmap")
library(mapdata)
library(maptools)







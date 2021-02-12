library("ggmap")
library(mapdata)
library(maptools)
install.packages("rgeos")
install.packages('rnaturalearth')
install.packages('rnaturalearthdata')
library(rnaturalearth)
library(rnaturalearthdata)
library(rgeos)

capmap<-read.csv(here::here ("dataset", "concap.csv"))
capmap<-dplyr::filter(capmap, capmap$ContinentName == "Europe")
capmap<- dplyr::rename(capmap, state = CountryName)

techmap<-merge(capmap, techn, by = "state")

#europe map-----

world <- ne_countries(scale = "medium", returnclass = "sf")
Europe <- world[which(world$continent == "Europe"),]
EU<-ggplot(Europe) +
  geom_sf() +
  coord_sf(xlim = c(-25,50), ylim = c(35,70), expand = FALSE)


Map1<-EU + geom_point(aes(x = CapitalLongitude, y = CapitalLatitude), data = techmap, size = 2.5) + 
  theme(legend.position="bottom")
ggplotly(Map1)





rm(concap, europe, view_cabinet)







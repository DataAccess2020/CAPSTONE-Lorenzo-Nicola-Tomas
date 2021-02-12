library("ggmap")
library(mapdata)
library(maptools)
library(rnaturalearth)
library(rnaturalearthdata)

capmap<-read.csv(here::here ("dataset", "concap.csv"))
capmap<-dplyr::filter(capmap, capmap$ContinentName == "Europe")
capmap<- dplyr::rename(capmap, state = CountryName)

techmap<-merge(capmap, techn, by = "state")

#europe map-----

world <- ne_countries(scale = "medium", returnclass = "sf")
Europe <- world[which(world$continent == "Europe"),]
ggplot(Europe) +
  geom_sf() +
  coord_sf(xlim = c(-25,50), ylim = c(35,70), expand = FALSE)






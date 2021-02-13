library("ggmap")
library(mapdata)
library(maptools)
#install.packages("rgeos")
#install.packages('rnaturalearth')
#install.packages('rnaturalearthdata')
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

N<-c(3,3,3,2,2,3,3,3,5,5,5,5,5,1,3,3,3,2,2,5,5,5,5,5)
N<-as.data.frame(N)
N<-tibble::rowid_to_column(N, "ID")
techmap<-tibble::rowid_to_column(techmap, "ID")
techmap<-merge(N,techmap, by= "ID")




Map1<-EU + geom_point(aes(x = CapitalLongitude, y = CapitalLatitude, label=state, label2=N, label3=tot_days), data = techmap, size = 2.5) + 
  theme(legend.position="bottom")
ggplotly(Map1)







rm(concap, europe, view_cabinet)







summary(italy$tot_days)

summary(italy$real_days)

summary(italy$crisis_days)



count(italy, outcomes)

ggpie<- data.frame(group= c("Constitutional Referendum", "Early Election", "End Legislature", "Majority Changed", "Majority Confirmed", "Technocratic Gov."), value=c(1, 11, 6, 21, 23, 3))


dev.off()
# Basic piechart
ggplot(ggpie, aes(x="", y=value, fill=group)) +
  geom_bar(stat="identity", color="white") +
  coord_polar("y", start=0) +
  theme_void() # remove background, grid, numeric labels

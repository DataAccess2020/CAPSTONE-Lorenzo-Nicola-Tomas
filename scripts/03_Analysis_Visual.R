summary(italy$tot_days)

summary(italy$real_days)

summary(italy$crisis_days)



conta <- count(italy, outcomes) 
conta

dev.off()
# Basic piechart
ggplot(conta, aes(x="", y=n, fill=outcomes)) +
  geom_bar(stat="identity", color="white") +
  coord_polar("y", start=0) +
  theme_void() # remove background, grid, numeric labels



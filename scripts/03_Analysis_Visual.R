summary(italy$tot_days)

summary(italy$real_days)

summary(italy$crisis_days)

sum(italy$crisis_days)

stargazer(italy$tot_days, type = 'latex')

conta <- count(italy, outcomes) 
conta

dev.off()

# Basic piechart
ggplot(conta, aes(x="", y=n, fill=outcomes)) +
  geom_bar(stat="identity", color="white") +
  coord_polar("y", start=0) +
  theme_void() # remove background, grid, numeric labels

#Time line days.

time_line2 <- ggplot(italy, aes(x = start_date, y = real_days)) +
  geom_line(color = "orange") + 
  geom_point(color = "black") +
  scale_y_continuous() +
  ggtitle("Government duration during years")+
  ylab("Real days") +
  xlab("Date") + 
  theme_bw() 
ggplotly(time_line2)  

#Crisis Days
g1 <- ggplot(italy, aes(x = ID, y = crisis_days)) +
    geom_bar(stat = "identity", fill = "darkblue") +
    scale_y_continuous() +
    ggtitle("Crisis days")+
    ylab("Days") +
    xlab("")+
    theme_bw()

points_to_label <- c("Dini I", "Monti", "Andreotti V", "Andreotti I", "Ciampi", "Gentiloni")

g2 <- g1 + 
  geom_text(aes(ID,  crisis_days, label = cabinet_name), data = italy[italy$cabinet_name %in% points_to_label, ]) 

ggplotly(g2)  













 



#TECH COMPARISON

#caretakers reasons----

trigger_for_technocracy<- c("post-communism transition","post-communism transition", "global debt crisis","global debt crisis", "post-communism transition", "internal reasons", "internal reasons", "internal reasons", "internal reasons", "global debt crisis", "global debt crisis", "internal reasons", "internal reasons", "global debt crisis", "internal reasons", "internal reasons", "global debt crisis", "internal reasons", "internal reasons", "post-communism transition","post-communism transition","post-communism transition","post-communism transition","post-communism transition")
trigger_for_technocracy<-as.data.frame(trigger_for_technocracy)

techn<-arrange(techn,(state))

trigger_for_technocracy<-tibble::rowid_to_column(trigger_for_technocracy, "ID")
techn<-tibble::rowid_to_column(techn, "ID")
techn_comp<-merge(trigger_for_technocracy, techn, by="ID")

contaplot <- trigger_for_technocracy %>%
  group_by(trigger_for_technocracy) %>%
  summarise(count=n())

cols <- c("internal reasons"="gold1","post-communism transition"="firebrick2", "global debt crisis"="dodgerblue2")

plottacont <- ggplot(contaplot, aes(x=reorder(trigger_for_technocracy,-count),y=count, fill = trigger_for_technocracy)) +  
  geom_bar(stat = "identity") +
  xlab(" ") +
  ylab(" ") +
  ggtitle("Caretaking triggers") +
  scale_fill_manual(values = cols)

plottacont

ggplotly(plottacont)



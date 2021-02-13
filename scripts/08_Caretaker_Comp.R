#TECH COMPARISON


 
trigger_for_technocracy<- c("post-communism transition","post-communism transition", "global debt crisis","global debt crisis", "post-communism transition", "internal reasons", "internal reasons", "internal reasons", "internal reasons", "global debt crisis", "global debt crisis", "internal reasons", "internal reasons", "global debt crisis", "internal reasons", "internal reasons", "global debt crisis", "internal reasons", "internal reasons", "post-communism transition","post-communism transition","post-communism transition","post-communism transition","post-communism transition")
trigger_for_technocracy<-as.data.frame(trigger_for_technocracy)

techn<-arrange(techn,(state))

trigger_for_technocracy<-tibble::rowid_to_column(trigger_for_technocracy, "ID")
techn<-tibble::rowid_to_column(techn, "ID")
techn_comp<-merge(trigger_for_technocracy, techn, by="ID")


ggplot(techn_comp, aes(x =techn_comp$trigger_for_technocracy)) + geom_bar(alpha = 0.2, col = "black") +  theme_bw()

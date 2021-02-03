#Removing errors and merging by ID

ita_gov<-subset(cabinet_ita, prime_minister %in% 1)
ita_govs<-subset(ita_gov, cabinet_name != "De Gasperi I" & cabinet_name != "Letta II")

ita_govs<-tibble::rowid_to_column(ita_govs, "ID")
end_gov<-tibble::rowid_to_column(end_gov, "ID")

ita_governments<- merge(ita_govs,end_gov,by="ID") 


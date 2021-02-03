#Removing errors and merging by ID

ita_gov<-subset(cabinet_ita, prime_minister %in% 1)
ita_govs<-subset(ita_gov, cabinet_name != "De Gasperi I" & cabinet_name != "Letta II")

ita_govs<-tibble::rowid_to_column(ita_govs, "ID")
end_gov<-tibble::rowid_to_column(end_gov, "ID")

ita_governments<- merge(ita_govs,end_gov,by="ID") 

#removing useless variables

govs_ita= subset(ita_governments, select = -c(country_name_short, country_name, party_name_english,country_id, election_id, cabinet_id, previous_cabinet_id, party_id,left_right, party_name_short, cabinet_party,prime_minister))

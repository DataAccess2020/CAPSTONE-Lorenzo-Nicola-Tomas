#Removing errors and merging by ID

ita_gov<-subset(cabinet_ita, prime_minister %in% 1)
ita_govs<-subset(ita_gov, cabinet_name != "De Gasperi I" & cabinet_name != "Letta II")

ita_govs<-tibble::rowid_to_column(ita_govs, "ID")
end_gov<-tibble::rowid_to_column(end_gov, "ID")

ita_governments<- merge(ita_govs,end_gov,by="ID") 

#removing useless variables

govs_ita= subset(ita_governments, select = -c(country_name_short, country_name, party_name_english,country_id, election_id, cabinet_id, previous_cabinet_id, party_id,left_right, party_name_short, cabinet_party,prime_minister))

#managment dataframe: gov_lenght_ita
#playing whith dates

str(gov_length_df) #chech format variables

annoying <- c(gov_length_df$`Data di termine[3]`)
annoying
gov_length_df$`Data di termine[3]` <- as.Date(annoying, format =  "%d %B %Y")

gov_length_df <- subset(gov_length_df, select = -c(N.))

gov_length_df <- gov_length_df[order(gov_length_df$`Data di termine[3]`), ]

gov_length_df<-tibble::rowid_to_column(gov_length_df, "ID")

data_frame <- merge(govs_ita,gov_length_df,by="ID") 

data_frame <- subset(data_frame, select = -c(Governo, government_list, resignations, `Periodo di carica`))

data_frame[data_frame$ID == 49, "caretaker"] <- 1 #Ciampi was a technical gov. 







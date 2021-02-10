#checking dataset

str(techn) 

summary(techn$tot_days)
summary(techn$tech_percentage)


gov_type_count <- count(techn, gov_type) 
gov_type_count

tech_minister <- count(techn, tec_economy_min)
tech_minister

state_count <- count(techn, state)
state_count


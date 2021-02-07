italy$outcomes <- 0
italy[italy$ID == 1, "outcomes"]<-"First Gov"

italy[italy$ID == 2 | italy$ID == 5 | italy$ID == 6 | italy$ID == 8 | italy$ID == 9 | italy$ID == 11 | italy$ID == 15 | 
        italy$ID == 16 | italy$ID == 20 | italy$ID == 21 | italy$ID == 26 | italy$ID == 30 |italy$ID == 34 | italy$ID == 38 |
        italy$ID == 40 | italy$ID == 41 |italy$ID == 43 | italy$ID == 46 | italy$ID == 47 |italy$ID == 55 |italy$ID == 58 | italy$ID == 63 | 
        italy$ID == 64, "outcomes"] <- "Majority Confirmed"

italy[italy$ID == 3 | italy$ID == 10 | italy$ID == 12 | italy$ID == 14 | italy$ID == 17 | 
        italy$ID == 19 | italy$ID == 23 | italy$ID == 24 | italy$ID == 25 | italy$ID == 27 | italy$ID == 29 | italy$ID == 31 |
        italy$ID == 32 | italy$ID == 35 | italy$ID == 37 | italy$ID == 39 |italy$ID == 44 |italy$ID == 48 |
        italy$ID == 54 | italy$ID == 56 | italy$ID == 66, "outcomes"] <- "Majority Changed"

italy[italy$ID == 7 | italy$ID == 13 | italy$ID == 18 | italy$ID == 22 | italy$ID == 42 | 
        italy$ID == 49, "outcomes"] <- "End Legislature"

italy[italy$ID == 28 | italy$ID == 33 | italy$ID == 36 | italy$ID == 45 | italy$ID == 51 | 
        italy$ID == 53 | italy$ID == 57 | italy$ID == 59 | italy$ID == 60 | italy$ID == 62 |
        italy$ID == 65, "outcomes"] <- "Early Election"

italy[italy$ID == 50 | italy$ID == 52 | italy$ID == 61, "outcomes" ] <- "Technocratic Gov."

italy[italy$ID == 4, "outcomes"] <- "Constitutional Referendum"


        



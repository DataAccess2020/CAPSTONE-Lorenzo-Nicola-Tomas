setwd("/Users/tomasruzza/Documents/Projects/R/Data Access/CAPSTONE-Lorenzo-Nicola-Tomas/dataset")

cabinet_dataset <- rio::import("view_cabinet.csv")

cabinet_ita <- filter(cabinet_dataset,
                      country_name == "Italy")

government_list <- vector(mode = "list", length = 68)

#For building -----
url <- "https://it.wikipedia.org/wiki/Governo_De_Gasperi_I"
base_url <-"https://it.wikipedia.org" 

name_gov <- read_html(url) %>% 
            html_node("span+ span a") %>% 
            html_attr("href")
name_gov
name_gov <- read_html(str_c(base_url,name_gov)) %>% 
            html_node("span+ span a") %>% 
            html_attr("href")
name_gov

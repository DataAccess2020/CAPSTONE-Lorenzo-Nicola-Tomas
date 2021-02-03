##setwd("/Users/tomasruzza/Documents/Projects/R/Data Access/CAPSTONE-Lorenzo-Nicola-Tomas/dataset")

cabinet_dataset <- rio::import(here::here("dataset/", "view_cabinet.csv"))  #importing dataset

cabinet_ita <- filter(cabinet_dataset,
                      country_name == "Italy") #filtering dataset



#For building -----

url <- "https://it.wikipedia.org/wiki/Governo_De_Gasperi_I"
base_url <-"https://it.wikipedia.org" 

#Getting first link

name_gov <- read_html(url) %>% 
            html_node("span+ span a") %>% 
            html_attr("href")
name_gov 

#Getting all links

government_list <- vector(mode = "list", length = 66) #empty vector  
#2 to 66 'cause we already have the first link which will be put in his position
#after the loop for praticity reasons

for(i in 2:66){
government_list[i] <- name_gov <- read_html(str_c(base_url,name_gov)) %>% 
            html_node("span+ span a") %>% 
            html_attr("href")
            Sys.sleep(1)
}

government_list[[1]] <- "https://it.wikipedia.org/wiki/Governo_De_Gasperi_I"

#Wikipedia gave us links that aren't usable to download the html files.
#Let's build them and than download.

for(z in 2:66){
 government_list[[z]] <- paste0(base_url, government_list[[z]])
}


for(y in 1:66){
  download.file(government_list[[y]], destfile = here::here("download/", str_c("page", y, ".html")))
  Sys.sleep(1)
}

#To take the dates of resignations for each government we do the same we already did
#to get the links

resignations <- vector(mode = "list", length = 66)

for(it in 1:66){
resignations[it ]<- read_html(here::here("download/", str_c("page", it, ".html"))) %>% 
  html_node(".sinottico tr:nth-child(8) td") %>% 
  html_text()
}

end_gov <- tibble(government_list, resignations)
here::here("dataset/", rio::export(end_gov, "Resignations_date.csv"))



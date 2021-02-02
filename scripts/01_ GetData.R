setwd("/Users/tomasruzza/Documents/Projects/R/Data Access/CAPSTONE-Lorenzo-Nicola-Tomas/dataset")

cabinet_dataset <- rio::import("view_cabinet.csv")

cabinet_ita <- filter(cabinet_dataset,
                      country_name == "Italy")

government_list <- vector(mode = "list", length = 66)

#For building -----
url <- "https://it.wikipedia.org/wiki/Governo_De_Gasperi_I"
base_url <-"https://it.wikipedia.org" 

name_gov <- read_html(url) %>% 
            html_node("span+ span a") %>% 
            html_attr("href")
name_gov

for(i in 2:66){
government_list[i] <- name_gov <- read_html(str_c(base_url,name_gov)) %>% 
            html_node("span+ span a") %>% 
            html_attr("href")
}
government_list[[1]] <- "https://it.wikipedia.org/wiki/Governo_De_Gasperi_I"

for(z in 2:66){
 government_list[[z]] <- paste0("https://it.wikipedia.org", government_list[[z]])
}

setwd("./download")

for(y in 1:66){
  download.file(government_list[[y]], destfile = str_c("page", y, ".html"))
  
  Sys.sleep(1)
}

dimissions <- vector(mode = "list", length = 66)

for(it in 1:66){
dimissions[it ]<- read_html(str_c("page", it, ".html")) %>% 
  html_node(".sinottico tr:nth-child(8) td") %>% 
  html_text()
}

end_gov <- tibble(government_list, dimissions)



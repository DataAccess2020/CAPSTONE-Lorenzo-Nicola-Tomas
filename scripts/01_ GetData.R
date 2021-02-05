##setwd("/Users/tomasruzza/Documents/Projects/R/Data Access/CAPSTONE-Lorenzo-Nicola-Tomas/dataset")

cabinet_dataset <- rio::import(here::here("dataset/", "view_cabinet.csv"))  #importing dataset

cabinet_ita <- filter(cabinet_dataset,
                      country_name == "Italy") #filtering dataset

here::here("dataset", rio::export(cabinet_ita, "Gov_Ita.csv"))


#For building -----

base_url <-"https://it.wikipedia.org"
url2 <- "https://it.wikipedia.org/wiki/Governo_Parri"

#Getting first link

name_gov2 <- read_html(url2) %>% 
  html_node("span+ span a") %>% 
  html_attr("href")
name_gov2
#Getting all links

government_list <- vector(mode = "list", length = 66) #empty vector  
#2 to 66 'cause we already have the first link which will be put in his position
#after the loop for praticity reasons

for(i in 1:66){
government_list[i] <- name_gov2 <- read_html(str_c(base_url,name_gov2)) %>% 
            html_node("span+ span a") %>% 
            html_attr("href")

            Sys.sleep(1)
}


#Wikipedia gave us links that aren't usable to download the html files.
#Let's build them and than download.

for(z in 1:66){
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
here::here("dataset", rio::export(end_gov, "Resignations_date.csv"))

url_length<- "https://it.wikipedia.org/wiki/Governi_italiani_per_durata"

download.file(url_length, destfile = here::here("download/", "GL.html"))

gov_length<-read_html(here::here("download/", "GL.html")) %>% html_nodes(xpath = '//*[@id="mw-content-text"]/div[1]/div[3]/table')%>%
  html_table(fill = TRUE)

gov_length_df<-gov_length[[1]]

#deleting variable that are no longer useful
#rm('ita_gov', 'ita_governments', 'ita_govs', 'resignations', 'gov_length', 'end_gov', 'cabinet_ita', 'cabinet_dataset')


download.file("https://www.corriere.it/dataroom-milena-gabanelli/crisi-governo-66-esecutivi-75-anni-quanto-ci-costa-instabilita-politica-renzi-conte/4335b5f2-58d5-11eb-9753-e0ea6e647f4a-va.shtml", destfile = "report_corriere.html")



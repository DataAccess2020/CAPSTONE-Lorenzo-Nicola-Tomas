library("RCurl")
library("tidyverse")
library("rvest")
library("stringr")

url <- URLencode("https://www.spiegel.de/")
download.file("https://www.spiegel.de/thema/regierungskrise_in_italien", destfile = "SpiegelItalien.html")

#links ----
link_to_pages <- str_c("https://www.spiegel.de/thema/regierungskrise_in_italien/p", 1:9, "/")


for (i in seq_along(link_to_pages)) {
  download.file(url = link_to_pages[i], destfile = here::here("download/Newspapers/Spiegel", str_c("page", i, ".html")))
  Sys.sleep(1)
}

storage <-vector(mode = "list", length = 513)
storage2 <-vector(mode = "list", length = 513)
links <-  rep(list(vector(mode ="list", length = 20)), 9)

for(x in seq_along(links)){
  
storage[[x]]<- read_html(here::here("download/Newspapers/Spiegel", str_c("page", x, ".html", sep = ""))) %>% 
  html_nodes(".block") %>% 
  html_attr("href")

storage2[[x]] <- na.omit(storage[[x]][storage[[x]] != " "]) 
links_df <- (unique(storage2[[x]]))
links[[x]][1:20] <- links_df[1:20]

}

#there are some more links into the sublist 9. In this sublist there are the links
#contained into last page, 12 exactly, and 8 more links that are to others web pages
#which ones we don't care. So, let's manually removed those useless links.
links[[9]][13:20] <- NA
links <- unlist(links)
links <- na.omit(links)
links

for (i in seq_along(links)) {
  download.file(url = links[i], destfile = here::here("download/Newspapers/Spiegel/articles", str_c("art", i, ".html")))
  Sys.sleep(1)
}

title <- rep(list(vector(mode ="list", length = 20)), 9)
description <- rep(list(vector(mode ="list", length = 20)), 9)
text <- rep(list(vector(mode ="list", length = 20)), 9)

for(z in 1:172){
  title[[z]] <- read_html(here::here("download/Newspapers/Spiegel/articles",str_c("art" ,z, ".html"))) %>% 
    html_nodes(".sm\\:text-4xl") %>% 
    html_text()
  description[[z]] <- read_html(here::here("download/Newspapers/Spiegel/articles",str_c("art" ,z, ".html"))) %>%  
    html_nodes("#Inhalt .md\\:mb-32") %>% 
    html_text()
  text[[z]] <- read_html(here::here("download/Newspapers/Spiegel/articles",str_c("art" ,z, ".html"))) %>% 
    html_nodes(".word-wrap") %>% 
    html_text()
}

regierungskrise <- tibble(title, description, text)
str_remove_all(regierungskrise$title, pattern = "\\n")

regierungskrise$description
str_remove_all(regierungskrise$description, pattern = "\\\\n") %>% 
  str_remove_all(pattern = "\\\\")

regierungskrise$text
str_remove_all(regierungskrise$text, pattern = "\\\\n")

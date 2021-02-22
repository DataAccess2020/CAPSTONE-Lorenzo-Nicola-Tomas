#TIBBLES---
##GUARDIAN MONTI

title <-vector(mode ="list", length = 5)
description <-vector(mode ="list", length = 5)
text <-vector(mode ="list", length = 5)

for(z in 1:5){
  title[[z]] <- read_html(here::here("download/Newspapers/Guardian/Monti",str_c("GM" ,z, ".html"))) %>% 
    html_nodes(".css-dxy9hs") %>% 
    html_text()
  description[[z]] <- read_html(here::here("download/Newspapers/Guardian/Monti",str_c("GM" ,z, ".html"))) %>%  
    html_nodes(xpath = "/html/body/section[1]/div/div/div[5]/div/div") %>% 
    html_text()
  text[[z]] <- read_html(here::here("download/Newspapers/Guardian/Monti",str_c("GM" ,z, ".html"))) %>% 
    html_nodes(".css-1ikqjzp") %>% 
    html_text()
}

GuardianMonti <- tibble(title, description, text)
#############################################################################
##GUARDIAN DRAGHI

title <- vector(mode ="list", length = 10)
description <- vector(mode ="list", length = 10)
text <- vector(mode ="list", length = 10)
                                            
for(z in 1:10){
    title[[z]] <- read_html(here::here("download/Newspapers/Guardian/Draghi",str_c("GD" ,z, ".html"))) %>% 
    html_nodes(".css-dxy9hs") %>% 
    html_text()
    description[[z]] <- read_html(here::here("download/Newspapers/Guardian/Draghi",str_c("GD" ,z, ".html"))) %>%  
    html_nodes(xpath = "/html/body/section[1]/div/div/div[5]/div/div") %>% 
    html_text()
    text[[z]] <- read_html(here::here("download/Newspapers/Guardian/Draghi",str_c("GD" ,z, ".html"))) %>% 
    html_nodes(".css-1ikqjzp") %>% 
    html_text()
                                  }

##fixing n2
description[[2]]<-read_html("https://www.theguardian.com/world/2021/jan/18/conte-battles-for-his-coalitions-survival-over-covid-recovery-plan")%>%
                   html_nodes(xpath= "/html/body/section[1]/div/div/div[5]/div/div/p")%>% html_text()

text[[2]]<-read_html("https://www.theguardian.com/world/2021/jan/18/conte-battles-for-his-coalitions-survival-over-covid-recovery-plan")%>%
  html_nodes(xpath = "/html/body/section[1]/div/div/div[9]")%>% html_text()

title[[2]]<-read_html("https://www.theguardian.com/world/2021/jan/18/conte-battles-for-his-coalitions-survival-over-covid-recovery-plan")%>%
  html_nodes(css = ".css-13n7o1j")%>% html_text()

##fixing n7
description[[7]]<-read_html("https://www.theguardian.com/world/2021/feb/02/italian-president-sergio-mattarella-to-seek-a-high-profile-government")%>%
  html_nodes(xpath= "/html/body/section[1]/div/div/div[5]/div/div/p")%>% html_text()

text[[7]]<-read_html("https://www.theguardian.com/world/2021/feb/02/italian-president-sergio-mattarella-to-seek-a-high-profile-government")%>%
  html_nodes(xpath = "/html/body/section[1]/div/div/div[9]")%>% html_text()

title[[7]]<-read_html("https://www.theguardian.com/world/2021/feb/02/italian-president-sergio-mattarella-to-seek-a-high-profile-government")%>%
  html_nodes(css = ".css-13n7o1j")%>% html_text()


##fixing n9

title[[9]]<-read_html("https://www.theguardian.com/commentisfree/2021/feb/04/the-guardian-view-on-mario-draghi-the-right-man-for-italy-for-now")%>%
  html_nodes(css = ".css-i6hzzh")%>% html_text()

##as tibble
GuardianDraghi <- tibble(title, description, text)

#########################################################################################################

##LEMONDE MONTI
title <-vector(mode ="list", length = 5)
description <-vector(mode ="list", length = 5)
text <-vector(mode ="list", length = 5)

for(z in 1:5){
  title[[z]] <- read_html(here::here("download/Newspapers/LeMonde/Monti",str_c("LMM" ,z, ".html"))) %>% 
    html_nodes(xpath = '//*[@id="habillagepub"]/section/header/div/div/h1') %>% 
    html_text()
  description[[z]] <- read_html(here::here("download/Newspapers/LeMonde/Monti",str_c("LMM" ,z, ".html"))) %>%  
    html_nodes(".article__desc") %>% 
    html_text()
  text[[z]] <- read_html(here::here("download/Newspapers/LeMonde/Monti",str_c("LMM" ,z, ".html"))) %>% 
    html_nodes(".article__paragraph") %>% 
    html_text()
}

#fixing n4
title[[4]]<-read_html("https://www.lemonde.fr/idees/article/2011/11/16/et-si-l-italie-de-mario-monti-sauvait-l-europe_1604498_3232.html")%>%
  html_nodes(css = ".article__title--opinion")%>% html_text()

#as tibble
LeMondeMonti <- tibble(title, description, text)

#########################################################################################################################################################à

##LEMONDE DRAGHI
title <-vector(mode ="list", length = 5)
description <-vector(mode ="list", length = 5)
text <-vector(mode ="list", length = 5)

for(z in 1:5){
  title[[z]] <- read_html(here::here("download/Newspapers/LeMonde/Draghi",str_c("LMD" ,z, ".html"))) %>% 
    html_nodes(xpath = '//*[@id="habillagepub"]/section/header/div/div/h1') %>% 
    html_text()
  description[[z]] <- read_html(here::here("download/Newspapers/LeMonde/Draghi",str_c("LMD" ,z, ".html"))) %>%  
    html_nodes(".article__desc") %>% 
    html_text()
  text[[z]] <- read_html(here::here("download/Newspapers/LeMonde/Draghi",str_c("LMD" ,z, ".html"))) %>% 
    html_nodes(".article__paragraph") %>% 
    html_text()
}



#fixing n1
title[[1]]<-read_html("https://www.lemonde.fr/idees/article/2021/02/06/mario-draghi-le-pari-politique-de-l-italie_6069013_3232.html"
)%>%
  html_nodes(css = ".article__title--opinion")%>% html_text()
#fixing n5
title[[5]]<-read_html("https://www.lemonde.fr/idees/article/2019/03/04/mario-draghi-l-europe-la-souverainete-et-la-mondialisation_5431074_3232.html")%>%
  html_nodes(xpath = '//*[@id="Longform"]/section[2]/h1')%>% html_text()

#as tibble
LeMondeDraghi <- tibble(title, description, text)

#########################################################################################################################################################################à


##BBC DRAGHI

title <-vector(mode ="list", length = 5)
description <-vector(mode ="list", length = 5)
text <-vector(mode ="list", length = 5)

for(z in 1:5){
  title[[z]] <- read_html(here::here("download/Newspapers/BBC/Draghi",str_c("BBD" ,z, ".html"))) %>% 
    html_nodes("#main-heading") %>% 
    html_text()
  description[[z]] <- read_html(here::here("download/Newspapers/BBC/Draghi",str_c("BBD" ,z, ".html"))) %>%  
    html_nodes(xpath = '//*[@id="main-content"]/div[5]/div/div[1]/article/div[2]/div/p/b') %>% 
    html_text()
  text[[z]] <- read_html(here::here("download/Newspapers/BBC/Draghi",str_c("BBD" ,z, ".html"))) %>% 
    html_nodes(".e5tfeyi2 p") %>% 
    html_text()
}

#as tibble
BBCDraghi <- tibble(title, description, text)

###########################################################################################################################################

##BBC MONTI

title <-vector(mode ="list", length = 5)
description <-vector(mode ="list", length = 5)
text <-vector(mode ="list", length = 5)

for(z in 1:5){
  title[[z]] <- read_html(here::here("download/Newspapers/BBC/Monti",str_c("BBM" ,z, ".html"))) %>% 
    html_nodes("#main-heading") %>% 
    html_text()
  description[[z]] <- read_html(here::here("download/Newspapers/BBC/Monti",str_c("BBM" ,z, ".html"))) %>%  
    html_nodes(xpath = '//*[@id="main-content"]/div[5]/div/div[1]/article/div[2]/div/p/b') %>% 
    html_text() 
  text[[z]] <- read_html(here::here("download/Newspapers/BBC/Monti",str_c("BBM" ,z, ".html"))) %>% 
    html_nodes(".e5tfeyi2 p") %>% 
    html_text()
}

#as tibble
BBCMonti <- tibble(title, description, text)

#####################################################################################################################

#environment cleaning

rm(contaplot,description,plottacont,tech_tabl4, tech_table2, techmap, techn, text, title, trigger_for_technocracy)

 
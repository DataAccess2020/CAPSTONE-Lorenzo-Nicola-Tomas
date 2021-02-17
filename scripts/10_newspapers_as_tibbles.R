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
 
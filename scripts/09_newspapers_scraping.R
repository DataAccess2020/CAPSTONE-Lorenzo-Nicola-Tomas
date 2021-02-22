library("RCurl")
library("tidyverse")
library("rvest")
library("stringr")
#NEWSPAPERS SCRAPING----
##guardian monti
gm <- vector(mode= "list", length = 5)

gm[1]<-"https://www.theguardian.com/business/blog/2012/may/30/mario-monti-italy-austerity"
gm[2]<-"https://www.theguardian.com/business/2011/nov/29/euro-italy-insolvency-warning-finance-ministers"
gm[3]<-"https://www.theguardian.com/world/2011/nov/13/mario-monti-new-era-italy"
gm[4]<-"https://www.theguardian.com/world/2011/nov/11/markets-italy-applaud-mario-monti"
gm[5]<-"https://www.theguardian.com/business/2011/nov/14/italy-borrowing-costs-highest-euro"

for (i in 1:5) {
  download.file(url = gm[[i]], destfile = str_c("GM", i, ".html"))
}

##GUARDIAN DRAGHI

GD<-vector(mode = "list", length = 10)

GD[1]<-"https://www.theguardian.com/world/2021/jan/14/italians-angry-and-perplexed-as-government-teeters"
GD[2]<-"https://www.theguardian.com/world/2021/jan/18/conte-battles-for-his-coalitions-survival-over-covid-recovery-plan"
GD[3]<-"https://www.theguardian.com/world/2021/jan/13/italy-facing-fresh-elections-after-ex-pm-withdraws-party-from-coalition"
GD[4]<-"https://www.theguardian.com/world/2021/jan/04/italian-coalition-government-pressure-covid-economic-recovery-plan-giuseppe-conte-matteo-renzi"
GD[5]<-"https://www.theguardian.com/world/2021/feb/13/mario-draghi-sworn-in-as-prime-minister-of-italy"
GD[6]<-"https://www.theguardian.com/world/2021/feb/06/mario-draghi-secures-support-from-key-parties-to-form-new-italian-government"
GD[7]<-"https://www.theguardian.com/world/2021/feb/02/italian-president-sergio-mattarella-to-seek-a-high-profile-government"
GD[8]<-"https://www.theguardian.com/business/2021/feb/03/enter-the-draghi-can-super-mario-save-italy-as-he-did-the-euro"
GD[9]<-"https://www.theguardian.com/commentisfree/2021/feb/04/the-guardian-view-on-mario-draghi-the-right-man-for-italy-for-now"
GD[10]<-"https://www.theguardian.com/world/2021/feb/03/mario-draghi-accepts-mandate-to-form-new-italian-government"

for (i in 1:10) {
  download.file(url = GD[[i]], destfile = str_c("GD", i, ".html"))
}
##LEMONDE MONTI

LMM<-vector(mode = "list", length = 5)

LMM[1]<-"https://www.lemonde.fr/europe/article/2011/11/14/ave-mario_1603444_3214.html"
LMM[2]<-"https://www.lemonde.fr/economie/article/2013/06/17/paul-krugman-et-mario-monti-la-crise-pousse-l-europe-vers-l-union-politique_3431386_3234.html"
LMM[3]<-"https://www.lemonde.fr/europe/article/2011/11/14/l-arrivee-de-mario-monti-a-la-tete-du-gouvernement-italien-devrait-rassurer-les-marches_1603204_3214.html"
LMM[4]<-"https://www.lemonde.fr/idees/article/2011/11/16/et-si-l-italie-de-mario-monti-sauvait-l-europe_1604498_3232.html"
LMM[5]<-"https://www.lemonde.fr/europe/article/2011/11/16/mario-monti-forme-son-gouvernement-et-prend-le-portefeuille-de-l-economie_1604643_3214.html"

for (i in 1:5) {
  download.file(url = LMM[[i]], destfile = str_c("LMM", i, ".html"))
}

##LEMONDE DRAGHI

LMD<-vector(mode = "list", length = 5)

LMD[1]<-"https://www.lemonde.fr/idees/article/2021/02/06/mario-draghi-le-pari-politique-de-l-italie_6069013_3232.html"
LMD[2]<-"https://www.lemonde.fr/international/article/2021/02/02/crise-politique-en-italie-mario-draghi-appele-a-la-rescousse_6068554_3210.html"
LMD[3]<-"https://www.lemonde.fr/international/article/2021/02/13/italie-mario-draghi-prend-la-tete-d-un-gouvernement-qui-veut-concilier-cohesion-efficacite-et-representativite_6069817_3210.html"
LMD[4]<-"https://www.lemonde.fr/international/article/2021/02/03/en-italie-sergio-mattarella-recourt-a-mario-draghi-pour-trouver-une-issue-a-la-crise-politique_6068625_3210.html"
LMD[5]<-"https://www.lemonde.fr/idees/article/2019/03/04/mario-draghi-l-europe-la-souverainete-et-la-mondialisation_5431074_3232.html"

for (i in 1:5) {
  download.file(url = LMD[[i]], destfile = str_c("LMD", i, ".html"))
}


##BBC MONTI
BBM <- vector(mode = "list", length = 5)

BBM[1] <- "https://www.bbc.com/news/business-20766952"
BBM[2] <- "https://www.bbc.com/news/world-europe-20658916"
BBM[3] <- "http://www.bbc.co.uk/news/magazine-15720438"
BBM[4] <- "https://www.bbc.com/news/magazine-15560015"
BBM[5] <- "http://www.bbc.co.uk/news/world-europe-15650828"

for (i in 1:5) {
  download.file(url = BBM[[i]], destfile = str_c("BBM", i, ".html"))
}
##BBC DRAGHI
BBD <- vector(mode = "list", length = 4)

BBD[1] <- "https://www.bbc.com/news/world-europe-55912951"
BBD[2] <-"https://www.bbc.com/news/world-europe-55992264"
BBD[3] <-"https://www.bbc.com/news/world-europe-5591032"
BBD[4] <-"https://www.bbc.com/news/world-europe-56049115"

for (i in 1:5) {
  download.file(url = BBD[[i]], destfile = str_c("BBD", i, ".html"))
}



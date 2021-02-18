#corpus Guardian Draghi-------

#remove links
GuardianDraghi_NOURL <- rm_url(GuardianDraghi)
head(GuardianDraghi_NOURL, 5)

GD_NOSP <- gsub("[^A-Za-z]", " ", GuardianDraghi_NOURL)

#tm library to create corpus
GD_corpus <- GD_NOSP %>%
  VectorSource() %>%
  Corpus()
#character min
GD_min <- tm_map(GD_corpus, tolower)

#deleting stopwords

stopwords('en')  #list of stop words

GD_NONSTOP <- tm_map(GD_min, removeWords, stopwords('en'))

GD_corpus_FIN <- tm_map(GD_NONSTOP, stripWhitespace)

GD_corpus_FIN[[3]]$content




#corpus Guardian Monti-------

#remove links
GuardianMonti_NOURL <- rm_url(GuardianMonti)
head(GuardianMonti_NOURL, 5)

GM_NOSP <- gsub("[^A-Za-z]", " ", GuardianMonti_NOURL)

#tm library to create corpus

GM_corpus <- GM_NOSP %>%
  VectorSource() %>%
  Corpus()

#character min
GM_min <- tm_map(GM_corpus, tolower)

#deleting stopwords

GM_NONSTOP <- tm_map(GM_min, removeWords, stopwords('en'))

GM_corpus_FIN <- tm_map(GM_NONSTOP, stripWhitespace)

GM_corpus_FIN[[3]]$content





#corpus LeMonde Draghi-----
#remove links
LMD_NOURL <- rm_url(LeMondeDraghi)
head(LMD_NOURL, 5)

LMD_NOSP <- gsub("[^A-Za-z]", " ", LMD_NOURL)

#tm library to create corpus

LMD_corpus <- LMD_NOSP %>%
  VectorSource() %>%
  Corpus()

#character min
LMD_min <- tm_map(LMD_corpus, tolower)

#deleting stopwords
stopwords('fr')

LMD_NONSTOP <- tm_map(LMD_min, removeWords, stopwords('fr'))

LMD_corpus_FIN <- tm_map(LMD_NONSTOP, stripWhitespace)

LMD_corpus_FIN[[3]]$content



#corpus LeMonde Monti----
#remove links
LMM_NOURL <- rm_url(LeMondeMonti)
head(LMM_NOURL, 5)

LMM_NOSP <- gsub("[^A-Za-z]", " ", LMM_NOURL)

#tm library to create corpus

LMM_corpus <- LMM_NOSP %>%
  VectorSource() %>%
  Corpus()

#character min
LMM_min <- tm_map(LMM_corpus, tolower)

#deleting stopwords

LMM_NONSTOP <- tm_map(LMM_min, removeWords, stopwords('fr'))

LMM_corpus_FIN <- tm_map(LMM_NONSTOP, stripWhitespace)

LMM_corpus_FIN[[3]]$content





#corpus BBC DRAGHI-----
#remove links
BBCDraghi_NOURL <- rm_url(BBCDraghi)
head(GuardianDraghi_NOURL, 5)

BBD_NOSP <- gsub("[^A-Za-z]", " ", BBCDraghi_NOURL)

#tm library to create corpus
BBD_corpus <- BBD_NOSP %>%
  VectorSource() %>%
  Corpus()
#character min
BBD_min <- tm_map(BBD_corpus, tolower)

#deleting stopwords

BBD_NONSTOP <- tm_map(BBD_min, removeWords, stopwords('en'))

BBD_corpus_FIN <- tm_map(BBD_NONSTOP, stripWhitespace)

BBD_corpus_FIN[[3]]$content


#corpus BBC MONTI-----
#remove links
BBCMonti_NOURL <- rm_url(BBCMonti)
head(BBCMonti_NOURL, 5)

BBM_NOSP <- gsub("[^A-Za-z]", " ", BBCMonti_NOURL)

#tm library to create corpus
BBM_corpus <- BBM_NOSP %>%
  VectorSource() %>%
  Corpus()
#character min
BBM_min <- tm_map(BBM_corpus, tolower)

#deleting stopwords

BBM_NONSTOP <- tm_map(BBM_min, removeWords, stopwords('en'))

BBM_corpus_FIN <- tm_map(BBM_NONSTOP, stripWhitespace)

BBM_corpus_FIN[[3]]$content



rm(BBM_corpus, BBD_min, BBM_NONSTOP, BBM_NOSP,
   BBD_corpus, BBD_min, BBD_NONSTOP, BBM_NOSP,
   LMM_corpus, LMM_min, LMM_NONSTOP, LMM_NOSP,
   LMD_corpus, LMD_min, LMD_NONSTOP, LMD_NOSP,
   GM_corpus, GM_min, GM_NONSTOP, GM_NOSP,
   GD_corpus, GD_min, GD_NONSTOP, GD_NOSP)

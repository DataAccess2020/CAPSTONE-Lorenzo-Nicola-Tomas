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


################################################################################

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



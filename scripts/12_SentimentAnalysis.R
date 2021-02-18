###create a tibble with all newspaper articles
newspapers<-bind_rows(GuardianDraghi,GuardianMonti,BBCMonti,BBCDraghi, ID = NULL)

newspapers_clean<-newspapers[-c(19,20,23,24,25), ]

rm(newspapers,LeMondeDraghi, LeMondeMonti, LMD_corpus_FIN, LMM_corpus_FIN, GD_corpus_FIN, GM_corpus_FIN, BBM_corpus_FIN, BBD_corpus_FIN)
#remove links
news_NOURL <- rm_url(newspapers_clean$text)
head(news_NOURL, 5)

news_NOSP <- gsub("[^A-Za-z]", " ", news_NOURL)
#tm library to create corpus
news_corpus <- news_NOSP %>%
  VectorSource() %>%
  Corpus()
#character min
news_min <- tm_map(news_corpus, tolower)
#deleting stopwords
stopwords('en') #list of stop words
news_NONSTOP <- tm_map(news_min, removeWords, stopwords('en'))
news_corpus_FIN <- tm_map(news_NONSTOP, stripWhitespace)
news_corpus_FIN[[3]]$content

rm(news_NONSTOP, news_min, news_corpus, news_NOSP, news_NOURL)

##putting text as character
newspapers_clean<-as.character(newspapers_clean$text)
sentiments_level<-get_nrc_sentiment(newspapers_clean)
  
####
point <- colSums(sentiments_level[,])
point.df <- data.frame(point)
point.final <- cbind(sentiment = row.names(point.df), point.df)
ggplot(point.final, aes( x= sentiment , y = point, fill = sentiment )) +
  geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 45, hjust=1)) + 
  ylab("Score")+
  xlab("Sentiment/Emotion")+
  ggtitle("General Sentiment Analysis")





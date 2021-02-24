Monti_disco <- read_file(here::here("docs", "Monti_Disco.txt"))
Draghi_disco <- read_file(here::here("docs", "Draghi_Disco.txt"))

#tm library to create corpuses----
Monti_disco_Corpus<- Monti_disco %>%
  VectorSource() %>%
  Corpus()

Draghi_disco_Corpus<- Draghi_disco %>%
  VectorSource() %>%
  Corpus()
#character min
Monti_min<- tm_map(Monti_disco_Corpus, tolower)
Draghi_min<- tm_map(Draghi_disco_Corpus, tolower)
#deleting stopwords
stopwords('it') #list of stop words
#FINAL CORPUS MONTI
Monti_NONSTOP <- tm_map(Monti_min, removeWords, stopwords('it'))
Monti_Corpus <- tm_map(Monti_NONSTOP, stripWhitespace)
#FINAL CORPUS DRAGHI
Draghi_NONSTOP <- tm_map(Draghi_min, removeWords, stopwords('it'))
Draghi_Corpus <- tm_map(Draghi_NONSTOP, stripWhitespace)

#deleting useless objects
rm(Draghi_disco_Corpus, Draghi_min, Draghi_NONSTOP, Monti_disco_Corpus, Monti_min, Monti_NONSTOP)


#ANALYSIS-----
Monti_freq<-freq_terms(Monti_Corpus)
Draghi_freq<-freq_terms(Draghi_Corpus)


#Sentiment Hypotesis 
Monti_disco<-as.character(Monti_disco)
Monti_score<-get_nrc_sentiment(Monti_disco, lang= "italian")
monti_melted <- reshape2::melt(Monti_score)

Draghi_disco<-as.character(Draghi_disco)
Draghi_score<-get_nrc_sentiment(Draghi_disco, lang="italian")
draghi_melted <- reshape2::melt(Draghi_score)

####Plot MONTI

ggplot(monti_melted, aes( x= variable , y = value, fill = variable )) +
  geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 45, hjust=1)) + 
  ylab("Score")+
  xlab("Sentiment/Emotion")+
  ggtitle("Sentiment Analysis Monti")

###Plot DRAGHI

ggplot(draghi_melted, aes( x= variable , y = value, fill = variable )) +
  geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 45, hjust=1)) + 
  ylab("Score")+
  xlab("Sentiment/Emotion")+
  ggtitle("Sentiment Analysis Draghi")

###plotting frequent terms by Monti and Draghi


############
ggplot(Monti_freq, aes(x = reorder(WORD, -FREQ), y = FREQ)) +
  geom_bar(stat = "identity", fill = "cadetblue3") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  xlab("Terms") + ylab("Freq")+ 
  labs(title = "Frequent Terms in discourse by Monti")

ggplot(Draghi_freq, aes(x = reorder(WORD, -FREQ), y = FREQ)) +
  geom_bar(stat = "identity", fill = "darkblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  xlab("Terms") + ylab("Freq")+ 
  labs(title = "Frequent Terms in discourse by Draghi")







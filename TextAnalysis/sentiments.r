#install.packages(c('dplyr', 'purrr', 'tidytext', 'gutenbergr'))
library(dplyr)
library(purrr)
library(tidytext)
library(gutenbergr)

#downloading data

#tidying up data, splitting each word into a row
tidy_dickens <- dickens %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words)

#creating list of words occuring along with their frequency
obs<-tidy_dickens %>%
  group_by(word) %>%
  summarise(n=n())%>%
  arrange(desc(n))

#visualizing frequency of words
barplot(head(obs$n), names.arg = head(obs$word), col="darkblue", horiz=TRUE, las=1, xlim=c(0,350), xlab="Frequency", ylab="Word", main="Most Common Words in 'A Tale of 2 Cities'")

#sentiment analysis
bing_word_counts <- tidy_dickens %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  ungroup()
bing_word_counts

#splitting words based on sentiment
positive_words<-bing_word_counts%>%
  filter(bing_word_counts$sentiment == 'positive')

negative_words<-bing_word_counts%>%
  filter(bing_word_counts$sentiment == 'negative')

#visualizing data
par(mfrow=c(1,2))
barplot(head(positive_words$n, 10), names.arg = head(positive_words$word,10), 
        col="blue", horiz=TRUE, las=1, 
        xlim=c(0,max(positive_words$n)+50), 
        xlab="Frequency",
        main="Positive Words in 'A Tale of 2 Cities'")

barplot(head(negative_words$n, 10), names.arg = head(negative_words$word,10), 
        col="red", horiz=TRUE, las=1, 
        xlim=c(0,max(negative_words$n)+50), 
        xlab="Frequency",  
        main="Negative Words in 'A Tale of 2 Cities'")

# comparing movie ratings scraped from IMDB

#install.packages(c('rvest', 'magittr', 'dplyr', 'ggplot2', 'purrr'))
library(rvest)
library(magittr)
library(dplyr)
library(purrr)

#rating for anna karenina
url_anna<-"https://www.imdb.com/title/tt1781769/"
rating_anna<-url_anna%>%
  read_html()%>%
  html_nodes("strong span")%>% 
  html_text()

#rating for gatsby
url_gatsby<-"https://www.imdb.com/title/tt1343092/"
rating_gatsby<-url_gatsby%>%
  read_html()%>%
  html_nodes("strong span")%>% 
  html_text()

#dataframe for storing ratings
ratings<-data.frame("Movies"=c("Anna Karenina", "Great Gatsby"), "Rating"=c(as.numeric(rating_anna), as.numeric(rating_gatsby)))
ratings

barplot(ratings$Rating, main = "Ratings",xlab = "Movie",ylab = "Rating", names.arg = ratings$Movies, col = "darkred", yaxp=c(0,10,10))


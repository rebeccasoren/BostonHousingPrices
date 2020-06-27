# barplot of nations that have won the world cup 

library(dplyr)
library(htmltab)

url2<-"https://en.wikipedia.org/wiki/List_of_FIFA_World_Cup_winners"
champs<-htmltab(url2, which=1, rm_nodata_cols=F)
champs

barplot(as.numeric(champs$Titles), main = "FIFA Winners",xlab = "Country", ylab = "No. of Wins", names = champs$Team, col = "darkred", las=1)

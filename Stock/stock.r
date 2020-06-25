install.packages('quantmod')
library(quantmod)

# Get Microsoft's Dataset
microsoft<-getSymbols("MSFT", auto.assign=FALSE)

# Extract Daily Stock Returns
microsoft_daily<-dailyReturn(Ad(microsoft))
dim(microsoft_daily)

# Get Facebook's Dataset
facebook<-getSymbols("FB", auto.assign=FALSE)

# Extract Daily Stock Returns
facebook_daily<-dailyReturn(Ad(facebook))
dim(facebook_daily)

# Merge the datasets
data<-merge(microsoft_daily, facebook_daily, all=F)

# Plot the dataset
plot(data$daily.returns, type="l", main="Daily Stock Returns for Microsoft")
plot(data$daily.returns.1, type="l", main="Daily Stock Returns for Facebook")
plot(data, type="l", main="Daily Stock Return")
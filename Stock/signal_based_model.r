# when daily stock percentage crosses a threshold, throw a signal 

#install.packages('quantmod')
library(quantmod)

#pulling down data
tsla<-getSymbols("TSLA", auto.assign=F)
head(tsla)

#store closing price
tsla_cl<-tsla$TSLA.Close
head(tsla_cl)

#converting data to daily percentage change
options(scipen=9999)
daily_change<-tsla_cl/lag(tsla_cl,1) -1
head(daily_change)

#histogram of percentage change
hist(daily_change, 40, col="green")
# based on histogram, we choose a signal
buy_signal<- 0.04

#loop over all trading days and create signal vector
signal<-c(NULL)
for(i in 2:length(tsla_cl)){
  if(daily_change[i]>buy_signal){
    signal[i]<-1
  } else{
    signal[i]<-0
  }
}

#reclass signal vector with days from tsla_cl
signal<-reclass(signal, tsla_cl)

#create chart
chartSeries(tsla_cl, type="l", subset="2019-05::2020-05", name="TESLA")
addTA(signal, type="S", col="red")

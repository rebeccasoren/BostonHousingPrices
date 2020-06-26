install.packages('dplyr')
install.packages('ggplot2')
library(dplyr)
library(ggplot2)

str(mpg)
dim(mpg)
names(mpg)
hist(mpg$cty)

#filter
filter(mpg, cty>25)
filter(mpg, cty>25 & model == "civic") #multiple conditions

#select
select(mpg, manufacturer) #using column name
select(mpg, 7) #column number
select(mpg, c(7,8)) #multiple columns

#pipe
mpg%>%
filter(cty>25)%>%
select(c(7,8))

mpg%>%
select(7,8)%>%
filter(cty<15)

mpg%>%
filter(cty<15)%>%
select(2)

#group by
mpg%>%
group_by(drv)%>%
summarise(n=n(), avgcity=mean(cty, na.rm=T))

#mutate
mpg%>%
group_by(drv)%>%
summarise(n=n(), avgcity=mean(cty, na.rm=T))%>%
mutate(test=n*avgcity) #adds a new column

#arrange
mpg%>%
select(cty)%>%
arrange(cty) #ascending order

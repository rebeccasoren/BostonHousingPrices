#Locate to present working directory
#Importing the dataset
dataset=read.csv('Salary_Data.csv')

#Splitting dataset into Training and Test set
#install.packages('caTools')
library(caTools)
set.seed(90909) # any random number
split=sample.split(dataset$AnnualSalary, SplitRatio=3/4)
training_set=subset(dataset, split ==TRUE)
testing_set= subset(dataset, split==FALSE)

#Fitting simple Linear Regression to the training set
model=lm(formula= AnnualSalary~ YearsOfExperience, data=training_set)
summary(model)

#Predicitng the test_set results
y=predict(model, newdata=testing_set)

#install.packages('scales')
library(scales)

#Visualising training_set results
install.packages('ggplot2')
library(ggplot2)
ggplot()+
geom_point(aes(x=training_set$YearsOfExperience, y=training_set$AnnualSalary), color='red') +
geom_line(aes(x=training_set$YearsOfExperience, y=predict(model, newdata=training_set)), color='navy') +
ggtitle('Annual salaries of employees vs Experience in years') +
xlab('Years of Experience') +
ylab('Annual Salary')
scale_x_continuous(limits=c(0,12))+
scale_y_continuous(limits=c(0,150000))

#Visualising testing_set results
#install.packages('ggplot2')
library(ggplot2)
ggplot()+
geom_point(aes(x=testing_set$YearsOfExperience, y=testing_set$AnnualSalary), color='red') +
geom_line(aes(x=training_set$YearsOfExperience, y=predict(model, newdata=training_set)), color='navy') +
ggtitle('Annual salaries of employees vs Experience in years') +
xlab('Years of Experience') +
ylab('Annual Salary')+
scale_x_continuous(limits=c(0,12))+
scale_y_continuous(limits=c(0,150000))


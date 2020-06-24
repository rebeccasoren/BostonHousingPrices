#Importing the dataset
dataset=read.csv('Admission_Predict.csv')

#Splitting dataset into Training and Test set
install.packages('caTools')
library(caTools)
set.seed(2020) # any random number
split=sample.split(dataset$Chance.of.Admit, SplitRatio=3/4)
training_set=subset(dataset, split ==TRUE)
testing_set= subset(dataset, split==FALSE)

#Fitting simple Linear Regression to the training set
model=lm(Chance.of.Admit~CGPA , data=training_set)
summary(model)

#Visualising Data
ggplot()+
  geom_point(aes(x=training_set$CGPA, y=training_set$Chance.of.Admit), color='red') +
  geom_line(aes(x=training_set$CGPA, y=predict(model, newdata=training_set)), color='navy') +
  ggtitle('Chance of admission vs CGPA') +
  xlab('CGPA') +
  ylab('Chance of Admission')

ggplot()+
  geom_point(aes(x=testing_set$CGPA, y=testing_set$Chance.of.Admit), color='red') +
  geom_line(aes(x=training_set$CGPA, y=predict(model, newdata=training_set)), color='navy') +
  ggtitle('Chance of admission vs CGPA') +
  xlab('CGPA') +
  ylab('Chance of Admission')
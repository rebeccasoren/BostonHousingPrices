#install.packages(c('caret', 'tidyverse', 'mlbench', 'e1071', 'ranger'))
library(caret)
library(tidyverse)
library(mlbench)
library(e1071)
library(ranger)

#loading and visualising data
data("PimaIndiansDiabetes")
df<-PimaIndiansDiabetes
str(df)
?PimaIndiansDiabetes
ggplot(df, aes(diabetes, fill=factor(diabetes))) +
geom_bar()

#adding a new variable binary
df$binary<-ifelse(df$diabetes == "neg", 0, 1)
str(df)

#creating training and test sets
rows<-createDataPartition(df$binary, times=1, p= .7, list=F)
train<-df[rows, -9] #removing diabetes column from both train and test set
test<-df[-rows, -9]

#create a model
control=trainControl(method="repeatedcv", number=2, repeats=2) #number parameter can be set to a higher value for more accurate results
model<-train(as.factor(binary)~., data=train, method="ranger", trControl=control)
model #Accuracy column defines the accuracy of the model

#predicting on test set
predict_train<-predict(model, train)
predict_test<-predict(model, test)

#building confusion matrix to compare results
confusionMatrix(predict_train, as.factor(train$binary))
confusionMatrix(predict_test, as.factor(test$binary))
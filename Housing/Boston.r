#Downloading Packages
install.packages("caret", dependencies=TRUE)
install.packages("ranger", dependencies=TRUE)
install.packages("gbm", dependencies=TRUE)
library(caret)
library(MASS)
#Exploratory Ananlysis
data("Boston")
df<-Boston
str(Boston)
?Boston
hist(df$age, col="green")
summary(df)
#Training and Test Set
#Method 1
rows<-sample(1:nrow(df), nrow(df)*.8, replace=F)
train_base<-df[rows,]
test_base<-df[-rows,]
dim(train_base)
dim(test_base)
#Method 2
rows2<-createDataPartition(df$age, time=1, p=.8, list=F)
training<-df[rows2, ]
testing<-df[-rows2,]
dim(testing)
dim(training)
#Creating Models
model_lm<-train(age~., data=training, method="lm", trControl=trainControl(method="repeatedcv", number=2, repeats=2))
model_rf<-train(age~., data=training, method="ranger", trControl=trainControl(method="repeatedcv", number=2, repeats=2))
model_gbm<-train(age~., data=training, method="gbm", trControl=trainControl(method="repeatedcv", number=2, repeats=2))
#Comparing Models
sample<-resamples(list(Linear=model_lm, Forest=model_rf, GBM<-model_gbm))
bwplot(sample)
dotplot(sample)
summary(sample)
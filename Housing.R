housing<-read.csv("clipboard",sep ='\t', header = T)
str(housing)
sum(is.na(housing))
library(tidyverse)
library(dplyr)
housing[duplicated(housing)]
#drop unwanted columns. We are dropping address
housing1<- housing[,c(1:6)] 
#run linear regression
model<- lm(Price~.,data = housing1)
summary(model)
# Multiple R squred is 0.918 which indicates that independent variables can explain 91.8% change/variation
# in the dependent variable and p value is less than alpha which means it is statistically significant
#check for outliers using IQR method
resid<- residuals(model)
iqr<- IQR(resid)
outliers<- resid < quantile (resid,0.25) - 1.5*iqr | resid > quantile(resid,0.75) + 1.5*iqr 
oultiers_housing<- housing1[outliers,] 
# we found 23 outliers. These outliers need to be removed
outliers_housing<- housing1[!outliers,]
#total observations have reduced from 5000 to 4977 after removing 23 outliers
# run the revised regression

model1<- lm(Price~.,data = outliers_housing)
summary(model1)
# Multiple R squred is 0.921 which indicates that independent variables can explain 92.1% change/variation
# in the dependent variable and p value is less than alpha which means it is statistically significant.
#Except for AreaNumberofBedrooms whose p value is 0.207 which is greater than that of alpha

#check for multicollinearity
library(car)
vif(model1)
# all the variables have absolute values less than 5 so we cannot drop any variable
# This also means that the independent variables are not highly correlated

#split the data into train and test
split<- sample(1:nrow(outliers_housing),0.8*nrow(outliers_housing))
train<- outliers_housing[split,]
test<- outliers_housing[-split,]

#use train data to create the model
predicted_model<- lm(Price~.,data = train)
summary(predicted_model)
# Multiple R squred is 0.921 which indicates that independent variables can explain 92.1% change/variation
# in the dependent variable and p value is less than alpha which means it is statistically significant
# slope represents the rate of change in the dependent variable (price) with the one unit change in the
# independent variable. For eg. with an increase of 1 room in the house, the price will increase
# by 118602. 
#use train model to predict the test data
predicted<- predict(predicted_model, newdata = test)
test$predicted<- predicted

#find out RMSE and MAPE
library(Metrics)
RMSE_housing<- rmse(test$Price,test$predicted)
RMSE_housing
#RMSE is found to be 99886.24

MAPE_housing<- mape(test$Price,test$predicted)
MAPE_housing
#MAPE is found to be 0.07
(accuracy = 1-MAPE_housing)
#model accuracy is 92.45%

head(test[,c("Price","predicted")])
# This shows the six observations of actual price vs predicted price
          
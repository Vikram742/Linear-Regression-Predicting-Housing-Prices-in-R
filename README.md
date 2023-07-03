# Linear-Regression-Predicting-Housing-Prices-in-R
The idea is to predict the prices of the houses in the area through linear regression model. 
Steps :
1) Read the data
2) Checked the data types 
3) Checked for missing values and duplicates
4) Dropped the column address as it is not significant for our analysis
5) Ran Linear Regression
6) Multiple R squared is 0.918 which indicates that independent variables can explain 91.8% change/variation
in the dependent variable and p value is less than alpha which means it is statistically significant
7) Checked for Outliers using IQR method.  23 outliers were found and removed and ran linear regression again
8) Multiple R squred is 0.921 which indicates that independent variables can explain 92.1% change/variation
 in the dependent variable and p value is less than alpha which means it is statistically significant.
 Except for AreaNumberofBedrooms whose p value is 0.207 which is greater than that of alpha.
9) Checked for multicollinearity. All the absolute values were less than 5. There is no high correlation between the
independent variables
10) Split the data into train and test data. Train data would be used to create the model and the test data would be used for prediction
11) Train Data: Multiple R squred is 0.921 which indicates that independent variables can explain 92.1% change/variation in the dependent variable and p value is less than alpha which means it is statistically significant
slope represents the rate of change in the dependent variable (price) with the one unit change in the independent variable. For eg. with an increase of 1 room in the house, the price will increase by 118602. 
12) RMSE (Root Mean Squared Error) is found to be 99886.24
13) MAPE (Mean Absolute Percentage Error) is found to be 0.07. This means accuracy of the model is 92.45%. 
14) The top six observations of the test data are as follows :
        Price       predicted
8  1573936.6 1569453.9
20 1030591.4 1202571.8
24  743999.8 1000492.1
31 1246830.2 1247132.3
33 1071279.2 1234708.0
34  534305.1  615382.8 

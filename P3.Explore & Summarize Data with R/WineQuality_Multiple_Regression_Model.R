# Multiple Linear Regression
dataset = read.csv('wineQualityReds.csv')
dataset = dataset[, 2:13]


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$quality, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Note: Feature_Scaling will be taken care of with the function 

# Fitting Muliple Linear Regression to the Training set
regressor = lm(formula = quality ~ .,
               data = training_set)
summary(regressor)

#Summary: the volatile.acidity,chlorides, total.sulfur.dioxide, alcohol, sulphates
# are all strongly statistically significant on the depandent variable, while pH
# has a slight statistical influence on quality. 


#Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)
y_pred

#Result: model did very well, but now it is time to optimize it with the 
#Backward Elimination method.

# Building the optimal model using Backward Elimination

regressor = lm(formula = quality ~ fixed.acidity + 
                 volatile.acidity + 
                 citric.acid + 
                 residual.sugar + 
                 chlorides +
                 free.sulfur.dioxide + 
                 total.sulfur.dioxide + 
                 density + 
                 pH +
                 sulphates +
                 alcohol,
               data = dataset)  
summary(regressor)

#Interation #2
regressor = lm(formula = quality ~ 
                 volatile.acidity + 
                 citric.acid + 
                 residual.sugar + 
                 chlorides +
                 free.sulfur.dioxide + 
                 total.sulfur.dioxide + 
                 density + 
                 pH +
                 sulphates +
                 alcohol,
               data = dataset)  
summary(regressor)

#Interation #3
regressor = lm(formula = quality ~ 
                 volatile.acidity + 
                 citric.acid + 
                 residual.sugar + 
                 chlorides +
                 free.sulfur.dioxide + 
                 total.sulfur.dioxide + 
                 pH +
                 sulphates +
                 alcohol,
               data = dataset)  
summary(regressor)

#Interation #4
regressor = lm(formula = quality ~ 
                 volatile.acidity + 
                 citric.acid + 
                 chlorides +
                 free.sulfur.dioxide + 
                 total.sulfur.dioxide + 
                 pH +
                 sulphates +
                 alcohol,
               data = dataset)  
summary(regressor)


#Interation #5
regressor = lm(formula = quality ~ 
                 volatile.acidity + 
                 chlorides +
                 free.sulfur.dioxide + 
                 total.sulfur.dioxide + 
                 pH +
                 sulphates +
                 alcohol,
               data = dataset)  
summary(regressor)

regressor = lm(formula = quality ~ 
                 volatile.acidity + 
                 chlorides +
                 total.sulfur.dioxide + 
                 pH +
                 sulphates +
                 alcohol,
               data = dataset)  
summary(regressor)




## Regression
working.directory <- "D:\\code\\R\\R-Practice\\"

setwd(working.directory)

# Linear Regression
weight <- c(63,81,56,91,47,57,76,72,62,48)
height <- c(151,174,138,186,128,136,179,163,152,131)

# Creating a model
model <- lm(weight~height)
print(model)

# Summary of the model
print(summary(model))

# Visualizing the model graphically
png("LinearRegressonWeightVsHeight.jpg")
plot(x = height, y = weight)
dev.off()

# Visualizing the model
png("LinearRegressonWeightVsHeight2.jpg")
plot(x = height, y = weight, main = "Height vs Weight", xlab = "Height in cm", ylab = "Weight in Kg", cex = 1.3,
     pch = 16, abline(lm(weight~height)))
dev.off()

# Using the model to predict the weight for height = 170
a <- data.frame(height = 170)
weight.predicted <- predict(model, a)

print(weight.predicted)
########################################################
# Multiple regression
# Y = a + b1x1 + b2x2 + b3x3 + ...

# Multile (linear) regression for miles/gallon vs (no. of cylinders, weight, displacement, horsepower) from mtcars
model.multipleRegression  <- lm(formula = mpg~cyl+wt+disp+hp, data = mtcars)
print(model.multipleRegression)

# COefficients can be obtained using coef(...) or coefficients(...) 
coef(model.multipleRegression)
coef.intercept <- coef(model.multipleRegression)[1]
coef.cyl <- coef(model.multipleRegression)[2]
coef.wt <- coef(model.multipleRegression)[3]
coef.disp <- coef(model.multipleRegression)[4]
coef.hp <- coef(model.multipleRegression)[5]

# Predicting for cyl=6, wt=2.5, disp=250, hp=100
mpg.newData <- data.frame(cyl=6,wt=2.5,disp=250,hp=100)
mpg.predicted <- predict(object = model.multipleRegression, newdata = mpg.newData)
print(mpg.predicted)
#########################################################
# Logistic regression - glm()
# Automatic/manual transmission for dataset mtcars

# Creating the model
model.logisticRegression <- glm(am~cyl+wt+hp, mtcars, family = binomial) # family = binomial for logistic regression
print(model.logisticRegression)
print(summary(model.logisticRegression))

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


# Using the model to predict the weight for height = 170
a <- data.frame(height = 170)
weight.predicted <- predict(model, a)

print(weight.predicted)

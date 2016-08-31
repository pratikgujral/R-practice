setwd("D:/R/R")

## Mean Median Mode
height <- c(150,156,173,167,136, 153, 150, 156)

# Mean
height.mean <- mean(height, na.rm = TRUE)
cat("Mean Height: ", height.mean)
#Median 
height.median <- median(height, na.rm = TRUE)
cat("\nMedian Height: ", height.median)

#Sorting to manually calculate the median
height.sorted <- sort(height)
cat("\nSorted height: ", height.sorted)

# Mode -> No in-built function for mode
calculate.mode <- function(data)
{
  uniqv <- unique(data)
  uniqv[which.max(tabulate(data, uniqv))]
}
    #Calling the function
cat("\nMode: ", calculate.mode(height))

##  -------------------------------------------------

## LINEAR REGRESSION
height.x <- c(151,174,138,186,128,136,179,163,152, 131)
weight.y <- c(63,81,56,91,47,57,76,72,62,48)
# Establishing a realtionaship between height and weight
relation <- lm(weight.y, height.x)

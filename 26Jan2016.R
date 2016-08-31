## http://www.ats.ucla.edu/stat/r/dae/logit.htm
setwd("D:\\R\\R")

install.packages("aod")
install.packages("ggplot2")

library(aod)
library(ggplot2)

mydata <- read.csv("http://www.ats.ucla.edu/stat/data/binary.csv")
## view the first few rows of the data
head(mydata)

summary(mydata)
sapply(mydata, sd)

## two-way contingency table of categorical outcome and predictors we want
## to make sure there are not 0 cells
xtabs(~admit + rank, data = mydata)

# Converting rank to a factor to indicate that it is a categorical variable
mydata$rank <- factor(mydata$rank)
# Building the logit regression model using glm()-> generalized linear model
mylogit <- glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")
mylogit
summary(mylogit)

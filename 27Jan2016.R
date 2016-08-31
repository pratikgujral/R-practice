## LOGISTIC REGRESSION http://www.ats.ucla.edu/stat/r/dae/logit.htm
setwd("D:\\Pratik\\R\\")
##########################################
install.packages("aod")
install.packages("ggplot2")
##########################################
library(aod)
library(ggplot2)
##########################################
# Reading student admission data
mydata <- read.csv("http://www.ats.ucla.edu/stat/data/binary.csv")
## view the first few rows of the data
head(mydata)
# Summary of mydata
summary(mydata)
# Finding standard deviation of all the columns
sapply(mydata, sd)
# Since columns 'admit' and  'rank' are not contiuous, sd has no significant meaning

## two-way contingency table of categorical outcome and predictors we want
## to make sure there are not 0 cells
xtabs(~admit + rank, data = mydata)

# xtabs will get the frequency of students for every rank and admit(0 or 1)
# Checking
View(subset(mydata, subset = mydata$rank==1 & admit==0))
View(subset(mydata, subset = mydata$rank==1 & admit==1))
View(subset(mydata, subset = mydata$rank==2 & admit==0))
View(subset(mydata, subset = mydata$rank==2 & admit==1))
View(subset(mydata, subset = mydata$rank==3 & admit==0))
View(subset(mydata, subset = mydata$rank==3 & admit==1))
View(subset(mydata, subset = mydata$rank==4 & admit==0))
View(subset(mydata, subset = mydata$rank==4 & admit==1))
####
# Factor variables are categorical variables that can be either numeric or string 
# variables. There are a number of advantages to converting categorical variables 
# to factor variables. http://www.ats.ucla.edu/stat/r/modules/factor_variables.htm
class(mydata$rank)
# Converting rank to factor variable to indaicate that it is a categorical variable
mydata$rank <- factor(mydata$rank)
# Logit(logistic) regression
mylogit <- glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")
mylogit
summary(mylogit)
# DEGREES OF FREEDOM : https://en.wikipedia.org/wiki/Degrees_of_freedom_(statistics)
# https://stats.stackexchange.com/questions/86351/interpretation-of-rs-output-for-binomial-regression
# Since Pr value of GPA and GRE(also, other rank values) < 0.05, they are significant.


##############################################
# http://www.ats.ucla.edu/stat/mult_pkg/faq/general/odds_ratio.htm
url <- "http://www.ats.ucla.edu/stat/mult_pkg/faq/general/sample.csv"
sampleData <- read.csv(url)
View(sampleData)
# Prob(hons=1)
probHon_1 <- nrow(subset(x=sampleData, subset = sampleData$hon==1))/nrow(sampleData)
cat("Prob(hons=1):", probHon_1)
oddsHon_1 <- probHon_1/(1-probHon_1)
cat("Odds = p/(1-p)=", oddsHon_1)
cat("log likelihood = ln[(prob(hons=1)/ (1-prob(hons=1))] = ", log(oddsHon_1))

model <- glm(formula=hon~female, data = sampleData)
model


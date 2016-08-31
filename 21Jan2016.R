# generate a sequence
?seq
str(seq)

Above10 <- function(x){
  x>10
  x[x>10]
}

x <- 2:22
print(Above10(x))


Add2 <- function(x,y){
  x+y
}

print(x)
print(Add2(x,x))

# Function to calculate column mean of a matrix
ColumnMean <- function(x){
  nc<- ncol(x)
  means <- numeric(length = nc)
  for(i in nc){
    means[i] = mean(x[,i])
  }
  print(means)
  means
}

print(ColumnMean(data))


x <- mtcars
setwd("D:\\R\\R")
# Write csv
write.csv(x,"mtcarsData.csv")
# Reading this file now
read.mtcars <- read.csv("mtcarsData.csv")
# Writing this in to json
library(rjson)
# all functons in rjson
ls('package:rjson', all=TRUE)
library(help = rjson)
mtcars.json <- toJSON(x = read.mtcars, method = 'C')
write(mtcars.json, "mtcarsJSON.json")

# Subset of data
View(mtcars)
View(subset(x = mtcars, subset = wt>3 & carb>2))



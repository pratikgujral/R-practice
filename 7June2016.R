rm(list=ls())
setwd("D:\\R\\R")

View(head(mtcars))

dim(mtcars)

total = 0
for(i in 1:nrow(mtcars)){
    print(mtcars[i,1])
    total = total + mtcars[i,1]
}

cat('total: %d', total)
cat('average: ', total/nrow(mtcars))
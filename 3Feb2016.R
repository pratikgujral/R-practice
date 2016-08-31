setwd("D:\\Pratik\\R")

a <- matrix(rep(c(1,2,3,4,5,6,7,8,9,10), each = 10), nrow = 10, ncol = 10, 
            byrow = TRUE)
View(a)

b <- list(1:10, 1:10, 1:10)

lapply(b, mean)
sapply(b, mean)
apply(a, MARGIN = 2,FUN = mean)
apply(a, MARGIN = 1,FUN = mean)

## Internally use apply function
rowSums(a)
colSums(a)
rowMeans(a)
colMeans(a)
##############################################################
library(datasets)
data(iris)

##############################################################
##############################################################
library(XML)

fileUrl <- "http://www.w3schools.com/xml/simple.xml"

doc <- xmlTreeParse(file = fileUrl, useInternal = TRUE)
doc

rootNode <- xmlRoot(doc)
rootNode

xmlName(rootNode)
names(rootNode)

rootNode[[1]]
rootNode[[1]][[1]]

## Extract parts of file
xmlSApply(X = rootNode, FUN = xmlValue)

## To get specific component
xpathSApply(rootNode, "//name", fun = xmlValue)
xpathSApply(rootNode, "//price", fun = xmlValue)

## Extract content by attribute
fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore_ravens"
doc <- xmlTreeParse(fileUrl, useInternal = TRUE)
doc

scores <- xpathSApply(doc, "//li[@class=score]", xmlValue)
scores

teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)
teams

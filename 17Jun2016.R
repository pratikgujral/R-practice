setwd('D:\\R\\R')
getwd()

table <- data.frame(foo = 1:6, bar = c(T,F,F))
View(table)
cat("\nNumber of rows: ", nrow(table))
cat("\nNumber of columns: ", ncol(table))


# All R objects can have names
x <- 1:5
print(x)
names(x)
names(x) <- c('one','two','three')
print(x)
names(x)
names(x) <- c('one','two','three','four','five')
print(x)
x
x['three']
x['three','five'] #error
x[c('four','one','three')]
x[c(T,F)]

# Subsetting the matrices
x <- matrix(c(1,2,3,NA, NA, 6, NA, 8), nrow = 2)
x
x[2,3]
x[8]
x[2,]
x[,2]
is.na(x)
class(x[,3])
x[1,2]
x[1,2, drop=FALSE] # 1x1 matrix is returned
x[1,2, drop=TRUE] # Vector is returned
class(x[1,]) # By-default drop = TRUE
class(x[1, ,drop=FALSE])


# Matrix
x <- matrix(1:4,2,2)
y <- matrix(rep(10,4),nrow = 2, ncol = 2)
x
y
x * y # Element by element multiplication
x %*% y #Matrix multiplication
################################################################333


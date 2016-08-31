add2 <- function(a,b){
  a + b
}

# DOES NOT WORK ------------
returnLarger <- function(a) {
  for(number in a){
    if(number > 10){
       number
    }
  }
}
#--------------------

## Another method
Above10 <- function(x){
  ## Creating a logical vector of only those numbers that are greater than 10
  useNumbers <- x > 10
  print(useNumbers)
  x[useNumbers]
}

## Func to accept a data frame or matrix and calculate mean of every column
calculateColumnMean <- function(x){
  nc<-ncol(x) # Get number of columns
  currentCol <- 1 
  total <- numeric(nc) 
  while(currentCol<=nc){
    total <- total + x[,currentCol]
    currentCol<-currentCol+1
  }
  total/ncol(x)
}

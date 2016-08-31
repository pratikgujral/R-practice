getwd()
setwd("D:\\R\\R")

#File connections
# Header for the file function
str(file)

distance  <-  c(100,200,300,400,500,600,700,800)
time <- c(10,20,30,40,50,60,70,80)
dist_table <- as.data.frame(cbind(distance, time))
class(dist_table)

#Writing this table as csv to file
write.csv(x = dist_table, file = "dist_table.txt")
# Reading this file
help(read.csv)
read.csv()

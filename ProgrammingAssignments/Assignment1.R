## Programming Assignment 1: INSTRUCTIONS Air Pollution: https://www.coursera.org/learn/r-programming/supplement/amLgW/programming-assignment-1-instructions-air-pollution

setwd("D:\\R\\R\\ProgrammingAssignments")
data1 <- read.csv("specdata\\001.csv")
View(data1)
#############################################
## Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a 
# specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', 
# and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from 
# the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the 
# monitors, ignoring any missing values coded as NA. 

pollutantmean <- function(directory, pollutant, id = 1:332){
    #nId = length(id)
    totalPollution <- 0
    totalCount <- 0
    
    for(i in id){
        fileName <- paste(formatC(i, width=3, flag="0"), "csv", sep = ".")
        filePath <- paste(directory, fileName, sep="\\")
        # Read the data from file
        data <- read.csv(filePath)
        # Remove the NA
        dataSansNA <- (subset(x = data, subset = !is.na(data[[pollutant]])))[[pollutant]]
        
        # Calculate sum of the required column of only one file
        sumPollutant <- sum(dataSansNA)
        totalPollution <- totalPollution + sumPollutant
        
        # Total number of observations
        countPollutant <- length(dataSansNA)
        totalCount <- totalCount + countPollutant
    }
    
    totalPollution/totalCount
}
##############################################################

complete <- function(directory, id = 1:332){
    nobs <- numeric(length(id))
    j <- 1
    for(i in id){
        fileName <- paste(formatC(i, width=3, flag="0"), "csv", sep = ".")
        filePath <- paste(directory, fileName, sep="\\")
        # Read the data from file
        data <- read.csv(filePath)
        
        obs.result <- length(data$sulfate[complete.cases(data)])
        nobs[j] <- obs.result
        j <- j + 1
    }
    returnData <- cbind(id, nobs)
    returnData
}
################################################################
corr <- function(directory, threshold = 0){
    corrResult <- numeric(length(list.files((directory))))
    j <- 1
    # Compute complete-cases
    for(i in list.files(directory)){
        #fileName <- paste(formatC(i, width=3, flag="0"), "csv", sep = ".")
        filePath <- paste(directory, i, sep="\\")
        # Read the data from file
        data <- read.csv(filePath)
        
        #obs.result <- length(data$sulfate[complete.cases(data)])
        #nobs[j] <- obs.result
        #j <- j + 1
        
        dataSansNA <- subset(data, subset = complete.cases(data))
        nCompleteCases <- nrow(dataSansNA)
        if(nCompleteCases > threshold){
            corrResult[j] <- cor(dataSansNA$sulfate, dataSansNA$nitrate)
            j <- j + 1
        }
        
    }
    for(i in corrResult){
        if(i !=0 ){
            corrResult
        }
    }
    0
}



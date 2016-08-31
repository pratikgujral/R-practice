pollutantmean <- function(directory, pollutant, id = 1:332){
    nId = length(id)
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
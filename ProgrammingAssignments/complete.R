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
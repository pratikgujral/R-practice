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
        }
        j <- j + 1
    }
    corrResult
}

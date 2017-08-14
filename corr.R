#Created By: Anshoo Mehra
#Course: Coursera Data Science, R Programming

#Problem:
# Write a function that takes a directory of data files and a threshold for complete cases
# and calculates the correlation between sulfate and nitrate for monitor locations where the
# number of completely observed cases (on all variables) is greater than the threshold.
# The function should return a vector of correlations for the monitors that meet the threshold
# requirement. If no monitors meet the threshold requirement, then the function should return a
# numeric vector of length 0. 

#How to run >>
 #source("corr.R")
 #corr(directory, 200)

#Data: Sample data is in specData

# Output: 
# cr <- corr(directory, 200)
# head(cr)
# summary(cr)
#[1] -0.2225526 -0.2225526 -0.2225526 -0.2225526 -0.2225526 -0.2225526

corr <- function(directory, thershold = 0) {
        #Call Function name 'complete' Created Earlier to get NON-NA Observations by ID
        NonNACountByID = complete(directory)
        #Filter IDs with observations greater than thresholds
        ids = NonNACountByID[NonNACountByID["nobs"] > threshold, ]$id
        
        #Placeholder for correlations
        correlations = numeric()
        
        for (i in ids) {
                #Read Data
                data = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
                                         ".csv", sep = ""))
                #Data filtered removing NA
                dataNonNA = data[complete.cases(data), ]
                #Compute correlations & add it to the collection 'correlations'
                correlations = c(correlations, cor(dataNonNA$sulfate, dataNonNA$nitrate))
        }
        return(correlations)
}
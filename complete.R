#Created By: Anshoo Mehra
#Course: Coursera Data Science, R Programming

#Problem:
# Write a function that reads a directory full of files and reports the number of completely 
# observed cases in each data file. The function should return a data frame where the first 
# column is the name of the file and the second column is the number of complete cases. 

#Pre-Req Packages 
#library("dplyr")

#How to run >>
#source("complete.R")
#complete("/Users/anmehra/Dropbox/DataScience Coursera/R Programming/specdata/", 1:2)

#Data: Sample data is in specData

# Output: "Aggregating Results by ID..."
#id    x
#1  1  117
#2  2 1041

complete <- function(directory, id = 1:332) {
        ## Nested Function: Read CSV for given index as data frame, remove NAs, Return Sum 
        funcNonNACount <- function(i) {
                #Read Data
                data = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
                                      ".csv", sep = ""))
                #Return sum of NON-NA observations
                sum(complete.cases(data))
        }
        ## Call Nested Function for every ID in Vector, return as data frame of id,nobs
        nobs = sapply(id, funcNonNACount)
        return(data.frame(id, nobs))
}

#Alternate Easy StepByStep Articulation 
# complete <- function(directory, id=1:332) {
#         # Retrieve File Names with Path, it will return list with count 332 in this case
#         files = paste(directory, list.files(path=directory, pattern = "*.csv"), sep="")
#         print (paste("Retreived Files Count:", NROW(files)))
#         
#         #Load Data from All CSVs, it will return list of Data Frames with count 332 in this case
#         csv_data = lapply(files[id], read.csv)
#         print (paste("Loaded Data From Files:", NROW(csv_data)))
#         
#         #Bind All Rows to one Data Frame instead of multiples in List for ease doing Arithmatic Operations *using dypler
#         csv_data_merged = bind_rows(csv_data)
#         print (paste("Merge Data Completed with Total Rows:", NROW(csv_data_merged)))
#         
#         #Omit NAs
#         csv_data_merged = na.omit(csv_data_merged[,2:3])
#         print("Omit NA Completed..")
#         
#         #Return Sum of Group By IDs
#         print("Aggregating Results by ID...")
#         aggregate(csv_data_merged[,1], FUN=NROW, by=list(id=csv_data_merged$ID))
#         
# }
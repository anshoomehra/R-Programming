#Created By: Anshoo Mehra
#Course: Coursera Data Science, R Programming

#Problem:
 # Write a function named 'pollutantmean' that calculates the mean of a pollutant
 # (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean'
 # takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID
 # numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory
 # specified in the 'directory' argument and returns the mean of the pollutant across all 
 # of the monitors, ignoring any missing values coded as NA.

#Pre-Req Packages 
 #library("dplyr")

#How to run >>
 #source("pollutantmean.R")
 #pollutantmean("/Users/anmehra/Dropbox/DataScience Coursera/R Programming/specdata/", "sulfate")

#Data: Sample data is in specData

# Output: "Mean for pollutant  nitrate :  1.70293184286701"
#          "Mean for pollutant  sulfate :  3.18936865762216"
pollutantmean <- function(directory, pollutant, id=1:332) {
        
        # Retrieve File Names with Path, it will return list with count 332 in this case
        files = paste(directory, list.files(path=directory, pattern = "*.csv"), sep="")
        print (paste("Retreived Files Count:", NROW(files)))
        
        #Load Data from All CSVs, it will return list of Data Frames with count 332 in this case
        csv_data = lapply(files[id], read.csv)
        print (paste("Loaded Data From Files:", NROW(csv_data)))
        
        #Bind All Rows to one Data Frame instead of multiples in List for ease doing Arithmatic Operations *using dplyr
        csv_data_merged = bind_rows(csv_data)
        print (paste("Merge Data Completed with Total Rows:", NROW(csv_data_merged)))
        
        #Calculate & Return Mean for requested Pollutant. This operation OMIT NA's in addition to avoid calculation error
        #This one failed as mean is defunt in R3.0.0 onwards for passing dataframe mean_pollutant= mean(na.omit(csv_data_merged[pollutant]), na.rm = TRUE)
        mean_pollutant = lapply(csv_data_merged[pollutant], mean, na.rm= TRUE)
        print (paste("Mean for pollutant ", pollutant, ": ", mean_pollutant))
        
}
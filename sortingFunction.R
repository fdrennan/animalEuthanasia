train <- read.csv("train.csv", stringsAsFactors = FALSE, sep = ",")


# Create sorting function

sortit <- function(dataFrame = "Where data is stored", columnNumber = "Column number which holds category to sort by", categoryName = "Name of category to sort by", columnNumbersBeSorted = "Rows to be sorted, list as vector i.e., c(4,5,7,9)") {
  
  # Creates a dataframe based on variable of interest
  subsetOfDataFrame <- subset(dataFrame, dataFrame[,columnNumber] == as.character(categoryName)) 
  
  # Separate unneeded data from needed data i.e., data that is stored in columnNumbersToBeSorted
  # unsortedDataFrame will contain all the data we desire to sort
  
  unsortedDataFrame <- subsetOfDataFrame[,columnNumbersBeSorted]
  
  # The code below is not yet necessary, but might be here soon. 
  residualDataFrame <- subsetOfDataFrame[,-columnNumbersBeSorted]
  
  # Make a simple counter and initialize a dataframe
  i <- 1
  frequencyTable <- NULL
  
  # Create a dataframe which holds number of each type of variable
  
  while (i <= length(columnNumbersBeSorted)) {
    
    frequencyTable <- rbind(as.data.frame(table(unsortedDataFrame[,i])), frequencyTable)
    
    
    i <- i + 1
  }
  
  # Initialize a weight column
  
  unsortedDataFrame$weight <- 0
  
  # Add weights from frequency table to weight column in unsortedDataFrame
  # Re-initialize counter
  
  j <- 1
  
  while (j < length(unsortedDataFrame[1,])) {
   
    i <- 1
    n <- 1
    
    while(i <= length(unsortedDataFrame[,1])) {
      
      
      if (unsortedDataFrame[i,j] == frequencyTable[n,1]) {
        unsortedDataFrame$weight[i] <- frequencyTable[n,2] + unsortedDataFrame$weight[i]
        i <- i + 1
        n <- 1
      }
      else if (unsortedDataFrame[i,j] != frequencyTable[n,1]) {
        n <- n + 1
      }
      
    }
     
    j <- j + 1 
  }
  
  
  
  sorted <- unsortedDataFrame[order(-unsortedDataFrame$weight),]
  
  
}

# Running sortit to test results.
# Example: Use train dataset, find "Euthanasia" in the 4th column an sort by weights made for columns 5,6,7,8,9.

euthanised <- sortit(train, 4, "Euthanasia", c(5,6,7,8,9))




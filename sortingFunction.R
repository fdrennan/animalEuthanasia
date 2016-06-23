# Create sorting function

sortit <- function(dataFrame = "Where data is stored", columnNumber = "Column number which holds category to sort by", categoryName = "Name of category to sort by", columnNumbersBeSorted = "Rows to be sorted, list as vector i.e., c(4,5,7,9)") {
  
  # Creates a dataframe based on variable of interest
  subsetOfDataFrame <- subset(dataFrame, dataFrame[,columnNumber] == as.character(categoryName)) 
   
  # Separate unneeded data from needed data i.e., data that is stored in columnNumbersToBeSorted
  # unsortedDataFrame will contain all the data we desire to sort
  
  unsortedDataFrame <- subsetOfDataFrame[,columnNumbersBeSorted]
  
  # The code below is not yet necessary, but might be here soon. 
  # residualDataFrame <- subsetOfDataFrame[,-columnNumbersBeSorted]
  
  # Make a simple counter and initialize a dataframe
  i <- 1
  frequencyTable <- NULL
  
  while (i <= length(columnNumbersBeSorted)) {
        
    frequencyTable[,i] <- as.data.frame(table(unsortedDataFrame[,i]))
    
    i <- i + 1
  }
  
  return(frequencyTable)
  
  
}

# Running sortit to test results

stuff <- sortit(train, 4, "Euthanasia", c(5,6,7,8,9))

head(stuff)



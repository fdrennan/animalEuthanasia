# Create sorting function

sortit <- function(dataFrame = "Where data is stored", columnNumber = "Column number which holds category to sort by", categoryName = "Name of category to sort by", columnNumbersBeSorted = "Rows to be sorted, list as vector i.e., c(4,5,7,9)") {
  
  # Creates a dataframe based on variable of interest
  subsetOfDataFrame <- subset(dataFrame, dataFrame[,columnNumber] == as.character(categoryName)) 
   
  # Separate unneeded data from needed data i.e., data that is stored in columnNumbersToBeSorted
  # unsortedDataFrame will contain all the data we desire to sort
  
  unsortedDataFrame <- subsetOfDataFrame[,columnNumbersBeSorted]
  
  
  
}

# Running sortit to test results

stuff <- sortit(train, 4, "Euthanasia", c(5,6,7,8,9,10))

head(stuff)

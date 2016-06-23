
# Create sorting function

sortit <- function(dataFrame = "Where data is stored", columnName = "Column number which holds category to sort                      by", categoryName = "Name of category to sort by", rows = "Rows to be sorted, list as vector i                    .e., c(4,5,7,9)") {
  
  # Creates a dataframe based on variable of interest
  subsetOfDataFrame <- subset(dataFrame, dataFrame[,columnName] == as.character(categoryName)) 
   
  
  
}



# Running sortit to test results

stuff <- sortit(train, 4, "Euthanasia", c(5,6,7,8,9,10))


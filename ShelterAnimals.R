# Import data

train <- read.csv("train.csv", stringsAsFactors = FALSE, sep = ",")

# Look at the structure/variables of the data

str(train)

# Create a subset of euthanized dogs

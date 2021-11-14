install.packages("plyr")
library("plyr")

filterData <- function(inputFile, roi = c(), rootLines, rootTreatment, outputFile) {

  if(!is.character(inputFile)) stop("inputFile must be of type character")
  if(!is.character(outputFile)) stop("exportFile must be of type character")
  if(!is.character(rootLines)) stop("root line must be of type character")
  if(!is.double(roi)) stop("ROIs must be a double vector")

  #read the input file
  rootData <- read.csv(file = inputFile, sep = ",")

  filteredRootData <- data.frame(GeneLines = character(0))

  #find the specific rois that need to be filtered.
  for (i in roi){

      tempFrame <- data.frame(GeneLines = rootLines, placeHolder2 = rootData$Longest.Shortest.Path[i])
      names(tempFrame)[names(tempFrame) == "placeHolder2"] <- rootTreatment #this is to replace the name of the column

      filteredRootData <- rbind.fill(filteredRootData, tempFrame)
  }


  outputRootData <- data.frame()
  if (!file.size(outputFile) == 0) {
    outputRootData <- read.csv(file = outputFile, sep = ",")
  }

  outputRootData <- rbind.fill(outputRootData, filteredRootData)

  write.csv(outputRootData, file = outputFile, row.names = FALSE)

  print(filteredRootData)
  print(outputRootData)
}


filterData <- function(inputFile, roi = c(), rootLines, rootTreatment, outputFile) {

  if(!is.character(inputFile)) stop("inputFile must be of type character")
  if(!is.character(outputFile)) stop("exportFile must be of type character")
  if(!is.character(rootLines)) stop("root line must be of type character")
  if(!is.double(roi)) stop("RO's must be a double vector")

  #read the input file
  rootData <- read.csv(file = inputFile, sep = ",")
  # rootData
  # write.csv(rootData, file = outputFile)
  # write.table(rootData[2,], file = outputFile, append = T, sep = ",", row.names = F, col.names = F)
  # AA.new <- read.csv(file = inputFile, sep=",")
  # print("bye")
  # AA.new
  # head(rootData, n = 10) #should return the datatable but it doesn't???
  # print(rootData) #prints the datatable
  #print(rootData[1]) prints out the first row
  # print(rootData$Longest.Shortest.Path) #prints out the values of the Shortest Longest Path
  # outRootData <- read.csv(file = outputFile)
  # print(outRootData)

  #find the specific rois that need to be filtered.
  # write.csv(rootData[roi[1],], file = outputFile)
  for (i in roi){

      # if ((rootTreatment %in% colnames(outputRootData)) == FALSE) {
      #   newcol <- outputRootData(rootLines)
      # }
      # rootTreatment %in% colnames(outputRootData)
      outputRootData <- read.csv(file = outputFile, sep = ",")
      newEntry <- data.frame(geneLines = rootLines, placeHolder2 = rootData$Longest.Shortest.Path[i])
      #names(newEntry)[names(newEntry) == "placeHolder1"] <- rootLines
      names(newEntry)[names(newEntry) == "placeHolder2"] <- rootTreatment #this is to replace the name of the column


      #=======EITHER WHEN COMBINING OR WRITING MAKE SURE NOT THE INDEX OF ROWS IS ADDED AS NEW COLUMN =========



      combine <- merge(outputRootData, newEntry, all=TRUE)
      write.csv(combine, file = outputFile)
      #write.table(newEntry, file = outputFile, append = T, sep = ",", row.names = F, col.names = F)
      #write.table(rootData[,], file = outputFile, append = T, sep = ",", row.names = F, col.names = F)

  }

  # print(rootData[roi[i],])
  # print(rootData$Longest.Shortest.Path[roi[2]]) #prints out the specific longest shortest path
  # print(ch)
  #print(rootData[1])
}


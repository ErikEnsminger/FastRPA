

#this function will create a bar graph with the corresponding data.

#now I want to graph the normalized data. For this, the user needs to make sure
#that the data to be graphed has a '/' symbol in the column.
#all other columns should not have any characters other than numbers or letters
#Then I will average out the columns with respect to the root lines and graph out everything.

createRootBarG <- function(inputFile){

  inputRootData <- read.csv(file = inputFile, sep = ",")
  #str(inputRootData) #testing purposes
  print(inputRootData)#testing purposes

  ##order data frame based on the first column geneLines
  #this is a repeat from the analyseRootData, but is important,
  #since users may want to start at different points in the analysis process.

  inputRootData <- inputRootData[order(inputRootData$geneLines),]
  # print(inputRootData)

  # #average for the control treatment of inputRootData
  # df2 <- inputRootData
  # df2$ControlMean <- ave(inputRootData[[controlTreatment]], inputRootData$geneLines)
  # print(df2)


  # aveTreatmentData <- data.frame()
  i <- 1
  b <- 1
  #newList <- list()
  mylist <- c()
  while (i <= ncol(inputRootData)) {
    name_of_col = colnames(inputRootData)[i]

    if ( grepl('[^[:alnum:]]', name_of_col) == TRUE){
      #print(aggregate(inputRootData[[name_of_col]]~geneLines, inputRootData, mean))
      mylist <- c(mylist, name_of_col)
      #newList[[name_of_col]] <- name_of_col
      b = b +1

    }
    #print(i)
    #print(name_of_col)
    # aveTreatmentData[[name_of_col]] <- aggregate(inpputRootData$geneLines, )
    # df2[[average_name_of_col]] <- df2[[name_of_col]] / df2$ControlMean
    i = i+1
  }
  #print(newList)
  #print(mylist)

  print(aggregate(.~ geneLines, data = inputRootData[, c('geneLines', mylist)], mean))

  #print(aggregate(do.call(cbind,list(DRI, ISX))~geneLines, inputRootData, mean))
  #print(aggregate(do.call(cbind,newList)~geneLines, inputRootData, mean))





}


# precondition: the data to be plotted must have a "/" or any other non-number or non-alaphabetic character.
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



  # #average for the control treatment of inputRootData

  i <- 1
  b <- 1
  #newList <- list() #if I want to use a list
  mylist <- c()
  while (i <= ncol(inputRootData)) {
    name_of_col = colnames(inputRootData)[i]

    if ( grepl('[^[:alnum:]]', name_of_col) == TRUE){

      #newList[[name_of_col]] <- name_of_col #if I want to use a list
      mylist <- c(mylist, name_of_col)
      b = b +1
    }
    i = i+1
  }

  #print(aggregate(.~ geneLines, data = inputRootData[, c('geneLines', mylist)], mean))

  aveTreatmentData <- aggregate(.~ geneLines, data = inputRootData[, c('geneLines', mylist)], mean)
  print(aveTreatmentData)


  #now need to output the data in a table and save it somewhere.


  # mydf <- data.frame( X1=c(A=2, B=4, C=1), X2=c(3,2,NA), X3=c(4,1,NA) )
  # barplot(t(as.matrix(mydf)), beside=TRUE)
  # print(mydf)


  #barplot(t(as.matrix(aveTreatmentData)), beside = TRUE)

  #barplot(as.matrix(aveTreatmentData), beside=T , legend.text=T, ylim=c(0,140), ylab="height")



}

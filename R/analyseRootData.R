#' Calculates average of Root Measurements
#'
#' Given a user defined inputFile path, which contains the GeneLines names,
#' and the root length values of the control treatments, the function will
#' normalize the root length measurements. For this, the user must include
#' and specify which treatment in the inputFile is the control treatment.
#'
#' After calculating the average root length of the control treatment for each
#' root line, and the average root length of each treatment, the treatments will
#' be normalized by the control treatment average.
#'
#' The function will then output the new root output data to a user specified output
#' file
#'
#' @param inputFile A string representing the path for the .csv file containing Root Length Data
#' @param controlTreatment A string representing the control Treatment included in inputFile
#' @param outputFile A string representing the output file, to which the calculated averages will be exported
#'
#'
#'@return There is no return by the function, data is exported to the outputFile
#'
#'
#'
#'
#'
#'
#' @export
#' @importFrom stats aggregate ave
#Due to non-linear biolgical systems, we are analysing we must normalize the data.
#Using a control treatment, defined by user input, we will normalize the  data.
#Then we may find the average growth of each of the treatments to ultimatelly graph the data.


#Note: Graphing data will be the next function. Not this one.

#first: Calculate average of the control treatment for each root line. this should be a new column
#named control average. and the column has all the same values

#then divide each treatment/avg of control.

analyseRootData <- function(inputFile, controlTreatment, outputFile){

  inputRootData <- read.csv(file = inputFile, sep = ",")
  str(inputRootData) #testing purposes
  #print(inputRootData)#testing purposes

  inputRootData <- inputRootData[order(inputRootData$geneLines),]  #order data frame based on the first column geneLines

  #average for the control treatment of inputRootData
  df2 <- inputRootData
  importFrom("stats", "aggregate", "ave")
  df2$ControlMean <- ave(inputRootData[[controlTreatment]], inputRootData$geneLines, FUN=function(x) mean(x, na.rm=TRUE))
  print(df2)


  #Divide each Treatment by the control treatment average
  max <- (ncol(df2)-2)
  i <- 2
  while (i <= max) {
    name_of_col = colnames(df2)[i]

    if (!(name_of_col == controlTreatment)){
      average_name_of_col <- paste(name_of_col, "/", controlTreatment)
      print(average_name_of_col) #for testing purposes. Delete!!!!
      df2[[average_name_of_col]] <- df2[[name_of_col]] / df2$ControlMean
    }
    i = i+1
  }

  # df2 <- transform(df2,  new = ISX / ControlMean)
  print(df2)
  # print("bye")
  write.csv(df2, file = outputFile, row.names=FALSE)
  #Now need to average each column for the
}

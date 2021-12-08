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
#' @param outputFile A name of a files to which the calculated averages will be exported
#'
#' @return Output is data frame of data output file. In addition, data is exported to the outputFile
#'
#' @examples
#' \dontrun{
#' #Example 1:
#' # Normalizing root data and calculating average of root treatments.
#' #file inputFileFunc2, first column are the gene Lines, MEX, TEX and WES columns are 3 differnet root treatments
#' input <- system.file("extdata", "inputFileFunc2.csv", package = "FastRPA")
#' outputFile <- system.file("extdata", "outputFileFunc2.csv", package = "FastRPA")
#' analyseRoot <- analyseRootData(inputFile = input, controlTreatment = "WES",
#'                             outputFile = outputFile)
#'}
#'
#' @export
#' @importFrom stats aggregate ave
#'

analyseRootData <- function(inputFile, controlTreatment, outputFile){

  #check the user input
  if(!is.character(inputFile)) stop("inputFile must be of type character")

  if(!is.character(outputFile)) stop("exportFile must be of type character")

  if(!is.character(controlTreatment)) stop("root line must be of type character")


  inputRootData <- read.csv(file = inputFile, sep = ",")


  #first: Calculate average of the control treatment for each root line. this should be a new column
  #named control average. and the column has all the same values
  #then divide each treatment/avg of control.
  inputRootData <- inputRootData[order(inputRootData$geneLines),]  #order data frame based on the first column geneLines

  #average for the control treatment of inputRootData
  df2 <- inputRootData

  df2$ControlMean <- ave(inputRootData[[controlTreatment]], inputRootData$geneLines, FUN=function(x) mean(x, na.rm=TRUE))

  #Divide each Treatment by the control treatment average
  max <- (ncol(df2)-2)
  i <- 2
  while (i <= max) {
    name_of_col = colnames(df2)[i]

    if (!(name_of_col == controlTreatment)){
      average_name_of_col <- paste(name_of_col, "/", controlTreatment)
      df2[[average_name_of_col]] <- df2[[name_of_col]] / df2$ControlMean
    }
    i = i+1
  }

  write.csv(df2, file = outputFile, row.names=FALSE) #write the dataframe to the output file

  return(df2) #return the dataframe

}
# [END]

#' Plot Root Length Data
#'
#' A function that plots the root length paramters based on treatment and gene
#' Lines.
#'
#' @param inputFile A string representing the path for the input file containing
#'   root measurement data. Precondition: columns with data to be plotted must
#'   include / character. Columns of gene lines must be named "geneLines"
#'
#' @return Returns a list object with results
#' \itemize{
#' \item outputPlot - A bar plot with mean root growth of root Treamtent with respect to root Lines
#' \item outputText - the data frame of the raw data used to produce outputPlot
#' }
#'
#' @examples
#' # Example 1:
#' # Creating Bar plot of input data
#' \dontrun{
#' library(plyr)
#' input <- system.file("extdata", "inputFileFunc3.csv", package = "FastRPA")
#' filterData <- createRootBarG(input)
#' filterData$outputPlot  # outputs the plot when called
#' filterData$outputText  # returns the dataframe
#' }
#'
#' @author Erik Ensminger \email{erik.ensminger@mail.utoronto.ca}
#'
#' @references Steipe B., ABC project (.utility 4.07) A Bioinformatics Course:
#'   Applied Bioinformatics
#'   \href{http://steipe.biochemistry.utoronto.ca/abc/index.php/Bioinformatics_Main_Page}{Link}.
#'
#' @export
#' @import ggplot2
#' @import reshape2
#' @importFrom utils read.csv str write.csv
#'
createRootBarG <- function(inputFile){

  #check the user input
  if(!is.character(inputFile)) stop("inputFile must be of type character")

  #ask for input file path and other option is ask for path.
  #if given path do line 35, else: skip.
  inputRootData <- read.csv(file = inputFile, sep = ",")


  ##order data frame based on the first column geneLines
  #this is a repeat from the analyseRootData, but is important,
  #since users may want to start at different points in the analysis process.

  inputRootData <- inputRootData[order(inputRootData$geneLines),]



  # #average for the control treatment of inputRootData

  i <- 1
  b <- 1

  mylist <- c()
  while (i <= ncol(inputRootData)) {
    name_of_col = colnames(inputRootData)[i]

    if ( grepl('[^[:alnum:]]', name_of_col) == TRUE){


      mylist <- c(mylist, name_of_col)
      b = b +1
    }
    i = i+1
  }


  aveTreatmentData <- aggregate(.~ geneLines, data = inputRootData[, c('geneLines', mylist)], mean)

  toPrint <- aveTreatmentData



  #now need to output the data in a table and save it somewhere.
  dat <- aveTreatmentData


  dat1 <- melt(dat,id=("geneLines"))



  bardat1 <- ggplot(data=dat1, aes(x=variable, y=value, fill=geneLines)) +
    geom_bar(stat="identity", position=position_dodge(), colour="black") + xlab("Treatment") + ylab("Root Length (cm)")

  RESULTS <- list(outputPlot = bardat1, outputText = toPrint)

  return(RESULTS)

}
# [END]

#' Filter root measurements from one file to another file
#'
#' A function that takes root measurements selected by the user and adds them to
#' a new output file specified by the user.
#'
#' @param inputFile A string representing the path for the input file containing root measurement data
#' @param roi a vector containing the index of specified root measurements to be exported to the outputFile
#' @param rootLines A string representing the root line the specified roi root measurements parameters are.
#' @param rootTreatment A string representing the root treatment the specified roi root root measurements parameters are.
#' @param outputFile A string representing the path for the output file to which root measurements are added
#'
#' @return No return, specified roi paramter values are added to the user specified outputFile
#'
#' @examples
#' #this should add root measurements at index 2 and 1 of rootMeasurementData.csv file to rootOutput.csv
#' \dontrun{
#' filterData("~/Desktop/rootMeasurementData.csv", c(2,1), "GK","ISX", "~/Desktop/rootOutput.csv")
#' }
#'
#' @author Erik Ensminger \email{erik.ensminger@mail.utoronto.ca}
#'
#' #' @references
#' Steipe B., ABC project (.utility 4.07) A Bioinformatics Course: Applied Bioinformatics
#' \href{http://steipe.biochemistry.utoronto.ca/abc/index.php/Bioinformatics_Main_Page}{Link}.
#'
#' @export
#' @import plyr
#'

install.packages('plyr', repos = "http://cran.us.r-project.org")


filterData <- function(inputFile, roi = c(), rootLines, rootTreatment, outputFile) {


  # Performing checks of user input
  if(!is.character(inputFile)) stop("inputFile must be of type character")

  if(!is.character(outputFile)) stop("exportFile must be of type character")

  if(!is.character(rootLines)) stop("root line must be of type character")

  if(!is.character(rootTreatment)) stop("root line must be of type character")

  if(!is.double(roi)) stop("ROIs must be a double vector")

  library("plyr")
  #read the input file
  importFrom("utils", "read.csv", "str", "write.csv")
  rootData <- read.csv(file = inputFile, sep = ",")

  filteredRootData <- data.frame(geneLines = character(0))

  #find the specific rois that need to be filtered.
  for (i in roi){

      tempFrame <- data.frame(geneLines = rootLines, placeHolder2 = rootData$Longest.Shortest.Path[i])
      names(tempFrame)[names(tempFrame) == "placeHolder2"] <- rootTreatment #this is to replace the name of the column

      filteredRootData <- rbind.fill(filteredRootData, tempFrame)
  }


  outputRootData <- data.frame()
  if (!file.size(outputFile) == 0) {
    outputRootData <- read.csv(file = outputFile, sep = ",")
  }

  outputRootData <- rbind.fill(outputRootData, filteredRootData)

  write.csv(outputRootData, file = outputFile, row.names = FALSE)

  # print(filteredRootData)
  # print(outputRootData)
}


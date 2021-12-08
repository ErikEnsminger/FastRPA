#' Root Length Measurements
#'
#' A file containing the raw data of the root length measurements used as input for function filterData
#'
#' @source Ensminger, Erik
#'
#' @format A matrix with columns:
#' \describe{
#'  \item{Condition.1}{First condition, Column with root length measurements must be called 'Longest Shortest Path'}
#'  \item{Condition.2}{Third condition, measurments of experimental root treatment must be in milimetres (mm)}
#' }
#' @examples
#' # Example 1:
#' # Access raw data made available with this package.
#' inputRootLength <- system.file("extdata", "inputFileFunc1.csv", package = "FastRPA")
#' # Read data
#' inputFileFunc1 <- read.csv(file = inputRootLength, header = TRUE)
#' dim(inputFileFunc1) # 30  4
#' # To see documentation for this dataset
#' ?inputFileFunc1
#'
"inputFileFunc1"









#' Output File of Function 1, filterData
#'
#' The file outputFileFunc1 contains the filtered data outputted by the filterData function
#' This file may also be used as the input for function 2, analyseRootData
#'
#' @source Ensminger, Erik
#'
#' @format A matrix with columns:
#' \describe{
#'  \item{Condition.1}{First condition, first column contains geneLines and must be called 'geneLines'}
#'  \item{Condition.2}{Second condition, subsequent columns must contain the name of the experimental root treatment}
#'  \item{Condition.2}{Third condition, measurments of experimental root treatment must be in milimetres (mm)}
#'  \item{Condition.3}{Fourth condition, one of the root treatment columns must be control treatment, which will be used for normalizing data}
#' }
#' @examples
#' # Example 1:
#' # Access raw data made available with this package
#' outputfilteredData <- system.file("extdata", "outputFileFunc1.csv", package = "FastRPA")
#' # Read data
#' outputFileFunc1 <- read.csv(file = outputfilteredData, header = TRUE)
#' dim(outputFileFunc1) # 30  4
#' # To see documentation for this dataset
#' ?outputFileFunc1
#'
"outputFileFunc1"












#' Input File of Function 2, analyseRootData
#'
#' The file inputFileFunc2 contains the filtered data outputted by the filterData function
#' This file can then be used as input for function analyseRootData
#'
#' @source Ensminger, Erik
#'
#' @format A matrix with columns:
#' \describe{
#'  \item{Condition.1}{First condition, first column contains geneLines and must be called 'geneLines'}
#'  \item{Condition.2}{Second condition, subsequent columns must contain the name of the experimental root treatment}
#'  \item{Condition.2}{Third condition, measurments of experimental root treatment must be in milimetres (mm)}
#'  \item{Condition.3}{Fourth condition, one of the root treatment columns must be control treatment and must be listed as the last column in the csv file, which will be used for normalizing data}
#' }
#' @examples
#' # Example 1:
#' # Access raw data made available with this package
#' inputfilteredData <- system.file("extdata", "inputFileFunc2.csv", package = "FastRPA")
#' # Read data
#' inputFileFunc2 <- read.csv(file = inputfilteredData, header = TRUE)
#' dim(inputFileFunc2) # 30  4
#' # To see documentation for this dataset
#' ?inputFileFunc2
#'
"inputFileFunc2"








#' Output File of Function 2, analyseRootData
#'
#' The file outputFileFunc2 contains the normalized root length data outputted by the analyseRootData function
#' This file can then be used as input for function createRootBarG
#'
#' @source Ensminger, Erik
#'
#' @format A matrix with columns:
#' \describe{
#'  \item{Condition.1}{First condition, first column contains geneLines and must be called 'geneLines'}
#'  \item{Condition.2}{Second condition, the name of root measurements columns to be plotted must contain a `\` character}
#'  \item{Condition.2}{Third condition, measurments of experimental root treatment must be in milimetres (mm)}
#' }
#' @examples
#' # Example 1:
#' # Access raw data made available with this package
#' outputnormalizedData <- system.file("extdata", "outputFileFunc2.csv", package = "FastRPA")
#' # Read data
#' outputFileFunc2 <- read.csv(file = outputnormalizedData, header = TRUE)
#' dim(outputFileFunc2) # 30  4
#' # To see documentation for this dataset
#' ?outputFileFunc2
#'
"outputFileFunc2"





#' Input File of Function 3, createRootBarG
#'
#' The file inputFileFunc3 contains the normalized root length data outputted by the analyseRootData function
#' This file can then be used as input for function createRootBarG
#'
#' @source Ensminger, Erik
#'
#' @format A matrix with columns:
#' \describe{
#'  \item{Condition.1}{First condition, first column contains geneLines and must be called 'geneLines'}
#'  \item{Condition.2}{Second condition, the name of root measurements columns to be plotted must contain a `\` character}
#'  \item{Condition.2}{Third condition, measurments of experimental root treatment must be in milimetres (mm)}
#' }
#' @examples
#' # Example 1:
#' # Access raw data made available with this package
#' inputnormalizedData <- system.file("extdata", "inputFileFunc3.csv", package = "FastRPA")
#' # Read data
#' inputFileFunc3 <- read.csv(file = inputnormalizedData, header = TRUE)
#' dim(inputFileFunc3) # 30  4
#' # To see documentation for this dataset
#' ?inputFileFunc3
#'
"inputFileFunc3"




# [END]

#' Root Length Measurements
#'
#' A file containing the raw data of the root length measurements
#'
#' @source Ensminger, Erik
#'
#' @format A matrix with columns:
#' \describe{
#'  \item{Condition.1}{First condition, Column with root length measurements must be called 'Longest Shortest Path'}
#' }
#' @examples
#' # Example 1:
#' # Access raw data made available with this package
#' inputRootLength <- system.file("extdata", "inputFileFunc1.csv", package = "TestingPackage")
#' # Read data
#' inputFileFunc1 <- read.csv(file = inputRootLength, header = TRUE)
#' dim(inputFileFunc1) # 30  4
#' # To see documentation for this dataset
#' ?inputFileFunc1
#'
"inputFileFunc1"

#' Output File of Function 1
#'
#' The file outputFileFunc1 contains the filtered data outputted by the filterData() function
#' This file may also be used as the input for function 2, analyseRootData().
#'
#' @source Ensminger, Erik
#'
#' @format A matrix with columns:
#' \describe{
#'  \item{Condition.1}{First condition, first column contains geneLines and must be called 'geneLines'}
#'  \item{Condition.2}{Second condition, subsequent columns must contain the name of the experimental root treatment}
#'  \item{Condition.3}{Second condition, one of the root treatment columns must be control treatment, which will be used for normalizing data}
#' }
#' @examples
#' @examples
#' # Example 1:
#' # Access raw data made available with this package
#' outputfilteredData <- system.file("extdata", "inputFileFunc1.csv", package = "TestingPackage")
#' # Read data
#' outputFileFunc1 <- read.csv(file = outputfilteredData, header = TRUE)
#' dim(outputFileFunc1) # 30  4
#' # To see documentation for this dataset
#' ?outputFileFunc1
#'
"outputFileFunc1"

# [END]




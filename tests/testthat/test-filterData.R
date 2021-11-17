library(FastRPA)


test_that("output roor measurements selected right index", {

  input <- system.file("extdata", "inputFileFunc1.csv", package = "FastRPA")
  roi <- c(2,1,5)
  outputFile <- system.file("extdata", "outputFileFunc1.csv", package = "FastRPA")

  filterData <- filterData(inputFile = input, roi = roi, rootLines = "ASER.12.32",
                           rootTreatment = "TEX", outputFile = outputFile)


  expect_equal(filterData$TEX[1], 43)
  expect_equal(colnames(filterData)[1], "geneLines")

  })




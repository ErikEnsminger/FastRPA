
library(FastRPA)


test_that("Filtering root measurements from one file to another", {

  input < - system.file("extdata", "inputFileFunc1.csv", package = "FastRPA")
  roi = c(2,1,5)
  rooLines = "ASER.12.32"
  rootTreatment = "TEX"
  outputFile < - system.file("extdata", "outputFileFunc1.csv", package = "FastRPA")

  filterData <- filterData(inputFile = input, roi = roi, rootLines = rootLines,
                           rootTreatment = rootTreatment, outputFile = outputFile)

  expect_identical(outputRootData$TEX[1], 43)

  })




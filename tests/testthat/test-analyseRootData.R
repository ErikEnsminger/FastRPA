
library(FastRPA)


test_that("Average is calculated properly", {

  input <- system.file("extdata", "inputFileFunc2.csv", package = "FastRPA")
  outputFile <- system.file("extdata", "outputFileFunc2.csv", package = "FastRPA")

  analyseRoot <- analyseRootData(inputFile = input, controlTreatment = "WES",
                           outputFile = outputFile)


  expect_equal(analyseRoot[1, "ControlMean"], 119.2)
  expect_equal(analyseRoot[6, "ControlMean"], 60.2)


})


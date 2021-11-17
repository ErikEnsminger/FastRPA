library(FastRPA)

test_that("Correct type of graph and values are returned", {

  input <- system.file("extdata", "inputFileFunc3.csv", package = "FastRPA")


  filterData <- createRootBarG(input)

  expect_type(filterData, "list")

})


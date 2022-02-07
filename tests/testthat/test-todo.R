test_that("extract_comments returns 3", {
  path <- system.file("tests/test_doc.rmd", package = "tidyMB")
  tmp <- tidyMB:::extract_comments(path)
  testthat::expect_equal(length(tmp), 5)
})

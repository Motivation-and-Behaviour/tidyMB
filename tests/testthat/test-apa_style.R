test_that("returns gt_tbl object", {
  tmp <- gt(iris) %>% apa_style()
  expect_s3_class(tmp, "gt_tbl")
})

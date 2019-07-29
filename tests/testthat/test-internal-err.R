context("internal-err")

test_that("cc",{
  expect_identical(cc(numeric(0)), character(0))
  expect_identical(cc(1), "1")
  expect_identical(cc(1:2), c("1, 2"))
  expect_identical(cc(1:3), c("1, 2, 3"))
})

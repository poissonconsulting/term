context("npars-scalar")

test_that("npars_scalar.term", {
  expect_identical(npars_scalar(new_term(c("a[2]"))), 0L)
  expect_identical(npars_scalar(new_term(c("a[1]"))), 0L)
  expect_identical(npars_scalar(new_term(c("a[1]", "b", "c"))), 2L)
})

test_that("npars.term invalid elements", {
  expect_identical(npars_scalar(new_term(c("a[2]", "b c"))), 1L)
})

test_that("npars_scalar missing values", {
  expect_identical(npars_scalar(new_term(c("a", NA))), NA_integer_)
  expect_identical(npars_scalar(new_term(c("a[2]", NA))), NA_integer_)
})

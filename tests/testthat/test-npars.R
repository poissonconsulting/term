context("npars")

test_that("npars.term", {
  
  expect_identical(npars(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                     "beta[1,2]", "beta[2,2]", "sigma"))),
                   3L)
  
  expect_identical(npars(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))),
                   2L)

})

test_that("npars.term scalars", {
  expect_identical(npars(as.term(c("a[2]"))), 1L)
  expect_identical(npars(as.term(c("a[2]")), scalar_only = TRUE), 0L)
  expect_identical(npars(as.term(c("a[1]")), scalar_only = TRUE), 1L)
})

test_that("npars.term invalid elements", {
  expect_identical(npars(as.term(c("a[2]", "b c"))), NA_integer_)
  expect_identical(npars(as.term(c("a[2]", "b c")), na.rm = TRUE), 1L)
})

test_that("npars.term missing values", {
  expect_identical(npars(as.term(c("a[2]", NA))), NA_integer_)
  expect_identical(npars(as.term(c("a[2]", NA)), na.rm = TRUE), 1L)
})

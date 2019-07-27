context("npars")

test_that("npars.character", {
  
  expect_identical(npars(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                     "beta[1,2]", "beta[2,2]", "sigma")),
                   3L)
  
  expect_identical(npars(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]")),
                   2L)
})

test_that("npars.term", {
  
  expect_identical(npars(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                     "beta[1,2]", "beta[2,2]", "sigma"))),
                   3L)
  
  expect_identical(npars(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))),
                   2L)

})

test_that("npars scalars", {
  expect_identical(npars(as.term(c("a[2]"))), 1L)
  expect_identical(npars(as.term(c("a[2]")), scalar_only = TRUE), 0L)
  # this is because pars needs to be quick it just checks for presence "["
  expect_identical(npars(as.term(c("a[1]")), scalar_only = TRUE), 0L)
})


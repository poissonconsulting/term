context("subset")

test_that("subset.term",{
  term <- as.term(c("alpha[1]", "alpha[2]", "sigma"))
  expect_identical(subset(term, character(0)), term(0L))
  expect_error(subset(term, "beta"), 
                   "^Values of `select` must match 'alpha' or 'sigma'[.]$")
  term <- as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                    "beta[1,2]", "beta[2,2]", "sigma"))
  expect_identical(subset(term), term)
  expect_identical(subset(term, "sigma"), as.term("sigma"))
  expect_identical(subset(term, c("beta", "sigma")), 
                   as.term(c("beta[1,1]", "beta[2,1]", 
                             "beta[1,2]", "beta[2,2]", "sigma")))
  expect_identical(subset(term, c("sigma", "beta")), 
                   as.term(c("beta[1,1]", "beta[2,1]", 
                             "beta[1,2]", "beta[2,2]", "sigma")))
  expect_error(subset(term, "tt"), 
               "^Values of `select` must match 'alpha', 'beta' or 'sigma'[.]$")
})

test_that("subset.term missing values",{
  expect_error(subset(NA_term_), "^`x` must not have missing values[.]$")
  expect_error(subset(c(NA_term_, "a")), 
               "^`x` must not have missing values[.]$")
})

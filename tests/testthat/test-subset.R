context("subset")

test_that("subset.term",{
  term <- as.term(c("alpha[1]", "alpha[2]", "sigma"))
  expect_error(subset(term, "beta"), 
                   "pars must be NULL OR pars can only include values 'alpha' or 'sigma'")
  term <- as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                    "beta[1,2]", "beta[2,2]", "sigma"))
  expect_identical(subset(term), term)
  expect_identical(subset(term, "sigma"), as.term("sigma"))
  expect_identical(subset(term, c("sigma", "beta")), 
                   as.term(c("beta[1,1]", "beta[2,1]", 
                             "beta[1,2]", "beta[2,2]", "sigma")))
  expect_error(subset(term, "tt"), 
               "pars must be NULL OR pars can only include values 'alpha', 'beta' or 'sigma'")
})

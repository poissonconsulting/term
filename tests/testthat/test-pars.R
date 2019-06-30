context("pars")

test_that("pars.default", {
  expect_identical(pars(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                     "beta[1,2]", "beta[2,2]", "sigma")),
                   c("alpha", "beta", "sigma"))
  expect_identical(pars(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                     "beta[1,2]", "beta[2,2]", "sigma"), scalar_only = TRUE),
                   "sigma")
    expect_identical(pars(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                     "beta[1,2]", "beta[2,2]", "sigma"), terms = TRUE),
                   c("alpha", "alpha", "beta",  "beta",  "beta",  "beta",  "sigma"))
})

test_that("pars.term", {
  terms <- as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                     "beta[1,2]", "beta[2,2]", "sigma"))
  expect_identical(pars(terms), c("alpha", "beta", "sigma"))
  expect_identical(pars(terms, scalar_only = TRUE), "sigma")
  expect_identical(pars(terms, scalar_only = TRUE, terms = TRUE), "sigma")
  expect_identical(pars(terms, terms = TRUE),
                   c("alpha", "alpha", "beta",  "beta",  "beta",  "beta",  "sigma"))
  
  expect_identical(set_pars(terms, pars = c("gamma", "theta", "rho")),
                   as.term(c("gamma[1]", "gamma[2]", "theta[1,1]", "theta[2,1]", "theta[1,2]", "theta[2,2]", "rho")))
  
  expect_identical(set_pars(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                                    "beta[1,2]", "beta[2,2]", "sigma"), 
                                  pars = c("gamma", "theta", "rho")),
                   c("gamma[1]", "gamma[2]", "theta[1,1]", "theta[2,1]", "theta[1,2]", "theta[2,2]", "rho"))
  
})

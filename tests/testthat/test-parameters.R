context("parameters")

test_that("parameters.term", {
  terms <- as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                     "beta[1,2]", "beta[2,2]", "sigma"))
  expect_identical(parameters(terms), c("alpha", "beta", "sigma"))
  expect_identical(parameters(terms, scalar_only = TRUE), "sigma")
  expect_identical(parameters(terms, scalar_only = TRUE, terms = TRUE), "sigma")
  expect_identical(parameters(terms, terms = TRUE),
                   c("alpha", "alpha", "beta",  "beta",  "beta",  "beta",  "sigma"))
  
  expect_identical(set_parameters(terms, parameters = c("gamma", "theta", "rho")),
                   as.term(c("gamma[1]", "gamma[2]", "theta[1,1]", "theta[2,1]", "theta[1,2]", "theta[2,2]", "rho")))
  
  expect_identical(set_parameters(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                                    "beta[1,2]", "beta[2,2]", "sigma"), 
                                  parameters = c("gamma", "theta", "rho")),
                   c("gamma[1]", "gamma[2]", "theta[1,1]", "theta[2,1]", "theta[1,2]", "theta[2,2]", "rho"))
  
})

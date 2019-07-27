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
})

test_that("pars.term", {
  expect_identical(pars(as.term("b")), "b")
  expect_identical(pars(as.term("b"), scalar_only = TRUE), "b")
  expect_identical(pars(as.term("b[1]")), "b")
  expect_identical(pars(as.term("b[1]"), scalar_only = TRUE), "b")
  expect_identical(pars(as.term("b[1]"), scalar_only = TRUE, repair = FALSE), character(0))
  expect_identical(pars(as.term(c("b", "b[1]"))), "b")
  expect_identical(pars(as.term(c("b", "b[1]")), scalar_only = TRUE), "b")
  expect_identical(pars(as.term(c("b", "b[1]", "b[2]"))), "b")
  expect_identical(pars(as.term(c("b", "b[1]", "b[2]")), scalar_only = TRUE), character(0))
  expect_identical(pars(as.term(c("b", "b[1]", "b[2]")), scalar_only = TRUE, repair = FALSE), "b")
  expect_identical(pars(as.term(c("b[1]", "b[2]"))), "b")
  expect_identical(pars(as.term(c("b[1]", "b[2]")), scalar_only = TRUE), character(0))
})

test_that("pars.term missing values", {
  expect_identical(pars(as.term("b"), scalar_only = TRUE), "b")
  expect_identical(pars(as.term("b[1]")), "b")
  expect_identical(pars(as.term("b[1]"), scalar_only = TRUE), "b")
  expect_identical(pars(as.term("b[1]"), scalar_only = TRUE, repair = FALSE), character(0))
  expect_identical(pars(as.term(c("b", "b[1]"))), "b")
  expect_identical(pars(as.term(c("b", "b[1]")), scalar_only = TRUE), "b")
  expect_identical(pars(as.term(c("b", "b[1]", "b[2]"))), "b")
  expect_identical(pars(as.term(c("b", "b[1]", "b[2]")), scalar_only = TRUE), character(0))
  expect_identical(pars(as.term(c("b", "b[1]", "b[2]")), scalar_only = TRUE, repair = FALSE), "b")
  expect_identical(pars(as.term(c("b[1]", "b[2]"))), "b")
  expect_identical(pars(as.term(c("b[1]", "b[2]")), scalar_only = TRUE), character(0))
})

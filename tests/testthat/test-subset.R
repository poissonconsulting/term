context("subset")

test_that("subset.term",{
  term <- as.term(c("alpha[1]", "alpha[2]", "sigma"))
  expect_identical(subset(term, character(0)), term(0L))
  expect_error(subset(term, "beta"), 
                   "unrecognized parameters in select")
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
               "unrecognized parameters in select")
})

test_that("subset.term missing values",{
  expect_identical(subset(NA_term_), NA_term_)
  expect_identical(subset(NA_term_, na.rm = TRUE), term(0L))
  expect_identical(subset(c(NA_term_, "a")), c(NA_term_, "a"))
  expect_identical(subset(c(NA_term_, "a"), na.rm = TRUE), as.term("a"))
  expect_error(subset(c(NA_term_, "a"), select = "b"), 
               "unrecognized parameters in select")
  expect_identical(subset(c(NA_term_, "a", "b"), select = "b"), 
               as.term(c(NA_term_, "b")))
  expect_identical(subset(c(NA_term_, "a", "b"), na.rm = TRUE, select = "b"), 
               as.term("b"))
})

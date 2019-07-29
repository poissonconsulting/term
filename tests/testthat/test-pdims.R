context("pdims")

test_that("pdims", {
  expect_identical(pdims(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                    "beta[1,2]", "beta[2,2]", "sigma"))), 
                   list(alpha = 2L, beta = c(2L, 2L), sigma = 1L))
  
  expect_identical(pdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]"))), 
                   list(alpha = 3L, beta = c(2L, 1L)))
  
  expect_identical(pdims(as.term(c("alpha[3]", "beta[2,1]"))), 
                   list(alpha = 3L, beta = c(2L, 1L)))
  
  expect_identical(pdims(as.term(c("alpha[3]", "beta[2,1]", "alpha[10,]"))), 
                   list(alpha = 3L, beta = c(2L, 1L)))
})

test_that("pdims missing value", {
  expect_identical(pdims(NA_term_), 
                   list(alpha = 3L)[-1])
  
  expect_identical(pdims(as.term(c("alpha[3]", "beta[2,1]", NA))), 
                   list(alpha = 3L, beta = c(2L, 1L)))
  
  expect_identical(pdims(as.term(c("alpha[1,2]", "alpha[2,1]", NA))), 
                   list(alpha = c(1L, 2L)))
})

test_that("pdims inconsistent", {
  expect_identical(pdims(as.term(c("alpha[1]", "alpha[1,1]"))),
                   list(alpha = c(1L, 1L)))
  expect_identical(pdims(as.term(c("alpha[2]", "alpha[1,1]"))),
                   list(alpha = c(1L, 1L)))
})

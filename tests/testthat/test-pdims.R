context("pdims")

test_that("pdims", {
  
  term <- as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
                    "beta[1,2]", "beta[2,2]", "sigma"))
  
  expect_identical(pdims(term), 
                   list(alpha = 2L, beta = c(2L, 2L), sigma = 1L))
})

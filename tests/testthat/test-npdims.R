context("npdims")

test_that("npdims.term",{
  expect_identical(npdims(as.term(character(0))), structure(integer(0), .Names = character(0)))
  expect_identical(npdims(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
"beta[1,2]", "beta[2,2]", "sigma"))), c(alpha = 1L, beta = 2L, sigma = 1L))
})
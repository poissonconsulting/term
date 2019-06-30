context("nterms")

test_that("nterms.term", {
  expect_identical(nterms(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
  "beta[1,2]", "beta[2,2]", "sigma"))), 7L)
})

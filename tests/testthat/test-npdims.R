context("npdims")

test_that("npdims.term",{
  expect_identical(npdims(as.term(character(0))), 0L)
  expect_identical(npdims(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
"beta[1,2]", "beta[2,2]", "sigma"))), 3L)
})
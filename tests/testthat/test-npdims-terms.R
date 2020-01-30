context("npdims-terms")

test_that("npdims_terms", {
  expect_identical(npdims_terms(as.term(character(0))), structure(integer(0), .Names = character(0)))

  expect_identical(
    npdims_terms(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]"))),
    c(alpha = 1L, alpha = 1L, beta = 2L, beta = 2L))

  expect_identical(
    npdims_terms(as.term(c("beta[1,1]", "alpha[1]", "alpha[3]", "beta[10]"))),
    c(beta = 2L, alpha = 1L, alpha = 1L, beta = 1L))

  expect_identical(npdims_terms(NA_term_), structure(NA_integer_, .Names = NA_character_))
})

context("npdims")

test_that("npdims.term", {
  expect_identical(npdims(as.term(character(0))), structure(integer(0), .Names = character(0)))
  expect_identical(npdims(as.term(c(
    "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
    "beta[1,2]", "beta[2,2]", "sigma"
  ))), c(alpha = 1L, beta = 2L, sigma = 1L))

  expect_identical(
    npdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")), terms = TRUE),
    c(alpha = 1L, alpha = 1L, beta = 2L, beta = 2L)
  )
  expect_identical(
    npdims(as.term(c("beta[1,1]", "alpha[1]", "alpha[3]", "beta[10]")), terms = TRUE),
    c(beta = 2L, alpha = 1L, alpha = 1L, beta = 1L)
  )

  expect_error(npdims(NA_term_), "^`x` must not have any missing values[.]$", class = "chk_error")
  expect_identical(npdims(NA_term_, terms = TRUE), structure(NA_integer_, .Names = NA_character_))
})

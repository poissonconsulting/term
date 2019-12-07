context("pdims")

test_that("pdims", {
  expect_identical(
    pdims(as.term(c(
      "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
      "beta[1,2]", "beta[2,2]", "sigma"
    ))),
    list(alpha = 2L, beta = c(2L, 2L), sigma = 1L)
  )

  expect_identical(
    pdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]"))),
    list(alpha = 3L, beta = c(2L, 1L))
  )

  expect_identical(
    pdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1,2]", "beta[2,1,1]"))),
    list(alpha = 3L, beta = c(2L, 1L, 2L))
  )

  expect_identical(
    pdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,2]", "beta[2,1]"))),
    list(alpha = 3L, beta = c(2L, 2L))
  )

  expect_identical(
    pdims(as.term(c("alpha[3]", "beta[2,1]"))),
    list(alpha = 3L, beta = c(2L, 1L))
  )

  expect_identical(
    pdims(as.term(c("alpha[3]", "beta[2,1]", "alpha[10,]"))),
    list(alpha = 10L, beta = 2:1)
  )
})

test_that("pdims missing value", {
  expect_error(pdims(NA_term_), "^`x` must not have any missing values[.]$", class = "chk_error")

  expect_error(pdims(as.term(c("alpha[3]", "beta[2,1]", NA))),
    "^`x` must not have any missing values[.]$",
    class = "chk_error"
  )
})

test_that("pdims inconsistent", {
  expect_error(
    pdims(as.term(c("alpha[1]", "alpha[1,1]"))),
    "^`x` must have terms with consistent parameter dimensions[.]$"
  )
})

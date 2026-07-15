test_that("pdims", {
  expect_identical(
    pdims(new_term(c(
      "alpha[1]",
      "alpha[2]",
      "beta[1,1]",
      "beta[2,1]",
      "beta[1,2]",
      "beta[2,2]",
      "sigma"
    ))),
    list(alpha = 2L, beta = c(2L, 2L), sigma = 1L)
  )

  expect_identical(
    pdims(new_term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]"))),
    list(alpha = 3L, beta = c(2L, 1L))
  )

  expect_identical(
    pdims(new_term(c("alpha[1]", "alpha[3]", "beta[1,1,2]", "beta[2,1,1]"))),
    list(alpha = 3L, beta = c(2L, 1L, 2L))
  )

  expect_identical(
    pdims(new_term(c("alpha[1]", "alpha[3]", "beta[1,2]", "beta[2,1]"))),
    list(alpha = 3L, beta = c(2L, 2L))
  )

  expect_identical(
    pdims(new_term(c("alpha[3]", "beta[2,1]"))),
    list(alpha = 3L, beta = c(2L, 1L))
  )

  expect_snapshot(
    error = TRUE,
    pdims(new_term(c("alpha[3]", "beta[2,1]", "alpha[10,]")))
  )
})

test_that("pdims missing value", {
  expect_snapshot(error = TRUE, pdims(NA_term_))

  expect_snapshot(
    error = TRUE,
    pdims(new_term(c("alpha[3]", "beta[2,1]", NA)))
  )
})

test_that("pdims inconsistent", {
  expect_snapshot(
    error = TRUE,
    pdims(new_term(c("alpha[1]", "alpha[1,1]")))
  )
})

test_that("pdims.term_rcrd", {
  expect_identical(
    pdims(term_rcrd(c(
      "alpha[1]",
      "alpha[2]",
      "beta[1,1]",
      "beta[2,1]",
      "beta[1,2]",
      "beta[2,2]",
      "sigma"
    ))),
    list(alpha = 2L, beta = c(2L, 2L), sigma = 1L)
  )
})

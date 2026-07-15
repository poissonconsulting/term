test_that("subset.term", {
  term <- new_term(c("alpha[1]", "alpha[2]", "sigma"))
  expect_identical(subset(term, character(0)), new_term())
  expect_snapshot(error = TRUE, subset(term, "beta"))
  term <- new_term(c(
    "alpha[1]",
    "alpha[2]",
    "beta[1,1]",
    "beta[2,1]",
    "beta[1,2]",
    "beta[2,2]",
    "sigma"
  ))
  expect_identical(subset(term), term)
  expect_identical(subset(term, "sigma"), new_term("sigma"))
  expect_identical(
    subset(term, c("beta", "sigma")),
    new_term(c(
      "beta[1,1]",
      "beta[2,1]",
      "beta[1,2]",
      "beta[2,2]",
      "sigma"
    ))
  )
  expect_identical(
    subset(term, c("sigma", "beta")),
    new_term(c(
      "beta[1,1]",
      "beta[2,1]",
      "beta[1,2]",
      "beta[2,2]",
      "sigma"
    ))
  )
  expect_snapshot(error = TRUE, subset(term, "tt"))
})

test_that("subset.term_rcrd", {
  term_rcrd <- as_term_rcrd(new_term(c("alpha[1]", "alpha[2]", "sigma")))
  expect_identical(subset(term_rcrd, character(0)), new_term_rcrd())
  expect_snapshot(error = TRUE, subset(term_rcrd, "beta"))
  term_rcrd <- as_term_rcrd(new_term(c(
    "alpha[1]",
    "alpha[2]",
    "beta[1,1]",
    "beta[2,1]",
    "beta[1,2]",
    "beta[2,2]",
    "sigma"
  )))
  expect_identical(subset(term_rcrd), term_rcrd)
  expect_identical(subset(term_rcrd, "sigma"), as_term_rcrd(new_term("sigma")))
  expect_identical(
    subset(term_rcrd, c("beta", "sigma")),
    as_term_rcrd(new_term(c(
      "beta[1,1]",
      "beta[2,1]",
      "beta[1,2]",
      "beta[2,2]",
      "sigma"
    )))
  )
  expect_identical(
    subset(term_rcrd, c("sigma", "beta")),
    as_term_rcrd(new_term(c(
      "beta[1,1]",
      "beta[2,1]",
      "beta[1,2]",
      "beta[2,2]",
      "sigma"
    )))
  )
  expect_snapshot(error = TRUE, subset(term_rcrd, "tt"))
})

test_that("subset.term deprecated", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  term <- new_term(c("alpha[1]", "alpha[2]", "sigma"))

  lifecycle::expect_deprecated(subset(term, select = NULL))
  lifecycle::expect_defunct(subset(term, select = "alpha", pars = "alpha"))

  expect_identical(subset(term, select = character(0)), new_term())
})


test_that("subset.term missing values", {
  expect_snapshot(error = TRUE, subset(NA_term_))
  expect_snapshot(error = TRUE, subset(c(NA_term_, new_term("a"))))
})

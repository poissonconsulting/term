test_that("subset.term", {
  term <- new_term(c("alpha[1]", "alpha[2]", "sigma"))
  expect_identical(subset(term, character(0)), new_term())
  expect_error(subset(term, "beta"),
    "^`pars` must match 'alpha' or 'sigma', not 'beta'[.]$",
    class = "chk_error"
  )
  term <- new_term(c(
    "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
    "beta[1,2]", "beta[2,2]", "sigma"
  ))
  expect_identical(subset(term), term)
  expect_identical(subset(term, "sigma"), new_term("sigma"))
  expect_identical(
    subset(term, c("beta", "sigma")),
    new_term(c(
      "beta[1,1]", "beta[2,1]",
      "beta[1,2]", "beta[2,2]", "sigma"
    ))
  )
  expect_identical(
    subset(term, c("sigma", "beta")),
    new_term(c(
      "beta[1,1]", "beta[2,1]",
      "beta[1,2]", "beta[2,2]", "sigma"
    ))
  )
  expect_error(subset(term, "tt"),
    "^`pars` must match 'alpha', 'beta' or 'sigma', not 'tt'[.]$",
    class = "chk_error"
  )
})

test_that("subset.term deprecated", {
  term <- new_term(c("alpha[1]", "alpha[2]", "sigma"))

  rlang::with_options(lifecycle_verbosity = "error", {
    expect_error(subset(term, select = NULL), class = "defunctError")
  })

    suppressWarnings(expect_error(subset(term, select = "alpha", pars = "alpha"), class = "defunctError"))

  rlang::with_options(lifecycle_verbosity = "quiet", {
  expect_identical(subset(term, select = character(0)), new_term())
  })
})


test_that("subset.term missing values", {
  expect_error(subset(NA_term_), "^`x` must not have any missing values[.]$",
    class = "chk_error"
  )
  expect_error(subset(c(NA_term_, new_term("a"))),
    "^`x` must not have any missing values[.]$",
    class = "chk_error"
  )
})

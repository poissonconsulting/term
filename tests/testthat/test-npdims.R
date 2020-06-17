test_that("npdims.term", {
  expect_identical(
    npdims(new_term(character(0))),
    rlang::set_names(integer(0), character(0))
  )
  expect_identical(
    npdims(new_term(c(
      "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
      "beta[1,2]", "beta[2,2]", "sigma"
    ))),
    c(alpha = 1L, beta = 2L, sigma = 1L)
  )

  rlang::with_options(lifecycle_verbosity = "error", {
    expect_error(npdims(new_term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")), terms = TRUE), class = "defunctError")
  })

  rlang::with_options(lifecycle_verbosity = "quiet", {
  expect_identical(
    npdims(new_term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")), terms = TRUE),
    c(alpha = 1L, alpha = 1L, beta = 2L, beta = 2L)
  )})

  rlang::with_options(lifecycle_verbosity = "quiet", {
  expect_identical(
    npdims(new_term(c("beta[1,1]", "alpha[1]", "alpha[3]", "beta[10]")), terms = TRUE),
    c(beta = 2L, alpha = 1L, alpha = 1L, beta = 1L)
  )})

  rlang::with_options(lifecycle_verbosity = "quiet", {
  expect_error(npdims(NA_term_), "^`x` must not have any missing values[.]$", class = "chk_error")
  })
  rlang::with_options(lifecycle_verbosity = "quiet", {
  expect_identical(npdims(NA_term_, terms = TRUE), structure(NA_integer_, .Names = NA_character_))
  })
})

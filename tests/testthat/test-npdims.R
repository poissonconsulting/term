test_that("npdims.term", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  expect_identical(
    npdims(new_term(character(0))),
    rlang::set_names(integer(0), character(0))
  )
  expect_identical(
    npdims(new_term(c(
      "alpha[1]",
      "alpha[2]",
      "beta[1,1]",
      "beta[2,1]",
      "beta[1,2]",
      "beta[2,2]",
      "sigma"
    ))),
    c(alpha = 1L, beta = 2L, sigma = 1L)
  )

  expect_snapshot(
    error = TRUE,
    npdims(
      new_term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")),
      terms = TRUE
    )
  )

  expect_snapshot(error = TRUE, npdims(NA_term_))
})

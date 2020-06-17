test_that("is.term deprecated", {

  rlang::with_options(lifecycle_verbosity = "error", {
    expect_error(is.term(1), class = "defunctError")
  })

  rlang::with_options(lifecycle_verbosity = "quiet", {
    expect_false(is.term(1))
  })
})

test_that("is.term deprecated", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  lifecycle::expect_deprecated(is.term(1))

  expect_false(is.term(1))
})

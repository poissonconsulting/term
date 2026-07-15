test_that("deprecated functions error", {
  expect_snapshot(error = TRUE, is.term(1))
  expect_snapshot(error = TRUE, is.incomplete_terms(term("a[1]")))
  expect_snapshot(error = TRUE, is.inconsistent_terms(term("a[1]")))
  expect_snapshot(error = TRUE, parameters(term("a[1]")))
  expect_snapshot(error = TRUE, {
    x <- term("a[1]")
    parameters(x) <- "b"
  })
  expect_snapshot(error = TRUE, set_parameters(term("a[1]"), "b"))
  expect_snapshot(error = TRUE, tdims(term("a[1]")))
})

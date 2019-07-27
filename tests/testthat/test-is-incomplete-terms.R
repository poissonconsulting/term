context("is-incomplete-terms")

test_that("is.incomplete_terms",{
  expect_false(is.incomplete_terms(term(0L)))
  expect_false(is.incomplete_terms(as.term("b")))
  expect_identical(is.incomplete_terms(as.term(c("b", NA))), NA)
  expect_false(is.incomplete_terms(as.term(c("b", NA)), na.rm = TRUE))
  expect_false(is.incomplete_terms(as.term(c("b", "b[2]"))))
  expect_false(is.incomplete_terms(as.term(c("b", "b[2]", "b[4,] "))))
  expect_identical(is.incomplete_terms(as.term(c("b", NA))), NA)
  expect_false(is.incomplete_terms(as.term("b[1]")))
  expect_true(is.incomplete_terms(as.term("b[2]")))
  expect_false(is.incomplete_terms(as.term(c("b[2]", "b"))))
})

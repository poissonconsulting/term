context("nterms")

test_that("nterms.term", {
  expect_identical(nterms(NA_term_), NA_integer_)
  expect_identical(nterms(c(NA_term_, "a")), NA_integer_)
  expect_identical(nterms(as.term("a")), 1L)
  expect_identical(nterms(as.term(c("a", "a"))), 1L)
  expect_identical(nterms(as.term(c("a", "a b"))), 2L)
  expect_identical(nterms(as.term(c("a", "b"))), 2L)
  expect_identical(nterms(as.term(c("a", "a[1]"))), 2L)
})

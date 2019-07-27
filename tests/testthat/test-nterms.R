context("nterms")

test_that("nterms.term", {
  expect_identical(nterms(character(0)), 0L)
  expect_identical(nterms(NA_character_), NA_integer_)
  expect_identical(nterms("a"), 1L)
  expect_identical(nterms(c("a", "a")), 1L)
  expect_identical(nterms(c("a", "a b")), 1L)
  expect_identical(nterms(c("a", "b")), 2L)
  expect_identical(nterms(c("a", "a[1]")), 1L)
})

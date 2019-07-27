context("na")

test_that("NA_term_", {
  expect_identical(NA_term_, as.term(NA_character_))
  expect_true(is.term(NA_term_))
  expect_true(is.na(NA_term_))
})

test_that("NA_term_", {
  expect_identical(NA_term_, new_term(NA_character_))
  expect_true(is_term(NA_term_))
  expect_true(is.na(NA_term_))
})

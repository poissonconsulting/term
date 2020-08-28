test_that("is.na", {
  expect_identical(is.na(new_term_rcrd()), logical(0))
  expect_identical(is.na(term_rcrd("a")), FALSE)
  expect_identical(is.na(term_rcrd(NA_character_)), TRUE)
})

test_that("anyDuplicated term", {
  expect_identical(anyDuplicated(new_term()), 0L)
  expect_identical(anyDuplicated(new_term(c("alpha[1]"))), 0L)
  expect_identical(anyDuplicated(new_term(c("alpha[1]", "alpha[1]"))), 2L)
  expect_identical(anyDuplicated(new_term(c("alpha[1]", "alpha[1]", "alpha[1]"))), 2L)
  expect_identical(anyDuplicated(new_term(c("alpha[1]", "alpha"))), 2L)
  expect_identical(anyDuplicated(new_term(c("alpha[1]", "alpha1"))), 0L)
  expect_identical(anyDuplicated(new_term(c("alpha[1]", NA_term_))), 0L)
  expect_identical(anyDuplicated(new_term(c("alpha[1]", NA_term_, NA_term_))), 3L)
})

test_that("anyDuplicated term_rcrd", {
  expect_identical(anyDuplicated(new_term_rcrd()), 0L)
  expect_identical(anyDuplicated(as_term_rcrd(new_term(c("alpha[1]", "alpha")))), 2L)
  expect_identical(anyDuplicated(as_term_rcrd(new_term(c("alpha[1]", NA_term_, NA_term_)))), 3L)
})

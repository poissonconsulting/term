test_that("multiplication works", {
  expect_identical(normalize_terms(new_term(c("b", "b[3]"))), as_term(c("b[1]", "b[3]")))
  expect_identical(normalize_terms(new_term(c("b[1]", "a[3]"))), as_term(c("b", "a[3]")))
  expect_identical(normalize_terms(new_term()), as_term(character(0)))
  expect_identical(normalize_terms(new_term(c("b[3]", NA))), as_term(c("b[3]", NA)))
})

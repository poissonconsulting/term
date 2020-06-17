test_that("scalar_term works", {
  expect_identical(scalar_term(new_term(character(0))), logical(0))
  expect_identical(scalar_term(new_term(NA_character_)), NA)
  expect_identical(scalar_term(new_term(c("a"))), TRUE)
  expect_identical(scalar_term(new_term(c("a", "a[2]"))), c(TRUE, FALSE))
  expect_identical(scalar_term(new_term(c("a", "a[1]"))), c(TRUE, FALSE))
  expect_identical(scalar_term(new_term(c("a[1]", NA))), c(FALSE, NA))
  expect_identical(scalar_term(new_term(c("a[2]", NA))), c(FALSE, NA))
  expect_identical(scalar_term(new_term(c("a", "a[2]", "b[1]", "c[1,1]"))), c(TRUE, FALSE, FALSE, FALSE))
})

test_that("scalar_term repair", {
  expect_identical(scalar_term(new_term(c("a ", "a [2]"))), c(TRUE, FALSE))
  expect_identical(scalar_term(new_term(c("a ", "a [1]"))), c(TRUE, FALSE))
})

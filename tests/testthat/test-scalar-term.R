test_that("scalar_term", {
  expect_identical(scalar_term(term()),
                   logical(0))
  expect_identical(scalar_term(term("alpha[1]", "alpha[3]", "beta[1]", "sigma[3]")),
                   c(FALSE, FALSE, TRUE, FALSE))
  expect_identical(scalar_term(term("alpha[1]", NA_term_, "beta[1]", "sigma[3]")),
                   c(TRUE, NA, TRUE, FALSE))
  expect_identical(scalar_term(as_term_rcrd(term("alpha[1]", NA_term_, "beta[1]", "beta[3]"))),
                   c(TRUE, NA, FALSE, FALSE))
})

test_that("scalar_term works", {
  expect_identical(scalar_term(new_term(character(0))), logical(0))
  expect_identical(scalar_term(new_term(NA_character_)), NA)
  expect_identical(scalar_term(new_term(c("a"))), TRUE)
  expect_identical(scalar_term(new_term(c("a", "a[2]"))), c(FALSE, FALSE))
  expect_identical(scalar_term(new_term(c("a", "a[1]"))), c(TRUE, TRUE))
  expect_identical(scalar_term(new_term(c("a[1]", NA))), c(TRUE, NA))
  expect_identical(scalar_term(new_term(c("a[2]", NA))), c(FALSE, NA))
  expect_identical(scalar_term(new_term(c("a", "a[2]", "b[1]", "c[1,1]"))), c(FALSE, FALSE, TRUE, FALSE))
})

test_that("scalar_term repair", {
  expect_identical(scalar_term(new_term(c("a ", "a [2]"))), c(FALSE, FALSE))
  expect_identical(scalar_term(new_term(c("a ", "a [1]"))), c(TRUE, TRUE))
})

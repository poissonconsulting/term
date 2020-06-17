test_that("npars.term", {
  expect_identical(
    npars(new_term(c(
      "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
      "beta[1,2]", "beta[2,2]", "sigma"
    ))),
    3L
  )

  expect_identical(
    npars(new_term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))),
    2L
  )
})

test_that("npars.term scalar", {
  expect_identical(npars(new_term(c("a[2]")), scalar = TRUE), 0L)
  expect_identical(npars(new_term(c("a[1]")), scalar = TRUE), 0L)
  expect_identical(npars(new_term(c("a[1]")), scalar = FALSE), 1L)
  expect_identical(npars(new_term(c("a[1]", "b", "c")), scalar = TRUE), 2L)
})

test_that("npars.term scalar = FALSE", {
  expect_identical(npars(new_term(c("a[2]")), scalar = FALSE), 1L)
  expect_identical(npars(new_term(c("a[1]")), scalar = FALSE), 1L)
  expect_identical(npars(new_term(c("a[1]")), scalar = TRUE), 0L)
  expect_identical(npars(new_term(c("a[1]", "b", "c")), scalar = FALSE), 1L)
})

test_that("npars.term invalid elements", {
  expect_identical(npars(new_term(c("a[2]", "b c"))), 2L)
})

test_that("npars.term missing values", {
  expect_identical(npars(new_term(c("a[2]", NA))), NA_integer_)
})

test_that("npars.term scalar", {
  expect_identical(npars(new_term(c("a[2]")), scalar = TRUE), 0L)
  expect_identical(npars(new_term(c("a[1]")), scalar = TRUE), 0L)
  expect_identical(npars(new_term(c("a[1]", "b", "c")), scalar = TRUE), 2L)
})

test_that("npars.term scalar invalid elements", {
  expect_identical(npars(new_term(c("a[2]", "b c")), scalar = TRUE), 1L)
})

test_that("npars scalar missing values", {
  expect_identical(npars(new_term(c("a", NA)), scalar = TRUE), NA_integer_)
  expect_identical(npars(new_term(c("a[2]", NA)), scalar = TRUE), NA_integer_)
})

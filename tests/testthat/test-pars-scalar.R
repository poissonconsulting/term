context("pars-scalar")

test_that("pars_scalar", {
  expect_identical(pars_scalar(new_term(character(0))), character(0))
  expect_identical(pars_scalar(new_term("a")), "a")
  expect_identical(pars_scalar(new_term(NA_character_)), NA_character_)
  expect_identical(pars_scalar(new_term(c(NA_character_, "a"))), c(NA_character_, "a"))
})

test_that("pars_scalar.default", {
  expect_identical(pars_scalar(character(0)), character(0))
  expect_identical(pars_scalar("a"), "a")
  expect_identical(pars_scalar(c("a", "a")), "a")
  expect_identical(pars_scalar(c("b", "a")), c("b", "a"))
  expect_identical(pars_scalar(c("b[2]", "a")), "a")
  expect_chk_error(pars_scalar(c("b b", "a")), "a")
})

test_that("pars_scalar.term", {
  terms <- new_term(c(
    "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
    "beta[1,2]", "beta[2,2]", "sigma"
  ))
  expect_identical(pars_scalar(terms), "sigma")
})


test_that("pars_scalar.term", {
  expect_identical(pars_scalar(new_term("b")), "b")
  expect_identical(pars_scalar(new_term("b[1]")), character(0))
  expect_identical(pars_scalar(new_term(c("b", "b[1]"))), "b")
  expect_identical(pars(new_term(c("b", "b[1]", "b[2]"))), "b")
  expect_identical(pars_scalar(new_term(c("b", "b[1]", "b[2]"))), "b")
  expect_identical(pars_scalar(new_term(c("b[1]", "b[2]"))), character(0))
})

test_that("pars_scalar.term missing values", {
  expect_identical(pars_scalar(new_term(NA_character_)), NA_character_)
  expect_identical(pars_scalar(new_term(c(NA_character_, "a"))), c(NA_character_, "a"))
  expect_identical(pars_scalar(new_term(c("a", NA_character_, "a"))), c("a", NA_character_))
  expect_identical(
    pars_scalar(new_term(c(NA_character_, "a", NA_character_, "a"))),
    c(NA_character_, "a")
  )

  expect_identical(
    pars_scalar(new_term(c("a[1]", NA_character_, "a"))),
    c(NA_character_, "a")
  )
  expect_identical(
    pars_scalar(new_term(c("a[2]", NA_character_, "a"))),
    c(NA_character_, "a")
  )
  expect_identical(
    pars_scalar(new_term(c("b[2]", NA_character_, "a"))),
    c(NA_character_, "a")
  )
})

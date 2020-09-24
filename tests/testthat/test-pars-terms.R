test_that("pars_term term", {
  terms <- new_term(c(
    "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
    "beta[1,2]", "beta[2,2]", "sigma"
  ))
  lifecycle::expect_deprecated(pars_terms(terms, scalar = TRUE))
  lifecycle::expect_deprecated(pars_terms(terms, scalar = FALSE))
  expect_identical(
    pars_terms(terms),
    c("alpha", "alpha", "beta", "beta", "beta", "beta", "sigma")
  )
})

test_that("pars_term term_rcrd", {
  terms <- as_term_rcrd(new_term(c(
    "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
    "beta[1,2]", "beta[2,2]", "sigma"
  )))
  lifecycle::expect_deprecated(pars_terms(terms, scalar = TRUE))
  lifecycle::expect_deprecated(pars_terms(terms, scalar = FALSE))
  expect_identical(
    pars_terms(terms),
    c("alpha", "alpha", "beta", "beta", "beta", "beta", "sigma")
  )
})

test_that("pars_terms missing values", {
  expect_identical(pars_terms(new_term(NA_character_)), NA_character_)
  expect_identical(
    pars_terms(new_term(c(NA_character_, "a"))),
    c(NA_character_, "a")
  )
  expect_identical(
    pars_terms(new_term(c("a", NA_character_, "a"))),
    c("a", NA_character_, "a")
  )
  expect_identical(
    pars_terms(new_term(c(NA_character_, "a", NA_character_, "a"))),
    c(NA_character_, "a", NA_character_, "a")
  )
})

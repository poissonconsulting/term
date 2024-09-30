test_that("multiplication works", {
  expect_true("a[1]" < "a[2]")
  expect_true("a" < "a[2]")
  expect_false("a" < "a")
  expect_false("a[1,1]" < "a[1,1]")
  expect_false("a[1,2]" < "a[1,1]")
  expect_false("a[2,1]" < "a[1,1]")
  expect_false("a[2,1]" < "a[1,2]")
  expect_true("a[1,2]" < "a[2,1]")
  expect_true("a[2,1]" > "a[1,2]")
})

test_that("npdims_terms_impl", {
  expect_identical(
    npdims_terms_impl(as_term_rcrd(new_term(character(0)))),
    rlang::set_names(integer(0), character(0))
  )

  expect_identical(
    npdims_terms_impl(as_term_rcrd(new_term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")))),
    c(alpha = 1L, alpha = 1L, beta = 2L, beta = 2L)
  )

  expect_identical(
    npdims_terms_impl(as_term_rcrd(new_term(c("beta[1,1]", "alpha[1]", "alpha[3]", "beta[10]")))),
    c(beta = 2L, alpha = 1L, alpha = 1L, beta = 1L)
  )

  expect_identical(npdims_terms_impl(as_term_rcrd(NA_term_)), rlang::set_names(NA_integer_, NA_character_))
})

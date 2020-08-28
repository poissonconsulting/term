test_that("dims.term", {
  expect_identical(dims(new_term()), 0L)
  expect_identical(dims(new_term("beta0")), 1L)
  expect_identical(dims(new_term(c("beta[1,1]", "beta[2,1]"))), 2L)
})

test_that("dims.term_rcrd", {
  expect_identical(dims(new_term_rcrd()), 0L)
  expect_identical(dims(term_rcrd("beta0")), 1L)
  expect_identical(dims(term_rcrd(c("beta[1,1]", "beta[2,1]"))), 2L)
})


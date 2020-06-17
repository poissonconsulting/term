test_that("dims.term", {
  expect_identical(dims(new_term()), 0L)
  expect_identical(dims(new_term("beta0")), 1L)
  expect_identical(dims(new_term(c("beta[1,1]", "beta[2,1]"))), 2L)
})

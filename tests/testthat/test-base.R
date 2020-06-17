test_that("anyDuplicated", {
  expect_true(anyDuplicated(new_term(c("alpha[1]", "alpha[1]"))), TRUE)
})

test_that("unique", {
  expect_identical(
    unique(new_term(c("a[2]", "a[1]", "a[1]"))),
    new_term(c("a[2]", "a[1]"))
  )
})

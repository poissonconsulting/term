context("base")

test_that("anyDuplicated", {
  expect_identical(anyDuplicated(as.term(c("alpha[1]", "alpha[1]"))), 2L)
})

test_that("unique", {
  expect_identical(
    unique(as.term(c("a[2]", "a[1]", "a[1]"))),
    as.term(c("a[2]", "a[1]"))
  )
})

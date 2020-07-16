test_that("summary.term", {
  expect_identical(summary(term()), summary(character(0)))
  expect_identical(summary(term("a[1]")), summary("a[1]"))
})

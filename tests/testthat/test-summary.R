test_that("summary.term", {
  print(summary(term("a[1]")))
  print(summary("a[1]"))
  expect_identical(summary(term()), summary(character(0)))
  expect_identical(summary(term("a[1]")), summary("a[1]"))
})

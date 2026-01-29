test_that("summary.term", {
  expect_identical(summary(term())[1:3], summary(character(0))[1:3])
  expect_identical(summary(term("a[1]"))[1:3], summary("a[1]")[1:3])

  expect_snapshot({
    summary(term("a[1]"))
  })
})

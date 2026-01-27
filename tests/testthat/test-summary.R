test_that("summary.term", {
  # Avoid deleting the snapshot file when run in R < 4.6
  expect_snapshot({
    "Dummy"
  })

  skip_if_not(getRversion() >= "4.6")

  expect_snapshot({
    summary(term("a[1]"))
    summary("a[1]")
  })

  expect_identical(summary(term())[1:3], summary(character(0))[1:3])
  expect_identical(summary(term("a[1]"))[1:3], summary("a[1]")[1:3])
})

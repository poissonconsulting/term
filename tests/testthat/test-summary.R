test_that("summary.term", {
  expect_identical(summary(term())[1:3], summary(character(0))[1:3])
  expect_identical(summary(term("a[1]"))[1:3], summary("a[1]")[1:3])

  ## TODO: turn on when minimum version is 4.6
  # skip_if_not(getRversion() >= "4.6")

  # expect_snapshot({
  #   summary(term("a[1]"))
  #   summary("a[1]")
  # })
})

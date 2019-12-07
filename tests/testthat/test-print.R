context("print")

test_that("print", {
  expect_match(capture.output(print(term(0))), "term[(]0[)]")
  expect_identical(
    capture.output(print(as.term(c(
      "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
      "beta[1,2]", "beta[2,2]", "sigma"
    )))),
    c(
      "[1] \"alpha[1]\"  \"alpha[2]\"  \"beta[1,1]\" \"beta[2,1]\" \"beta[1,2]\" \"beta[2,2]\"",
      "[7] \"sigma\"    "
    )
  )

  expect_identical(
    capture.output(print(as.term(c(
      "alpha[1]", "sigma", "alpha[2]", "beta[1,1]", "beta[2,1]",
      "beta[1,2]", "beta[2,2]"
    )))),
    c(
      "[1] \"alpha[1]\"  \"sigma\"     \"alpha[2]\"  \"beta[1,1]\" \"beta[2,1]\" \"beta[1,2]\"",
      "[7] \"beta[2,2]\""
    )
  )
})

test_that("print term", {
  expect_snapshot({
    term()

    term(alpha = 2, beta = c(2, 2), "sigma")

    term(
      "alpha[1]",
      "sigma",
      "alpha[2]",
      "beta[1,1]",
      "beta[2,1]",
      "beta[1,2]",
      "beta[2,2]"
    )

    new_term(c("with space", ""))

    term("r  [ 1  ,2  ]")
  })

  expect_snapshot(error = TRUE, term("r["))
})

test_that("print term_rcrd", {
  expect_snapshot({
    new_term_rcrd()

    as_term_rcrd(term(alpha = 2, beta = c(2, 2), "sigma"))
  })
})

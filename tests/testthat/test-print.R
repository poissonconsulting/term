test_that("print", {
  verify_output("out/print.txt", {
    term()

    term(alpha = 2, beta = c(2, 2), "sigma")

    term(
      "alpha[1]", "sigma", "alpha[2]", "beta[1,1]", "beta[2,1]",
      "beta[1,2]", "beta[2,2]"
    )

    new_term(c("with space", ""))

    term("r[")

    term("r  [ 1  ,2  ]")
  })
})

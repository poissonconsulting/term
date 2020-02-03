context("print")

test_that("print", {
  verify_output("out/print.txt", {
    term(0)

    new_term(c(
      "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
      "beta[1,2]", "beta[2,2]", "sigma"
    ))
    new_term(c(
      "alpha[1]", "sigma", "alpha[2]", "beta[1,1]", "beta[2,1]",
      "beta[1,2]", "beta[2,2]"
    ))
    new_term(c("with space", ""))
  })
})

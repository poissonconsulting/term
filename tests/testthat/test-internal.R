context("internal")

test_that("pdims2term", {
  expect_identical(pdims2term(list()), term())
  expect_identical(pdims2term(list(x = 1L)), as.term("x"))
  expect_identical(pdims2term(list(x = 1)), as.term("x"))
  expect_identical(pdims2term(list(y = 3)), as.term(c("y[1]", "y[2]", "y[3]")))
  expect_identical(pdims2term(list(y = 1, x = 1)), as.term(c("y", "x")))
  expect_identical(pdims2term(list(y = 1, x = 2)), as.term(c("y", "x[1]", "x[2]")))
  expect_identical(pdims2term(list(y = c(2L, 2L), x = 2)), 
                   as.term(c("y[1,1]", "y[2,1]", "y[1,2]", "y[2,2]", "x[1]", "x[2]")))
})

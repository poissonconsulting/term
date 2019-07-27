context("internal")

test_that("pdim2term", {
  expect_identical(pdim2term(integer(0), "par"), term())
  expect_identical(pdim2term(1L, "par"), as.term("par"))
  expect_identical(pdim2term(3L, "par"), as.term(c("par[1]", "par[2]", "par[3]")))
  expect_identical(pdim2term(10L, "par"), 
                   structure(c("par[1]", "par[2]", "par[3]", "par[4]", "par[5]", 
                               "par[6]", "par[7]", "par[8]", "par[9]", "par[10]"), 
                             class = c("term", "character")))
  expect_identical(pdim2term(c(1L, 1L), "par"), as.term("par[1,1]"))
  expect_identical(pdim2term(c(2L, 1L), "par"), as.term(c("par[1,1]", "par[2,1]")))
  expect_identical(pdim2term(c(2L, 2L), "par"), 
                   as.term(c("par[1,1]", "par[2,1]", "par[1,2]", "par[2,2]")))
  expect_identical(pdim2term(c(2L, 2L, 2L), "par2"), 
                   structure(c("par2[1,1,1]", "par2[2,1,1]", "par2[1,2,1]", "par2[2,2,1]", 
                               "par2[1,1,2]", "par2[2,1,2]", "par2[1,2,2]", "par2[2,2,2]"), 
                             class = c("term", "character")))
})

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

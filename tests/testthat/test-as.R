context("term")

test_that("term", {
  x <- c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]", "parm[2,1]", "parm[1,2]", "parm[10]", "parm3")
  x2 <- as.term(x)
  expect_is(x2, "term")
  expect_true(is.term(x2))
  x3 <- as.character(x2)
  expect_identical(x, x3)
  
  expect_identical(parameters(x2, terms = TRUE), c(rep("parm3", 2), rep("parm", 5), "parm3"))
  expect_identical(tindex(x2), 
                   list(`parm3[10]` = 10L, `parm3[2]` = 2L, 
                        `parm[2,2]` = c(2L, 2L), `parm[1,1]` = c(1L, 1L), 
                        `parm[2,1]` = 2:1, `parm[1,2]` = 1:2, 
                        `parm[10]` = 10L, parm3 = 1L))
  expect_identical(x2 > x2, rep(FALSE, length(x2)))
  
  expect_identical(sort(x2), as.term(c("parm[10]", "parm[1,1]", "parm[2,1]", "parm[1,2]",
                                       "parm[2,2]", "parm3", "parm3[2]", "parm3[10]")))
  
  expect_identical(as.term(x2), x2)
})

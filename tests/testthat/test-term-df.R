context("term-df")

test_that("", {
  expect_identical(term_df(1:3, "pr"), 
                   structure(list(term = structure(c("pr[1]", "pr[2]", "pr[3]"), class = c("term", 
                                                                                           "character")), n1 = 1:3), class = c("tbl_df", "tbl", "data.frame"
                                                                                           ), row.names = c(NA, -3L)))
  
  expect_identical(term_df(matrix(1:4, 2)), 
                   structure(list(term = structure(c("par[1,1]", "par[2,1]", "par[1,2]", 
"par[2,2]"), class = c("term", "character")), n1 = 1:4), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)))
  
  expect_error(term_df(data.frame(x = 1)), "no applicable method")
})

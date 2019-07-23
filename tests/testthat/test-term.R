context("term")

test_that("term", {
  expect_identical(term(), structure(character(0), class = c("term", "character")))
  expect_identical(term(c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]", "parm[2,1]", "parm[1,2]", "parm[10]", "parm3")),
                   structure(c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]", 
"parm[2,1]", "parm[1,2]", "parm[10]", "parm3"), class = c("term", 
"character")))
  expect_error(term(,1), "... must be unused")
})

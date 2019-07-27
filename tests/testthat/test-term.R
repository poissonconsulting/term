context("term")

test_that("term", {
  expect_identical(term(0L), structure(character(0), class = c("term", "character")))
  expect_identical(term(), term(0L))
  expect_identical(term(1L), as.term("par"))
  expect_identical(term(2L), as.term(c("par[1]", "par[2]")))

  expect_identical(term(integer(0), "par"), term())
  expect_identical(term(1L, "par"), as.term("par"))
  expect_identical(term(3L, "par"), as.term(c("par[1]", "par[2]", "par[3]")))
  expect_identical(term(10L, "par"), 
                   structure(c("par[1]", "par[2]", "par[3]", "par[4]", "par[5]", 
                               "par[6]", "par[7]", "par[8]", "par[9]", "par[10]"), 
                             class = c("term", "character")))
  expect_identical(term(c(1L, 1L), "par"), as.term("par[1,1]"))
  expect_identical(term(c(2L, 1L), "par"), as.term(c("par[1,1]", "par[2,1]")))
  expect_identical(term(c(2L, 2L), "par"), 
                   as.term(c("par[1,1]", "par[2,1]", "par[1,2]", "par[2,2]")))
  expect_identical(term(c(2L, 2L, 2L), "par2"), 
                   structure(c("par2[1,1,1]", "par2[2,1,1]", "par2[1,2,1]", "par2[2,2,1]", 
                               "par2[1,1,2]", "par2[2,1,2]", "par2[1,2,2]", "par2[2,2,2]"), 
                             class = c("term", "character")))
})

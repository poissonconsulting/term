context("unique")

test_that("unique", {
  expect_identical(unique(term()), term())
  expect_identical(unique(term("b")), term("b"))
  expect_identical(unique(term(c("b", "a"))), term(c("b", "a")))
  expect_identical(unique(term(c("b", "a", "b[1]"))), term(c("b", "a")))
  expect_identical(unique(term(c("b", "a", "b[1]", "b[3]"))), 
                   term(c("b[1]", "a", "b[3]")))
})

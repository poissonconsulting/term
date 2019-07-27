context("unique")

test_that("unique", {
  expect_error(unique(NA_term_, TRUE), "incomparables is ignored")
  expect_identical(unique(NA_term_), NA_term_)
  expect_identical(unique(c(NA_term_, NA_term_)), NA_term_)
  expect_identical(unique(term()), term())
  expect_identical(unique(term("b")), term("b"))
  expect_identical(unique(term(c("b", "a"))), term(c("b", "a")))
  expect_identical(unique(term(c("b", "a", "b[1]"))), term(c("b", "a", "b[1]")))
  expect_identical(unique(term(c("b", "a", "b[1]", "b[3]"))), 
                   term(c("b", "a", "b[1]", "b[3]")))
})

context("unique")

test_that("unique", {
  expect_error(unique(NA_term_, TRUE), "^`incomparables` must be FALSE[.]$",
    class = "chk_error"
  )
  expect_identical(unique(NA_term_), NA_term_)
  expect_identical(unique(c(NA_term_, NA_term_)), NA_term_)
  expect_identical(unique(term(0L)), term(0L))
  expect_identical(unique(as.term("b")), as.term("b"))
  expect_identical(unique(as.term(c("b", "a"))), as.term(c("b", "a")))
  expect_identical(unique(as.term(c("b", "a", "b[1]"))), as.term(c("b", "a", "b[1]")))
  expect_identical(
    unique(as.term(c("b", "a", "b[1]", "b[3]"))),
    as.term(c("b", "a", "b[1]", "b[3]"))
  )
})

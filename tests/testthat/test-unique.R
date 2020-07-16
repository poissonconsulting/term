test_that("unique incomparables", {
  expect_error(unique(NA_term_, incomparables = TRUE), "^`incomparables` must be FALSE[.]$",
    class = "chk_error"
  )
})

test_that("unique term", {
  expect_identical(unique(NA_term_), NA_term_)
  expect_identical(unique(c(NA_term_, NA_term_)), NA_term_)
  expect_identical(unique(new_term()), new_term())
  expect_identical(unique(new_term("b")), new_term("b"))
  expect_identical(unique(new_term(c("b", "a"))), new_term(c("b", "a")))
  expect_identical(unique(new_term(c("b", "a", "b[1]"))), new_term(c("b", "a")))
  expect_identical(
    unique(new_term(c("b", "a", "b[1]", "b[3]"))),
    new_term(c("b[1]", "a", "b[3]"))
  )
})

test_that("unique term_rcrd", {
  expect_identical(
    unique(as_term_rcrd(new_term(c("b", "a", "b[1]", "b[3]")))),
    as_term_rcrd(new_term(c("b[1]", "a", "b[3]")))
  )
})

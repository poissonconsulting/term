test_that("complete_terms term", {
  expect_error(complete_terms(NA_term_), "^`x` must not have any missing values[.]$",
    class = "chk_error"
  )
  expect_identical(complete_terms(new_term()), new_term())
  expect_error(
    complete_terms(new_term(c(NA_term_, "b[2]"))),
    "^`x` must not have any missing values[.]$",
    class = "chk_error"
  )
  expect_identical(complete_terms(new_term("b")), new_term("b"))
  expect_identical(complete_terms(new_term(c("b", "b"))), new_term(c("b", "b")))
  expect_identical(complete_terms(new_term("b")), new_term("b"))
  expect_identical(complete_terms(new_term("b[1]")), new_term("b"))
  expect_identical(
    complete_terms(new_term(c("b", "b[3]"))),
    new_term(c("b[1]", "b[3]", "b[2]"))
  )
  expect_identical(complete_terms(new_term("b[3]")), new_term(c("b[3]", "b[1]", "b[2]")))
  expect_identical(
    complete_terms(new_term(c("z[2,2]", "z[2,1]"))),
    new_term(c("z[2,2]", "z[2,1]", "z[1,1]", "z[1,2]"))
  )
  expect_error(complete_terms(new_term(c("b", "b[2,2]"))),
                   "`x` must have terms with consistent parameter dimensions.",
               class = "chk_error")
})

test_that("complete_terms term_rcrd", {
  expect_identical(complete_terms(new_term_rcrd()), new_term_rcrd())
  expect_error(
    complete_terms(term_rcrd(c(NA_term_, "b[2]"))),
    "^`x` must not have any missing values[.]$",
    class = "chk_error"
  )
  expect_identical(complete_terms(term_rcrd("b")), term_rcrd("b"))
  expect_identical(complete_terms(term_rcrd(c("b", "b"))), term_rcrd(c("b", "b")))
  expect_identical(complete_terms(term_rcrd("b")), term_rcrd("b"))
  expect_identical(complete_terms(term_rcrd("b[1]")), term_rcrd("b"))
  expect_identical(
    complete_terms(term_rcrd(c("b", "b[3]"))),
    term_rcrd(c("b[1]", "b[3]", "b[2]"))
  )
  expect_identical(complete_terms(term_rcrd("b[3]")), term_rcrd(c("b[3]", "b[1]", "b[2]")))
  expect_identical(
    complete_terms(term_rcrd(c("z[2,2]", "z[2,1]"))),
    term_rcrd(c("z[2,2]", "z[2,1]", "z[1,1]", "z[1,2]"))
  )
  expect_error(complete_terms(term_rcrd(c("b", "b[2,2]"))),
               "`x` must have terms with consistent parameter dimensions.",
               class = "chk_error")
})

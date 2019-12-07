context("repair-terms")

test_that("repair_terms", {
  expect_error(repair_terms(NA_character_), "`x` must inherit from S3 class 'term'.",
    class = "chk_error"
  )
  expect_identical(repair_terms(term(0L)), term(0L))
  expect_identical(repair_terms(NA_term_), NA_term_)
  expect_identical(repair_terms(as.term("")), NA_term_)
  expect_identical(repair_terms(as.term("a.a")), as.term("a.a"))
  expect_identical(repair_terms(as.term("a.")), as.term("a."))
  expect_identical(repair_terms(as.term(".a")), NA_term_)
  expect_identical(repair_terms(as.term("a_a")), as.term("a_a"))
  expect_identical(repair_terms(as.term("a_")), as.term("a_"))
  expect_identical(repair_terms(as.term("_a")), NA_term_)
  expect_identical(repair_terms(as.term("[1]")), NA_term_)
  expect_identical(repair_terms(as.term("b[]")), NA_term_)
  expect_identical(repair_terms(as.term("b[0]")), NA_term_)
  expect_identical(repair_terms(as.term("b[1,]")), NA_term_)
  expect_identical(repair_terms(as.term("a")), as.term("a"))
  expect_identical(repair_terms(as.term("a ")), as.term("a"))
  expect_identical(repair_terms(as.term("a [2]")), as.term("a[2]"))
  expect_identical(
    repair_terms(as.term(c("b [  3 ]", "a [2]"))),
    as.term(c("b[3]", "a[2]"))
  )
  expect_identical(repair_terms(as.term(c("a", ""))), as.term(c("a", NA)))
  expect_identical(repair_terms(as.term(c("a[1]", ""))), as.term(c("a", NA)))

  expect_identical(repair_terms(as.term(c("a[1]", "a[1]"))), as.term(c("a", "a")))
  expect_identical(repair_terms(as.term(c("a[2]", "a[1]"))), as.term(c("a[2]", "a[1]")))
  expect_identical(repair_terms(as.term(c("a[2]", "a"))), as.term(c("a[2]", "a[1]")))

  expect_identical(repair_terms(as.term(c("a[2,1]", "a"))), as.term(c("a[2,1]", "a[1]")))
})

test_that("repair_terms missing values", {
  expect_identical(repair_terms(NA_term_), NA_term_)
  expect_identical(repair_terms(c(NA_term_, "a")), as.term(c(NA_term_, "a")))
  expect_identical(repair_terms(as.term(c("a", NA_term_, "a"))), as.term(c("a", NA_term_, "a")))
  expect_identical(
    repair_terms(as.term(c(NA_character_, "a", NA_character_, "a"))),
    as.term(c(NA_term_, "a", NA_term_, "a"))
  )
})

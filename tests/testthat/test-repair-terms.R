test_that("repair_terms", {
  expect_error(repair_terms(NA_character_), "`x` must inherit from S3 class 'term'.",
    class = "chk_error"
  )
  expect_identical(repair_terms(new_term()), new_term())
  expect_identical(repair_terms(NA_term_), NA_term_)
  expect_identical(repair_terms(new_term("")), NA_term_)
  expect_identical(repair_terms(new_term("a.a")), new_term("a.a"))
  expect_identical(repair_terms(new_term("a.")), new_term("a."))
  expect_identical(repair_terms(new_term(".a")), NA_term_)
  expect_identical(repair_terms(new_term("a_a")), new_term("a_a"))
  expect_identical(repair_terms(new_term("a_")), new_term("a_"))
  expect_identical(repair_terms(new_term("_a")), NA_term_)
  expect_identical(repair_terms(new_term("[1]")), NA_term_)
  expect_identical(repair_terms(new_term("b[]")), NA_term_)
  expect_identical(repair_terms(new_term("b[0]")), NA_term_)
  expect_identical(repair_terms(new_term("b[1,]")), NA_term_)
  expect_identical(repair_terms(new_term("a")), new_term("a"))
  expect_identical(repair_terms(new_term("a ")), new_term("a"))
  expect_identical(repair_terms(new_term("a [2]")), new_term("a[2]"))
  expect_identical(
    repair_terms(new_term(c("b [  3 ]", "a [2]"))),
    new_term(c("b[3]", "a[2]"))
  )
  expect_identical(repair_terms(new_term(c("a", ""))), new_term(c("a", NA)))
  expect_identical(repair_terms(new_term(c("a[1]", ""))), new_term(c("a", NA)))

  expect_identical(repair_terms(new_term(c("a[1]", "a[1]"))), new_term(c("a", "a")))
  expect_identical(repair_terms(new_term(c("a[2]", "a[1]"))), new_term(c("a[2]", "a[1]")))
  expect_identical(repair_terms(new_term(c("a[2]", "a"))), new_term(c("a[2]", "a[1]")))

  expect_identical(repair_terms(new_term(c("a[2,1]", "a"))), new_term(c("a[2,1]", "a[1]")))
})

test_that("repair_terms missing values", {
  expect_identical(repair_terms(NA_term_), NA_term_)
  expect_identical(repair_terms(c(NA_term_, new_term("a"))), new_term(c(NA_term_, "a")))
  expect_identical(repair_terms(new_term(c("a", NA_term_, "a"))), new_term(c("a", NA_term_, "a")))
  expect_identical(
    repair_terms(new_term(c(NA_character_, "a", NA_character_, "a"))),
    new_term(c(NA_term_, "a", NA_term_, "a"))
  )
})

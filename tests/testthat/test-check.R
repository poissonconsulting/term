context("check")

test_that("check_term",{
  expect_error(check_term("a"), "a must be class term")
  expect_identical(check_term(term()), term())
  expect_identical(check_term(as.term("")), as.term(""))

  expect_error(check_term(as.term(c("b", "a")), sorted = TRUE), 
               "as.term[(]c[(]\"b\", \"a\"[)][)] must be sorted")
  
  expect_error(check_term(as.term(NA_character_), nas = TRUE), 
               "as.term[(]NA_character_[)] must not include missing values")

  expect_error(check_term(as.term(""), valid = TRUE), 
               "as.term[(]\"\"[)] must not require repairing")

  expect_error(check_term(as.term("a[2]"), complete = TRUE), 
               "as.term[(]\"a\\[2\\]\"[)] must be complete")
  
})

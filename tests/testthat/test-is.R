context("is")

test_that("is_term", {
  expect_false(is_term("parameter[1]"))
  expect_true(is_term(as.term(character(0))))
  expect_true(is_term(as.term("parameter[1]")))
})

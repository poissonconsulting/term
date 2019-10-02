context("is")

test_that("is.term", {
  expect_false(is.term("parameter[1]"))
  expect_true(is.term(as.term(character(0))))
  expect_true(is.term(as.term("parameter[1]")))
})

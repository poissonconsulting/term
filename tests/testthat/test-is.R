test_that("is_term", {
  expect_false(is_term("parameter[1]"))
  expect_true(is_term(new_term(character(0))))
  expect_true(is_term(new_term("parameter[1]")))
})

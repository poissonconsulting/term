context("vld")

test_that("vld_term", {
  expect_false(vld_term(c("x[2]", "x[1]")))
  expect_true(vld_term(as.term(c("x[2]", "x[1]"))))
  expect_true(vld_term(as.term(character(0))))
  expect_true(vld_term(as.term(NA_character_)))

  expect_true(vld_term(as.term(c("x[2]", "x[1"))))
  expect_false(vld_term(as.term(c("x[2]", "x[1")), validate = "valid"))
  expect_true(vld_term(as.term(c("x[2]", "x[1]")), validate = "valid"))
  expect_true(vld_term(as.term(c("x[2]", "x[1,1]")), validate = "valid"))
  expect_false(vld_term(as.term(c("x[2]", "x[1,1]")), validate = "consistent"))
  expect_true(vld_term(as.term(c("x[2,2]", "x[1,1]")), validate = "consistent"))
  expect_false(vld_term(as.term(c("x[2,2]", "x[1,1]")), validate = "complete"))
  expect_true(vld_term(as.term(c("x[2,1]", "x[1,1]")), validate = "complete"))
  expect_true(vld_term(as.term(c("x[2,1]", "x[1,1]", "x[1,1]")), validate = "complete"))
  expect_true(vld_term(as.term(c("x[2,1]", "x[1,1]", "x[1,1]", NA)), validate = "complete"))
})

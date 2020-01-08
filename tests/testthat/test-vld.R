context("vld")

test_that("vld_term", {
  expect_false(vld_term(c("x[2]", "x[1]")))
  expect_true(vld_term(as.term(c("x[2]", "x[1]"))))
  expect_false(vld_term(as.term(c("x[2]", "x[1]")), validate = "sorted"))
  expect_true(vld_term(as.term(c("x[1]", "x[2]")), validate = "sorted"))
  
  expect_false(vld_term(as.term(NA_character_)))
  expect_true(vld_term(as.term(NA_character_), any_na = TRUE))
  expect_true(vld_term(as.term(NA_character_), any_na = TRUE, validate = "sorted"))
  
  expect_true(vld_term(as.term(c("x[2]", "x[1"))))
  expect_false(vld_term(as.term(c("x[2]", "x[1")), validate = "valid"))
  expect_true(vld_term(as.term(c("x[2]", "x[1]")), validate = "valid"))
  expect_true(vld_term(as.term(c("x[2]", "x[1,1]")), validate = "valid"))
  expect_false(vld_term(as.term(c("x[2]", "x[1,1]")), validate = "consistent"))
  expect_true(vld_term(as.term(c("x[2,2]", "x[1,1]")), validate = "consistent"))
  expect_false(vld_term(as.term(c("x[2,2]", "x[1,1]")), validate = "complete"))
  expect_true(vld_term(as.term(c("x[2,1]", "x[1,1]")), validate = "complete"))
  expect_true(vld_term(as.term(c("x[2,1]", "x[1,1]", "x[1,1]")), validate = "complete"))
  expect_false(vld_term(as.term(c("x[2,1]", "x[1,1]", "x[1,1]")), validate = "unique"))
  expect_true(vld_term(as.term(c("x[2,1]", "x[1,1]")), validate = "unique"))
  expect_false(vld_term(as.term(c("x[2,1]", "x[1,1]")), validate = "sorted"))
  expect_true(vld_term(as.term(c("x[1,1]", "x[2,1]")), validate = "sorted"))
  expect_false(vld_term(as.term(c("x[1,1]", "x[2,1]", NA)), validate = "sorted"))
  expect_true(vld_term(as.term(c("x[1,1]", "x[2,1]", NA)), validate = "sorted",
                        any_na = TRUE))
})

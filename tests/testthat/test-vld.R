test_that("vld_term", {
  expect_false(vld_term(c("x[2]", "x[1]")))
  expect_true(vld_term(new_term(c("x[2]", "x[1]"))))
  expect_true(vld_term(new_term(character(0))))
  expect_true(vld_term(new_term(NA_character_)))

  rlang::with_options(lifecycle_verbosity = "error", {
    expect_error(vld_term(new_term(c("x[2]", "x[1")), validate = "class"), class = "defunctError")
  })
  rlang::with_options(lifecycle_verbosity = "quiet", {
    expect_true(vld_term(new_term(c("x[2]", "x[1")), validate = "class"))
  })
  expect_false(vld_term(new_term(c("x[2]", "x[1")), validate = "valid"))
  expect_true(vld_term(new_term(c("x[2]", "x[1]")), validate = "valid"))
  expect_true(vld_term(new_term(c("x[2]", "x[1,1]")), validate = "valid"))
  expect_false(vld_term(new_term(c("x[2]", "x[1,1]")), validate = "consistent"))
  expect_true(vld_term(new_term(c("x[2,2]", "x[1,1]")), validate = "consistent"))
  expect_false(vld_term(new_term(c("x[2,2]", "x[1,1]")), validate = "complete"))
  expect_true(vld_term(new_term(c("x[2,1]", "x[1,1]")), validate = "complete"))
  expect_false(vld_term(new_term(c("x[2,1]", "x[1,1]", "x[1,1]")), validate = "complete"))
    expect_true(vld_term(new_term(c("x[2,1]", "x[1,1]", "x[1,1]", "x[2,1]")), validate = "complete"))
  expect_true(vld_term(new_term(c("x[2,1]", "x[1,1]", "x[1,1]", "x[2,1]", NA)), validate = "complete"))
})

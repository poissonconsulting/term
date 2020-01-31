context("vld")

test_that("vld_term", {
  expect_false(vld_term(c("x[2]", "x[1]")))
  expect_true(vld_term(as.term(c("x[2]", "x[1]"))))
  expect_true(vld_term(as.term(character(0))))
  expect_true(vld_term(as.term(NA_character_)))

    rlang::with_options(lifecycle_verbosity = "error", {
      expect_error(vld_term(as.term(c("x[2]", "x[1")), validate = "class"), class = "defunctError")
    })
  rlang::with_options(lifecycle_verbosity = "quiet", {
  expect_true(vld_term(as.term(c("x[2]", "x[1")), validate = "class"))
  })
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

test_that("vld_pars", {
  expect_true(vld_pars(character(0)))
  expect_false(vld_pars(factor(0)))
  expect_false(vld_pars(NA_character_))
  expect_true(vld_pars("a"))
  expect_false(vld_pars(c("a", "a")))
  expect_true(vld_pars(c("a", "A")))
  expect_false(vld_pars("a[1]"))
  expect_true(vld_pars("a1._"))
  expect_false(vld_pars(".a"))
  expect_false(vld_pars("_a"))
  expect_false(vld_pars("1a"))
})

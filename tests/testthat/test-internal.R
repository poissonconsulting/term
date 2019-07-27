context("internal")

test_that(".pars", {
  expect_identical(.pars(character(0)), character(0))
  expect_identical(.pars("a"), "a")
  expect_identical(.pars(" a"), "a")
  expect_identical(.pars(" a "), "a")
  expect_identical(.pars(" a [1]"), "a")
  expect_identical(.pars(" a [1]", scalar_only = TRUE), character(0))
  expect_identical(.pars(c(" a [1]", "b"), scalar_only = TRUE), "b")
  expect_identical(.pars(NA_character_), NA_character_)
  expect_identical(.pars(c(NA_character_, "a")), c(NA_character_, "a"))
})

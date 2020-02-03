context("set-pars")

test_that("set_pars", {
  expect_identical(set_pars(as.term("a"), "b"), as.term("b"))
  expect_error(
    set_pars(as.term("a"), c("b", "a")),
    "^`value` must be length 1, not 2[.]$", class = "chk_error"
  )
  expect_error(
    set_pars(as.term(c("a", "a")), c("b", "a", "c")),
    "^`value` must be length 1, not 3[.]$", class = "chk_error"
  )
  expect_error(
    set_pars(as.term("a"), ""),
    "^`value` must match regular expression", class = "chk_error"
  )
  expect_error(
    set_pars(as.term("a"), "1"),
    "^`value` must match regular expression", class = "chk_error"
  )

  expect_identical(set_pars(as.term(c("a", "b")), c("b", "a")), as.term(c("b", "a")))
  expect_identical(set_pars(as.term(c("a", "b")), c("b", "d")), as.term(c("b", "d")))
  expect_identical(set_pars(as.term(c("a [ 1]", "b")), c("b", "d")), as.term(c("b [ 1]", "d")))
  expect_error(
    set_pars(as.term(rep("a", 7)), value = c("gamma", "theta", "rho")),
    "^`value` must be length 1, not 3[.]$", class = "chk_error"
  )
})

test_that("set_pars missing values", {
  expect_error(set_pars(as.term(c("a [ 1]", "b")), c("b", NA)),
    "^`value` must not have any missing values[.]$",
    class = "chk_error"
  )
  expect_error(set_pars(NA_term_, "a"), "^`x` must not have any missing values[.]$",
    class = "chk_error"
  )
  expect_error(
    set_pars(as.term(c("c c", "b")), "a"),
    "^All elements of term vector `x` must be valid[.]$", class = "chk_error"
  )
})

test_that("set_pars no values", {
  term <- as.term(character(0))
  expect_identical(set_pars(term, character(0)), term)
  expect_error(set_pars(term, "c"),
               "^`value` must be length 0, not 1[.]$",
               class = "chk_error")
})

test_that("set_pars missing values", {
  term <- as.term(c("a [1]", "a[3,2]", "b", "bb"))
  pars(term) <- c("c", "d", "cd")
  expect_identical(
    term,
    new_term(c("c [1]", "c[3,2]", "d", "cd"))
  )
})

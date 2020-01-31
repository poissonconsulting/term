context("chk")

test_that("chk_term", {
  expect_null(chk_term(as.term(character(0))))
  expect_null(chk_term(as.term(NA_character_)))
  expect_null(chk_term(as.term(c("x[2]", "x[1]"))))
  
  x <- c("x[2]", "x[1]")
  expect_error(chk_term(x), "^`x` must be a term vector[.]$", class = "chk_error")
  x <- as.term(c("x[2]", "x[1"))
  expect_error(chk_term(x, validate = "valid"), "^All elements of term vector `x` must be valid[.]$", class = "chk_error")
  x <- as.term(c("x[2]", "x[1,1]"))
  expect_error(chk_term(x, validate = "consistent"), "^All elements of term vector `x` must be consistent[.]$", class = "chk_error")
  x <- as.term(c("x[2,2]", "x[1,1]"))
  expect_error(chk_term(x, validate = "complete"), "^All elements of term vector `x` must be complete[.]$", class = "chk_error")
})

test_that("chk_pars", {
  expect_null(chk_pars(character(0)))
  expect_invisible(chk_pars(character(0)))
  expect_null(chk_pars("a"))
  expect_null(chk_pars(c("a", "A")))
  expect_null(chk_pars("a1._"))
  
  expect_error(chk_pars(NA_character_),
               "^`NA_character_` must not have any missing values[.]$", class = "chk_error")
  x <- c("a", "a")
  expect_error(chk_pars(x),
               "^`x` must be unique[.]$", class = "chk_error")
    x <- factor("a")
  expect_error(chk_pars(x),
               "^`x` must inherit from S3 class 'character'[.]$", class = "chk_error")
  x <- ".1"
  expect_error(chk_pars("."),
               "^`\".\"` must match regular expression", class = "chk_error")
})

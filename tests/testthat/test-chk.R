test_that("chk_term", {
  expect_null(chk_term(new_term(character(0))))
  expect_null(chk_term(new_term(NA_character_)))
  expect_null(chk_term(new_term(c("x[2]", "x[1]"))))

  x <- c("x[2]", "x[1]")
  expect_error(chk_term(x), "^`x` must be a term vector[.]$", class = "chk_error")
  x <- new_term(c("x[2]", "x[1"))
  expect_error(chk_term(x, validate = "valid"), "^All elements of term vector `x` must be valid[.]$", class = "chk_error")
  x <- new_term(c("x[2]", "x[1,1]"))
  expect_error(chk_term(x, validate = "consistent"), "^All elements of term vector `x` must be consistent[.]$", class = "chk_error")
  x <- new_term(c("x[2,2]", "x[1,1]"))
  expect_error(chk_term(x, validate = "complete"), "^All elements of term vector `x` must be complete[.]$", class = "chk_error")
})

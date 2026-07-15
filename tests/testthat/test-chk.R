test_that("chk_term", {
  expect_null(chk_term(new_term(character(0))))
  expect_null(chk_term(new_term(NA_character_)))
  expect_null(chk_term(new_term(c("x[2]", "x[1]"))))

  x <- c("x[2]", "x[1]")
  expect_snapshot(error = TRUE, chk_term(x))
  x <- new_term(c("x[2]", "x[1"))
  expect_snapshot(error = TRUE, chk_term(x, validate = "valid"))
  x <- new_term(c("x[2]", "x[1,1]"))
  expect_snapshot(error = TRUE, chk_term(x, validate = "consistent"))
  x <- new_term(c("x[2,2]", "x[1,1]"))
  expect_snapshot(error = TRUE, chk_term(x, validate = "complete"))
})

test_that("chk_term_rcrd", {
  expect_null(chk_term_rcrd(term_rcrd(character(0))))
  expect_null(chk_term_rcrd(term_rcrd(NA_character_)))
  expect_null(chk_term_rcrd(term_rcrd(c("x[2]", "x[1]"))))

  x <- c("x[2]", "x[1]")
  expect_snapshot(error = TRUE, chk_term_rcrd(x))
  x <- term_rcrd(c("x[2]", "x[1,1]"))
  expect_snapshot(error = TRUE, chk_term_rcrd(x, validate = "consistent"))
  x <- term_rcrd(c("x[2,2]", "x[1,1]"))
  expect_snapshot(error = TRUE, chk_term_rcrd(x, validate = "complete"))
})

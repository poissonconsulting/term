context("utils")

test_that("c.term", {
  expect_error(c(NA_term_, recursive = TRUE), "^`recursive` must be FALSE[.]$",
    class = "chk_error"
  )
  expect_identical(
    c(NA_term_, "b", "a[1]", ""),
    structure(c(NA, "b", "a[1]", ""), class = c("term", "character"))
  )
  expect_identical(c(NA_character_, "b", "a[1]", ""), c(NA_character_, "b", "a[1]", ""))
})

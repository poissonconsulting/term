context("valid-term")

test_that("valid_term", {
  expect_error(valid_term(NA_character_), "^`x` must inherit from S3 class 'term'[.]$",
    class = "chk_error"
  )
  expect_identical(valid_term(term(0L)), TRUE)
  expect_identical(valid_term(as.term(c("a", NA_character_))), c(TRUE, NA))
  expect_identical(
    valid_term(as.term(c("a", "a [3]", " b [ 1  ] ", "c[1]"))),
    rep(TRUE, 4)
  )
  expect_identical(
    valid_term(as.term(c("c[1,1]", "c[10]", "c[10,9,8]"))),
    rep(TRUE, 3)
  )
  expect_identical(
    valid_term(as.term(c("", "a b", "a[1]b", "a[0]", "b[1,]", "c[]", "d[1][2]"))),
    rep(FALSE, 7L)
  )
  expect_identical(
    valid_term(as.term(c("c[1 1]", "c[01,1]"))),
    rep(FALSE, 2L)
  )
})

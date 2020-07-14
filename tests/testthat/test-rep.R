test_that("rep term", {
  expect_identical(rep(as_term("a")), as_term("a"))
  expect_identical(rep(as_term("a"), 2), as_term(c("a", "a")))
  expect_identical(rep(as_term(c("a[2]", "a[1]")), 2), as_term(rep(c("a[2]", "a[1]"), 2)))
})

test_that("rep term_rcrd", {
  expect_identical(rep(as_term_rcrd("a")), as_term_rcrd("a"))
  expect_identical(rep(as_term_rcrd("a"), 2), as_term_rcrd(c("a", "a")))
  expect_identical(rep(as_term_rcrd(c("a[2]", "a[1]")), 2), as_term_rcrd(rep(c("a[2]", "a[1]"), 2)))
})

test_that("rep", {
  expect_identical(rep(as_term("a")), as_term("a"))
  expect_identical(rep(as_term("a"), 2), as_term(c("a", "a")))
  expect_identical(rep(as_term(c("a[2]", "a[1]")), 2), as_term(rep(c("a[2]", "a[1]"), 2)))
})

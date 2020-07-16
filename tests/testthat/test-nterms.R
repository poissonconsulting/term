test_that("nterms.term", {
  expect_identical(nterms(new_term()), 0L)
  expect_identical(nterms(NA_term_), 1L)
  expect_identical(nterms(c(NA_term_, new_term("a"))), 2L)
  expect_identical(nterms(new_term("a")), 1L)
  expect_identical(nterms(new_term(c("a", "a"))), 2L)
  expect_identical(nterms(new_term(c("a", "a b"))), 2L)
  expect_identical(nterms(new_term(c("a", "b"))), 2L)
  expect_identical(nterms(unique(new_term(c("a", "a[1]")))), 1L)
})

test_that("nterms.term_rcrd", {
  expect_identical(nterms(new_term_rcrd()), 0L)
  expect_identical(nterms(as_term_rcrd(new_term(c("a", "a[1]")))), 2L)
  expect_identical(nterms(as_term_rcrd(new_term(c("a", "a[1]")))), 2L)
})

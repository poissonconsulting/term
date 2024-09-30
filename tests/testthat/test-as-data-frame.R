test_that("as.data.frame.term_rcrd", {
  expect_identical(
    as.data.frame(term_rcrd()),
    data.frame(par = character(), dim = I(list()), stringsAsFactors = FALSE)
  )
  expect_identical(
    as.data.frame(term_rcrd("a")),
    data.frame(par = "a", dim = I(list(1L)), stringsAsFactors = FALSE)
  )
})

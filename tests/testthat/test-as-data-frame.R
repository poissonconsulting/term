test_that("as.data.frame.term_rcrd", {
  expect_identical(as.data.frame(term_rcrd()),
                   data.frame(par = character(), dim = I(list()), stringsAsFactors = default.stringsAsFactors()))
  expect_identical(as.data.frame(term_rcrd()),
                   data.frame(par = character(), dim = I(list()), stringsAsFactors = default.stringsAsFactors()))
})

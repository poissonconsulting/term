test_that("new_term_rcrd2", {
  expect_identical(new_term_rcrd2(),
                   structure(list(par = character(0), dim = list()), class = c("term_rcrd2",
                                                                               "vctrs_rcrd", "vctrs_vctr")))
  expect_identical(new_term_rcrd2(data.frame(par = c("x", "x", "y"), dim = I(list(1, 2, c(2,2))),
                                             stringsAsFactors = FALSE)),
                   structure(list(par = c("x", "x", "y"), dim = list(1, 2, c(2,
                                                                             2))), class = c("term_rcrd2", "vctrs_rcrd", "vctrs_vctr")))
})

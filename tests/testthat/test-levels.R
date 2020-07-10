test_that("rbind() works", {
  term <- term(x = 1)
  term_df <- data.frame(term)
  expect_identical(rbind(term_df, term_df), data.frame(term = c(term, term)))
})

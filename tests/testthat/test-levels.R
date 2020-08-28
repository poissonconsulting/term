test_that("rbind() works", {
  term <- term(x = 1)
  term_df <- data.frame(term = term)
  expect_identical(rbind(term_df, term_df), data.frame(term = c(term, term)))
})

test_that("rbind() works", {
  term <- term_rcrd("x[1]")
  term_df <- data.frame(term = term)
  expect_identical(rbind(term_df, term_df), data.frame(term = c(term, term)))
})

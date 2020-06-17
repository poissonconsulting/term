test_that("consistent_term", {
  expect_error(consistent_term(1), "`x` must inherit from S3 class 'term'.",
    class = "chk_error"
  )
  expect_identical(consistent_term(new_term()), logical(0))
  expect_identical(consistent_term(NA_term_), NA)
  expect_identical(consistent_term(new_term("a")), TRUE)
  expect_identical(consistent_term(new_term(c("a", "a"))), c(TRUE, TRUE))
  expect_identical(consistent_term(new_term(c("a", "a[1]"))), c(TRUE, TRUE))
  expect_identical(consistent_term(new_term(c("a", "a[2]"))), c(TRUE, TRUE))
  expect_identical(consistent_term(new_term(c("a[10]", "a[2]"))), c(TRUE, TRUE))
  expect_identical(consistent_term(new_term(c("a[2]", "a[2,1]"))), c(FALSE, FALSE))
  expect_identical(consistent_term(new_term(c("a[1,1]", "a[2,1]"))), c(TRUE, TRUE))
  expect_identical(consistent_term(new_term(c("a[1,1]", "a[2,1]", "a["))), c(FALSE, FALSE, FALSE))
  expect_identical(consistent_term(new_term(c("a[1,1]", "a[2,1]", "a[", "b"))), c(FALSE, FALSE, FALSE, TRUE))
})

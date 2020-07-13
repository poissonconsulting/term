test_that("term_rcrd", {
  expect_identical(term_rcrd(par = 0L), new_term_rcrd())
  expect_identical(term_rcrd(), new_term_rcrd())
  expect_identical(term_rcrd(0), new_term_rcrd())
  expect_identical(term_rcrd(0L), new_term_rcrd())
  expect_identical(term_rcrd(c(0, 3)), new_term_rcrd())
  expect_identical(term_rcrd(c(2, 0, 5)), new_term_rcrd())
  expect_identical(term_rcrd(par = 0), new_term_rcrd())
  expect_identical(term_rcrd(par = 1L), as_term_rcrd("par"))
  expect_identical(term_rcrd(par = 2L), as_term_rcrd(c("par[1]", "par[2]")))
})

test_that("term_rcrd.list", {
  expect_identical(term_rcrd(!!!list()), new_term_rcrd())
  expect_chk_error(term_rcrd("x", 1L))
  expect_identical(term_rcrd(x = 1L), as_term_rcrd("x"))
  expect_identical(term_rcrd(x = 0), new_term_rcrd())
  expect_identical(term_rcrd(x = 0, y = 1), as_term_rcrd("y"))
  expect_identical(term_rcrd(x = 1), as_term_rcrd("x"))
  expect_identical(term_rcrd(y = 3), as_term_rcrd(c("y[1]", "y[2]", "y[3]")))
  expect_identical(term_rcrd(y = 1, x = 1), as_term_rcrd(c("y", "x")))
  expect_identical(term_rcrd(!!!list(y = 1, x = 2)), as_term_rcrd(c("y", "x[1]", "x[2]")))
  expect_identical(
    term_rcrd(!!!list(y = c(2L, 2L), x = 2)),
    as_term_rcrd(c("y[1,1]", "y[2,1]", "y[1,2]", "y[2,2]", "x[1]", "x[2]"))
  )
})

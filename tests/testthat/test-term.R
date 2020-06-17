test_that("term", {
  expect_identical(term(par = 0L), new_term())
  expect_identical(term(), new_term())
  expect_identical(term(0), new_term())
  expect_identical(term(0L), new_term())
  expect_identical(term(c(0, 3)), new_term())
  expect_identical(term(c(2, 0, 5)), new_term())
  expect_identical(term(par = 0), new_term())
  expect_identical(term(par = 1L), new_term("par"))
  expect_identical(term(par = 2L), new_term(c("par[1]", "par[2]")))

  expect_identical(term(par = integer(0)), new_term())
  expect_identical(term(par = 1L), new_term("par"))
  expect_identical(term(par = 3L), new_term(c("par[1]", "par[2]", "par[3]")))
  expect_identical(
    term(par = 10L),
    new_term(c(
      "par[1]", "par[2]", "par[3]", "par[4]", "par[5]",
      "par[6]", "par[7]", "par[8]", "par[9]", "par[10]"
    ))
  )
  expect_identical(term(par = c(1L, 1L)), new_term("par[1,1]"))
  expect_identical(term(par = c(2L, 1L)), new_term(c("par[1,1]", "par[2,1]")))
  expect_identical(
    term(par = c(2L, 2L)),
    new_term(c("par[1,1]", "par[2,1]", "par[1,2]", "par[2,2]"))
  )
  expect_identical(
    term(par2 = c(2L, 2L, 2L)),
    new_term(c(
      "par2[1,1,1]", "par2[2,1,1]", "par2[1,2,1]", "par2[2,2,1]",
      "par2[1,1,2]", "par2[2,1,2]", "par2[1,2,2]", "par2[2,2,2]"
    ))
  )

  expect_identical(term("a"), new_term("a"))
  expect_identical(term("a", "b"), new_term(c("a", "b")))
  expect_identical(term(NA), new_term(NA_character_))
  expect_identical(term("a", NA), new_term(c("a", NA)))
})

test_that("term.list", {
  expect_identical(term(!!!list()), new_term())
  expect_chk_error(term("x", 1L))
  expect_identical(term(x = 1L), new_term("x"))
  expect_identical(term(x = 0), new_term())
  expect_identical(term(x = 0, y = 1), new_term("y"))
  expect_identical(term(x = 1), new_term("x"))
  expect_identical(term(y = 3), new_term(c("y[1]", "y[2]", "y[3]")))
  expect_identical(term(y = 1, x = 1), new_term(c("y", "x")))
  expect_identical(term(!!!list(y = 1, x = 2)), new_term(c("y", "x[1]", "x[2]")))
  expect_identical(
    term(!!!list(y = c(2L, 2L), x = 2)),
    new_term(c("y[1,1]", "y[2,1]", "y[1,2]", "y[2,2]", "x[1]", "x[2]"))
  )
})

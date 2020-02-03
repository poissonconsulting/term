test_that("term()", {
  expect_identical(term(par = 0L), new_term())
  expect_identical(term(), new_term())
  expect_identical(term(NA), NA_term_)
  expect_identical(term(NA_character_), NA_term_)
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
})

test_that("term() with list", {
  expect_identical(term(!!!list()), new_term())
  expect_error(term("x", 1L), class = "vctrs_error_incompatible")
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


test_that("term() with term", {
  expect_identical(term(new_term()), new_term())
  expect_identical(term(new_term("a")), new_term("a"))
  expect_identical(term(term("a", "b"), "c"), new_term(c("a", "b", "c")))
  expect_identical(term(NA_term_), NA_term_)
  expect_identical(term("a", NA_term_), new_term(c("a", NA)))
})

test_that("as.term.matrix", {
  expect_identical(
    term(t = dims(matrix(1)[-1, -1])),
    new_term(character(0))
  )
  expect_identical(
    term(t = dims(matrix(1:12, c(3, 4)))),
    new_term(c(
      "t[1,1]", "t[2,1]", "t[3,1]", "t[1,2]", "t[2,2]",
      "t[3,2]", "t[1,3]", "t[2,3]", "t[3,3]", "t[1,4]", "t[2,4]", "t[3,4]"
    ))
  )
})

test_that("as.term.array", {
  expect_identical(
    term(t = dims(array(1, c(1, 1, 1))[-1, -1, -1])),
    new_term(character(0))
  )
  expect_identical(
    term(t = dims(array(1:12, c(2, 3, 2)))),
    new_term(c(
      "t[1,1,1]", "t[2,1,1]", "t[1,2,1]", "t[2,2,1]", "t[1,3,1]",
      "t[2,3,1]", "t[1,1,2]", "t[2,1,2]", "t[1,2,2]", "t[2,2,2]", "t[1,3,2]",
      "t[2,3,2]"
    ))
  )
})

test_that("as.term.character", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")

  expect_error(as.term("a", "b"), "^`repair` must be a flag [(]TRUE or FALSE[)][.]$", class = "chk_error")
  x <- c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]", "parm[2,1]", "parm[1,2]", "parm[10]", "parm3")


  expect_identical(
    as.term(c("a", "a[", NA, "a[1]")),
    new_term(c("a", "a[", NA, "a[1]"))
  )

  expect_identical(
    as.term(c("a", "a[", NA, "a[1]"), repair = TRUE),
    new_term(c("a", NA, NA, "a"))
  )

  x2 <- as.term(x)
  expect_is(x2, "term")
  expect_true(is_term(x2))
  x3 <- as.character(x2)
  expect_identical(x, x3)

  expect_identical(pars_terms(x2), c(rep("parm3", 2), rep("parm", 5), "parm3"))
  expect_identical(
    tindex(x2),
    list(
      `parm3[10]` = 10L, `parm3[2]` = 2L,
      `parm[2,2]` = c(2L, 2L), `parm[1,1]` = c(1L, 1L),
      `parm[2,1]` = 2:1, `parm[1,2]` = 1:2,
      `parm[10]` = 10L, `parm3` = 1L
    )
  )
  expect_identical(x2 > x2, rep(FALSE, length(x2)))

  expect_identical(sort(x2), new_term(c(
    "parm[10]", "parm[1,1]", "parm[2,1]", "parm[1,2]",
    "parm[2,2]", "parm3", "parm3[2]", "parm3[10]"
  )))

  expect_identical(as.term(x2), x2)
})

test_that("as.term others", {
  expect_error(term(factor(1)), class = "vctrs_error_incompatible")
  expect_error(term(a = factor(1)), class = "chk_error")
  expect_error(term(data.frame(x = 1)), class = "vctrs_error_incompatible")
  expect_error(term(a = data.frame(x = 1)), class = "chk_error")
  expect_error(term(TRUE), class = "vctrs_error_incompatible")
  expect_error(term(a = TRUE), class = "chk_error")
})

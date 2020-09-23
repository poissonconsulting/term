test_that("as_term.integer", {
  expect_identical(as_term(1L, name = "par"), new_term("par"))
  expect_identical(
    as_term(c(1L, 4L), name = "par"),
    new_term(c("par[1]", "par[2]"))
  )
  expect_identical(
    as_term(integer(0), name = "par"),
    new_term(character(0))
  )
})

test_that("as_term.double", {
  expect_identical(as_term(1, name = "par"), new_term("par"))
  expect_identical(
    as_term(c(1, 4), name = "par"),
    new_term(c("par[1]", "par[2]"))
  )
  expect_identical(
    as_term(double(0), name = "par"),
    new_term(character(0))
  )
})

test_that("as_term.matrix", {
  expect_identical(
    as_term(matrix(1)[-1, -1], "t"),
    new_term(character(0))
  )
  expect_identical(
    as_term(matrix(1:12, c(3, 4)), "t"),
    new_term(c(
      "t[1,1]", "t[2,1]", "t[3,1]", "t[1,2]", "t[2,2]",
      "t[3,2]", "t[1,3]", "t[2,3]", "t[3,3]", "t[1,4]", "t[2,4]", "t[3,4]"
    ))
  )
})

test_that("as_term.array", {
  expect_identical(
    as_term(array(1, c(1, 1, 1))[-1, -1, -1], "t"),
    new_term(character(0))
  )
  expect_identical(
    as_term(array(1:12, c(2, 3, 2)), "t"),
    new_term(c(
      "t[1,1,1]", "t[2,1,1]", "t[1,2,1]", "t[2,2,1]", "t[1,3,1]",
      "t[2,3,1]", "t[1,1,2]", "t[2,1,2]", "t[1,2,2]", "t[2,2,2]", "t[1,3,2]",
      "t[2,3,2]"
    ))
  )
})

test_that("as_term.character", {
  expect_error(as_term("a", "b"), "^`repair` must be a flag [(]TRUE or FALSE[)][.]$", class = "chk_error")
  x <- c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]", "parm[2,1]", "parm[1,2]", "parm[10]", "parm3")

  expect_identical(
    as_term(c("a", "a[", NA, "a[1]")),
    new_term(c("a", "a[", NA, "a[1]"))
  )

  expect_identical(
    as_term(c("a", "a[", NA, "a[1]"), repair = TRUE),
    new_term(c("a", NA, NA, "a"))
  )

  x2 <- as_term(x)
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

  expect_identical(as_term(x2), x2)
})

test_that("as_term others", {
  expect_identical(as_term(new_term_rcrd()), new_term())
})

test_that("as_term others", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")

  expect_error(as_term(factor(1)), class = "vctrs_error")
  expect_error(as_term(data.frame(x = 1)), class = "vctrs_error")
  expect_error(as_term(TRUE), class = "vctrs_error")
})

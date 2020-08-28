test_that("as_term_rcrd2.term", {
  expect_identical(as_term_rcrd2(as_term("x[1]")), new_term_rcrd2(data.frame(par = "x", dim = I(list(1L)),
                                                                           stringsAsFactors = FALSE)))

})

test_that("as_term_rcrd2.integer", {
  expect_identical(as_term_rcrd2(1L, name = "par"), as_term_rcrd2(as_term("par[1]")))
  expect_identical(
    as_term_rcrd2(c(1L, 4L), name = "par"),
    as_term_rcrd2(as_term(c("par[1]", "par[2]")))
  )
  expect_identical(
    as_term_rcrd2(integer(0), name = "par"),
    as_term_rcrd2(as_term(character(0)))
  )
})

test_that("as_term_rcrd2.double", {
  expect_identical(as_term_rcrd2(1, name = "par"), as_term_rcrd2(as_term("par")))
  expect_identical(
    as_term_rcrd2(c(1, 4), name = "par"),
    as_term_rcrd2(as_term(c("par[1]", "par[2]")))
  )
  expect_identical(
    as_term_rcrd2(double(0), name = "par"),
    as_term_rcrd2(as_term(character(0)))
  )
})

test_that("as_term_rcrd2.matrix", {
  expect_identical(
    as_term_rcrd2(matrix(1)[-1, -1], "t"),
    as_term_rcrd2(as_term(character(0)))
  )
  expect_identical(
    as_term_rcrd2(matrix(1:12, c(3, 4)), "t"),
    as_term_rcrd2(as_term(c(
      "t[1,1]", "t[2,1]", "t[3,1]", "t[1,2]", "t[2,2]",
      "t[3,2]", "t[1,3]", "t[2,3]", "t[3,3]", "t[1,4]", "t[2,4]", "t[3,4]"
    )))
  )
})

test_that("as_term_rcrd2.array", {
  expect_identical(
    as_term_rcrd2(array(1, c(1, 1, 1))[-1, -1, -1], "t"),
    as_term_rcrd2(as_term(character(0)))
  )
  expect_identical(
    as_term_rcrd2(array(1:12, c(2, 3, 2)), "t"),
    as_term_rcrd2(as_term(c(
      "t[1,1,1]", "t[2,1,1]", "t[1,2,1]", "t[2,2,1]", "t[1,3,1]",
      "t[2,3,1]", "t[1,1,2]", "t[2,1,2]", "t[1,2,2]", "t[2,2,2]", "t[1,3,2]",
      "t[2,3,2]"
    )))
  )
})

test_that("as_term_rcrd2.character", {
  expect_error(as_term_rcrd2("a", "b"), "^`repair` must be a flag [(]TRUE or FALSE[)][.]$", class = "chk_error")
  x <- c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]", "parm[2,1]", "parm[1,2]", "parm[10]", "parm3")


  expect_identical(
    as_term_rcrd2(c("a", "a[", NA, "a[1]")),
    as_term_rcrd2(as_term(c("a", "a[", NA, "a[1]")))
  )

  expect_identical(
    as_term_rcrd2(c("a", "a[", NA, "a[1]"), repair = TRUE),
    as_term_rcrd2(as_term(c("a", NA, NA, "a")))
  )

  x2 <- as_term_rcrd2(x)
  expect_is(x2, "term_rcrd2")
  expect_true(is_term_rcrd2(x2))
  x3 <- as.character(x2)
  expect_identical(x3, c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]", "parm[2,1]", "parm[1,2]", "parm[10]", "parm3[1]"))

  expect_identical(pars_terms(x2), c(rep("parm3", 2), rep("parm", 5), "parm3"))
  #  expect_identical(x2 > x2, rep(FALSE, length(x2)))

  # expect_identical(sort(x2), new_term(c(
  #   "parm[10]", "parm[1,1]", "parm[2,1]", "parm[1,2]",
  #   "parm[2,2]", "parm3", "parm3[2]", "parm3[10]"
  # )))
  #
  # expect_identical(as_term_rcrd2(x2), x2)
})

test_that("as_term_rcrd2 others", {
  expect_error(as_term_rcrd2(factor(1)), "no applicable method")
  expect_error(as_term_rcrd2(data.frame(x = 1)), "no applicable method")
  expect_error(as_term_rcrd2(TRUE), "no applicable method")
})

test_that("as_term_rcrd2 missing values", {
  expect_identical(as_term_rcrd2(NA_term_), structure(list(par = NA_character_, dim = list(NA_integer_)), class = c("term_rcrd2",
                                                                                                                    "vctrs_rcrd", "vctrs_vctr")))
})

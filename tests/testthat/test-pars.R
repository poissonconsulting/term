context("pars")

test_that("pars", {
  expect_identical(pars(as.term(character(0))), character(0))
  expect_identical(pars(as.term("a")), "a")
  expect_identical(pars(as.term(NA_character_)), NA_character_)
  expect_identical(pars(as.term(c(NA_character_, "a"))), c(NA_character_, "a"))
})

test_that("pars.term", {
  terms <- as.term(c(
    "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
    "beta[1,2]", "beta[2,2]", "sigma"
  ))
  expect_identical(pars(terms), c("alpha", "beta", "sigma"))
  expect_identical(pars(terms, scalar = TRUE), "sigma")
  expect_identical(pars(terms, scalar = TRUE, terms = TRUE), "sigma")
  expect_identical(
    pars(terms, terms = TRUE),
    c("alpha", "alpha", "beta", "beta", "beta", "beta", "sigma")
  )
})

test_that("pars.term", {
  expect_identical(pars(as.term("b")), "b")
  expect_identical(pars(as.term("b"), scalar = TRUE), "b")
  expect_identical(pars(as.term("b[1]")), "b")
  expect_identical(pars(as.term("b[1]"), scalar = TRUE), character(0))
  expect_identical(pars(as.term(c("b", "b[1]"))), "b")
  expect_identical(pars(as.term(c("b", "b[1]")), scalar = TRUE), "b")
  expect_identical(pars(as.term(c("b", "b[1]", "b[2]"))), "b")
  expect_identical(pars(as.term(c("b", "b[1]", "b[2]")), scalar = TRUE), "b")
  expect_identical(pars(as.term(c("b[1]", "b[2]"))), "b")
  expect_identical(pars(as.term(c("b[1]", "b[2]")), scalar = TRUE), character(0))
})

test_that("pars.term missing values", {
  expect_identical(pars(as.term(NA_character_)), NA_character_)
  expect_identical(pars(as.term(c(NA_character_, "a"))), c(NA_character_, "a"))
  expect_identical(pars(as.term(c("a", NA_character_, "a"))), c("a", NA_character_))
  expect_identical(
    pars(as.term(c(NA_character_, "a", NA_character_, "a"))),
    c(NA_character_, "a")
  )

  expect_identical(pars(as.term(NA_character_), term = TRUE), NA_character_)
  expect_identical(
    pars(as.term(c(NA_character_, "a")), term = TRUE),
    c(NA_character_, "a")
  )
  expect_identical(
    pars(as.term(c("a", NA_character_, "a")), term = TRUE),
    c("a", NA_character_, "a")
  )
  expect_identical(
    pars(as.term(c(NA_character_, "a", NA_character_, "a")), term = TRUE),
    c(NA_character_, "a", NA_character_, "a")
  )

  expect_identical(pars(as.term(NA_character_), scalar = TRUE), NA_character_)
  expect_identical(
    pars(as.term(c(NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )
  expect_identical(
    pars(as.term(c("a", NA_character_, "a")), scalar = TRUE),
    c("a", NA_character_)
  )
  expect_identical(
    pars(as.term(c(NA_character_, "a", NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )
  expect_identical(
    pars(as.term(c("a[1]", NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )
  expect_identical(
    pars(as.term(c("a[2]", NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )
  expect_identical(
    pars(as.term(c("b[2]", NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )
})

test_that("set_pars", {
  expect_identical(set_pars(as.term("a"), "b"), as.term("b"))
  expect_error(
    set_pars(as.term("a"), c("b", "a")),
    "^`value` must be length 1, not 2[.]$"
  )
  expect_error(
    set_pars(as.term(c("a", "a")), c("b", "a", "c")),
    "^`value` must be length 1, not 3[.]$"
  )
  expect_error(
    set_pars(as.term("a"), ""),
    "^`value` must be a valid parameter name[.]$"
  )
  expect_error(
    set_pars(as.term("a"), "1"),
    "^`value` must be a valid parameter name[.]$"
  )

  expect_identical(set_pars(as.term(c("a", "b")), c("b", "a")), as.term(c("b", "a")))
  expect_identical(set_pars(as.term(c("a", "b")), c("b", "d")), as.term(c("b", "d")))
  expect_identical(set_pars(as.term(c("a [ 1]", "b")), c("b", "d")), as.term(c("b [ 1]", "d")))
  expect_error(
    set_pars(as.term(rep("a", 7)), pars = c("gamma", "theta", "rho")),
    "^`value` must be length 1, not 3[.]$"
  )
})

test_that("set_pars missing values", {
  expect_error(set_pars(as.term(c("a [ 1]", "b")), c("b", NA)),
    "^`value` must not have any missing values[.]$",
    class = "chk_error"
  )
  expect_error(set_pars(NA_term_, "a"), "^`x` must not have any missing values[.]$",
    class = "chk_error"
  )
  expect_error(
    set_pars(as.term(c("c c", "b")), "a"),
    "^`x` must not include invalid terms[.]$"
  )
})

test_that("set_pars missing values", {
  term <- as.term(c("a [1]", "a[3,2]", "b", "bb"))
  pars(term) <- c("c", "d", "cd")
  expect_identical(
    term,
    structure(c("c [1]", "c[3,2]", "d", "cd"),
      class = c("term", "character")
    )
  )
})

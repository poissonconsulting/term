test_that("pars", {
  expect_identical(pars(new_term(character(0))), character(0))
  expect_identical(pars(new_term("a")), "a")
  expect_identical(pars(new_term(NA_character_)), NA_character_)
  expect_identical(pars(new_term(c(NA_character_, "a"))), c(NA_character_, "a"))
})

test_that("pars.term", {
  terms <- new_term(c(
    "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
    "beta[1,2]", "beta[2,2]", "sigma"
  ))
  expect_identical(pars(terms), c("alpha", "beta", "sigma"))
  expect_identical(pars(terms, scalar = TRUE), "sigma")
})

test_that("pars.term deprecated terms", {
  terms <- new_term(c(
    "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
    "beta[1,2]", "beta[2,2]", "sigma"
  ))

  rlang::with_options(lifecycle_verbosity = "error", {
    expect_error(pars(terms, scalar = TRUE, terms = TRUE), class = "defunctError")
  })

  rlang::with_options(lifecycle_verbosity = "quiet", {
    expect_identical(pars(terms, scalar = TRUE, terms = TRUE), "sigma")
  })

  rlang::with_options(lifecycle_verbosity = "quiet", {
    expect_identical(
      pars(terms, terms = TRUE),
      c("alpha", "alpha", "beta", "beta", "beta", "beta", "sigma")
    )
  })
})

test_that("pars.term", {
  expect_identical(pars(new_term("b")), "b")
  expect_identical(pars(new_term("b"), scalar = TRUE), "b")
  expect_identical(pars(new_term("b[1]")), "b")
  expect_identical(pars(new_term("b[1]"), scalar = TRUE), character(0))
  expect_identical(pars(new_term(c("b", "b[1]"))), "b")
  expect_identical(pars(new_term(c("b", "b[1]")), scalar = TRUE), "b")
  expect_identical(pars(new_term(c("b", "b[1]", "b[2]"))), "b")
  expect_identical(pars(new_term(c("b", "b[1]", "b[2]")), scalar = TRUE), "b")
  expect_identical(pars(new_term(c("b[1]", "b[2]"))), "b")
  expect_identical(pars(new_term(c("b[1]", "b[2]")), scalar = TRUE), character(0))
})

test_that("pars.term missing values", {
  expect_identical(pars(new_term(NA_character_)), NA_character_)
  expect_identical(pars(new_term(c(NA_character_, "a"))), c(NA_character_, "a"))
  expect_identical(pars(new_term(c("a", NA_character_, "a"))), c("a", NA_character_))
  expect_identical(
    pars(new_term(c(NA_character_, "a", NA_character_, "a"))),
    c(NA_character_, "a")
  )

  expect_identical(pars(new_term(NA_character_), scalar = TRUE), NA_character_)
  expect_identical(
    pars(new_term(c(NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )
  expect_identical(
    pars(new_term(c("a", NA_character_, "a")), scalar = TRUE),
    c("a", NA_character_)
  )
  expect_identical(
    pars(new_term(c(NA_character_, "a", NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )
  expect_identical(
    pars(new_term(c("a[1]", NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )
  expect_identical(
    pars(new_term(c("a[2]", NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )
  expect_identical(
    pars(new_term(c("b[2]", NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )
})

test_that("pars scalar = TRUE", {
  expect_identical(pars(new_term(character(0)), scalar = TRUE), character(0))
  expect_identical(pars(new_term("a"), scalar = TRUE), "a")
  expect_identical(pars(new_term(NA_character_), scalar = TRUE), NA_character_)
  expect_identical(pars(new_term(c(NA_character_, "a")), scalar = TRUE), c(NA_character_, "a"))
})

test_that("pars scalar = FALSE", {
  expect_identical(pars(new_term(character(0)), scalar = FALSE), character(0))
  expect_identical(pars(new_term("a"), scalar = FALSE), character(0))
  expect_identical(pars(new_term(NA_character_), scalar = FALSE), NA_character_)
  expect_identical(pars(new_term(c(NA_character_, "a")), scalar = FALSE), c(NA_character_))
})

test_that("pars.default scalar = TRUE", {
  expect_identical(pars(character(0), scalar = TRUE), character(0))
  expect_identical(pars("a", scalar = TRUE), "a")
  expect_identical(pars(c("a", "a"), scalar = TRUE), "a")
  expect_identical(pars(c("b", "a"), scalar = TRUE), c("b", "a"))
  expect_identical(pars(c("b[2]", "a"), scalar = TRUE), "a")
  expect_chk_error(pars(c("b b", "a"), scalar = TRUE), "a")
})

test_that("pars.default scalar = FALSE", {
  expect_identical(pars(character(0), scalar = FALSE), character(0))
  expect_identical(pars("a", scalar = FALSE), character(0))
  expect_identical(pars(c("a", "a"), scalar = FALSE), character(0))
  expect_identical(pars(c("b", "a"), scalar = FALSE), character(0))
  expect_identical(pars(c("b[2]", "a"), scalar = FALSE), "b")
  expect_chk_error(pars(c("b b", "a"), scalar = FALSE), "a")
})

test_that("pars.term scalar = TRUE", {
  terms <- new_term(c(
    "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
    "beta[1,2]", "beta[2,2]", "sigma"
  ))
  expect_identical(pars(terms, scalar = TRUE), "sigma")
})

test_that("pars.term scalar = FALSE", {
  terms <- new_term(c(
    "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
    "beta[1,2]", "beta[2,2]", "sigma"
  ))
  expect_identical(pars(terms, scalar = FALSE), c("alpha", "beta"))
})

test_that("pars.term scalar = TRUE", {
  expect_identical(pars(new_term("b"), scalar = TRUE), "b")
  expect_identical(pars(new_term("b[1]"), scalar = TRUE), character(0))
  expect_identical(pars(new_term(c("b", "b[1]")), scalar = TRUE), "b")
  expect_identical(pars(new_term(c("b", "b[1]", "b[2]"))), "b")
  expect_identical(pars(new_term(c("b", "b[1]", "b[2]")), scalar = TRUE), "b")
  expect_identical(pars(new_term(c("b[1]", "b[2]")), scalar = TRUE), character(0))
})

test_that("pars.term scalar missing values", {
  expect_identical(pars(new_term(NA_character_), scalar = TRUE), NA_character_)
  expect_identical(pars(new_term(c(NA_character_, "a")), scalar = TRUE), c(NA_character_, "a"))
  expect_identical(pars(new_term(c("a", NA_character_, "a")), scalar = TRUE), c("a", NA_character_))
  expect_identical(
    pars(new_term(c(NA_character_, "a", NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )

  expect_identical(
    pars(new_term(c("a[1]", NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )
  expect_identical(
    pars(new_term(c("a[2]", NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )
  expect_identical(
    pars(new_term(c("b[2]", NA_character_, "a")), scalar = TRUE),
    c(NA_character_, "a")
  )
})

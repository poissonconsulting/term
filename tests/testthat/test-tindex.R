test_that("tindex", {
  term <- new_term(c(
    "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
    "beta[1,2]", "sigma", "beta[2,2]"
  ))
  expect_identical(
    tindex(term),
    list(
      `alpha[1]` = 1L, `alpha[2]` = 2L,
      `beta[1,1]` = c(1L, 1L), `beta[2,1]` = 2:1,
      `beta[1,2]` = 1:2, sigma = 1L,
      `beta[2,2]` = c(2L, 2L)
    )
  )

  expect_identical(
    tindex(new_term(NA_character_)),
    rlang::set_names(list(NA_integer_), NA_character_)
  )

  expect_identical(
    tindex(new_term(c("a", NA_character_))),
    rlang::set_names(list(1L, NA_integer_), c("a", NA))
  )

  expect_identical(
    tindex(NA_term_),
    rlang::set_names(list(NA_integer_), NA_character_)
  )

  expect_identical(
    tindex(new_term(c("alpha", "alpha[2]", "beta[1,1]", "beta[2 ,1  ]", NA))),
    rlang::set_names(
      list(1L, 2L, c(1L, 1L), 2:1, NA_integer_),
      c("alpha", "alpha[2]", "beta[1,1]", "beta[2 ,1  ]", NA)
    )
  )

  expect_identical(
    tindex(as_term_rcrd(c("alpha", "alpha[2]", "beta[1,1]", "beta[2 ,1  ]", NA))),
    rlang::set_names(
      list(1L, 2L, c(1L, 1L), 2:1, NA_integer_),
      c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", NA)
    )
  )
})

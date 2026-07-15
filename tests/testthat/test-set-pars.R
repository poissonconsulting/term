test_that("set_pars", {
  expect_identical(set_pars(new_term("a"), "b"), new_term("b"))
  expect_snapshot(error = TRUE, set_pars(new_term("a"), c("b", "a")))
  expect_snapshot(
    error = TRUE,
    set_pars(new_term(c("a", "a")), c("b", "a", "c"))
  )
  expect_snapshot(error = TRUE, set_pars(new_term("a"), ""))
  expect_snapshot(error = TRUE, set_pars(new_term("a"), "1"))

  expect_identical(
    set_pars(new_term(c("a", "b")), c("b", "a")),
    new_term(c("b", "a"))
  )
  expect_identical(
    set_pars(new_term(c("a", "b")), c("b", "d")),
    new_term(c("b", "d"))
  )
  expect_identical(
    set_pars(new_term(c("a [ 1]", "b")), c("b", "d")),
    new_term(c("b [ 1]", "d"))
  )
  expect_snapshot(
    error = TRUE,
    set_pars(new_term(rep("a", 7)), value = c("gamma", "theta", "rho"))
  )
})

test_that("set_pars missing values", {
  expect_snapshot(
    error = TRUE,
    set_pars(new_term(c("a [ 1]", "b")), c("b", NA))
  )
  expect_snapshot(error = TRUE, set_pars(NA_term_, "a"))
  expect_snapshot(error = TRUE, set_pars(new_term(c("c c", "b")), "a"))
})

test_that("set_pars no values", {
  term <- new_term(character(0))
  expect_identical(set_pars(term, character(0)), term)
  expect_snapshot(error = TRUE, set_pars(term, "c"))
})

test_that("set_pars missing values", {
  term <- new_term(c("a [1]", "a[3,2]", "b", "bb"))
  pars(term) <- c("c", "d", "cd")
  expect_identical(
    term,
    new_term(c("c [1]", "c[3,2]", "d", "cd"))
  )
})

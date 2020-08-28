test_that("vec_cast.term", {
  expect_identical(vec_cast(new_term_rcrd(), new_term()), new_term())
})

test_that("vec_cast.term_rcrd", {
  expect_identical(vec_cast(new_term_rcrd(), new_term_rcrd()), new_term_rcrd())
  expect_identical(vec_cast(term_rcrd("a"), new_term_rcrd()), term_rcrd("a"))
  expect_identical(vec_cast("a", new_term_rcrd()), term_rcrd("a"))
})

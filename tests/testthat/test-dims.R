context("dims")

test_that("dims.vector", {
  expect_identical(dims(integer(0)), 0L)
  expect_identical(dims(list()), 0L)
  expect_identical(dims(1), 1L)
  expect_identical(dims(list(1)), 1L)
  expect_identical(dims(NA_real_), 1L)
  expect_identical(dims(NULL), NULL)
  expect_identical(dims(2:3), 2L)
})

test_that("dims.term", {
  expect_identical(dims(term(0L)), 0L)
  expect_identical(dims(list()), 0L)
  expect_identical(dims(1), 1L)
  expect_identical(dims(list(1)), 1L)
  expect_identical(dims(NA_real_), 1L)
  expect_identical(dims(NULL), NULL)
  expect_identical(dims(2:3), 2L)
})

test_that("dims.matrix", {
  expect_identical(dims(matrix(1)), c(1L, 1L))
  expect_identical(dims(matrix(1:9)), c(9L, 1L))
  expect_identical(dims(matrix(1:9, ncol = 3)), c(3L, 3L))
})

test_that("dims.array", {
  expect_identical(dims(array(1:12, c(2, 3, 2))), c(2L, 3L, 2L))
})

test_that("dims.data.frame", {
  expect_identical(dims(data.frame()), c(0L, 0L))
  expect_identical(dims(data.frame(x = 2:3)), c(2L, 1L))
})

context("ndims")

test_that("ndims.vector", {
  expect_identical(ndims(integer(0)), 1L)
  expect_identical(ndims(list()), 1L)
  expect_identical(ndims(1), 1L)
  expect_identical(ndims(list(1)), 1L)
  expect_identical(ndims(NA_real_), 1L)
  expect_identical(ndims(NULL), 0L)
  expect_identical(ndims(2:3), 1L)
})

test_that("ndims.matrix", {
  expect_identical(ndims(matrix(1)), 2L)
  expect_identical(ndims(matrix(1:9)), 2L)
  expect_identical(ndims(matrix(1:9, ncol = 3)), 2L)
})

test_that("ndims.array", {
  expect_identical(ndims(array(1:12, c(2, 3, 2))), 3L)
})

test_that("ndims.data.frame", {
  expect_identical(ndims(data.frame()), 2L)
  expect_identical(ndims(data.frame(x = 2:3)), 2L)
})

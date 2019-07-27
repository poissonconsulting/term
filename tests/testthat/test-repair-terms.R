context("repair-terms")

test_that("repair_terms", {
  expect_identical(repair_terms(term()), term())
  expect_identical(repair_terms(as.term("")), term())
  expect_identical(repair_terms(as.term("[1]")), term())
  expect_identical(repair_terms(as.term("b[]")), term())
  expect_identical(repair_terms(as.term("b[0]")), term())
  expect_identical(repair_terms(as.term("b[1,]")), term())
  expect_identical(repair_terms(as.term("a")), term("a"))
  expect_identical(repair_terms(as.term("a ")), term("a"))
  expect_identical(repair_terms(as.term("a [2]")), term("a[2]"))
  expect_identical(repair_terms(as.term(c("b [  3 ]", "a [2]"))), 
                   as.term(c("b[3]", "a[2]")))
  expect_identical(repair_terms(as.term(c("a", ""))), term("a"))
  expect_identical(repair_terms(as.term(c("a[1]", ""))), term("a"))
  expect_identical(repair_terms(as.term(c("a[2]", "a[1]"))), term(c("a[2]", "a[1]")))
  expect_identical(repair_terms(as.term(c("a[2,1]", "a"))), term(c("a[2,1]", "a[1]")))
})

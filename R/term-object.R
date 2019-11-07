#' Term Object
#'
#' A `term` object is a S3 vector of parameter terms.
#'
#' @name term-object
#' @aliases term_object term-vector term_vector
#'
#' @examples
#' as.term(c("a[1]", "a[2]"))
#' as.term(matrix(1:4, 2))
#' term(2L)
#' term(c(2L, 2L), "alpha")
NULL

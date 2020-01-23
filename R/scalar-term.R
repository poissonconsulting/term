#' Scalar Terms
#'
#' Test whether each element in a term vector is scalar.
#' 
#' The function tests for the absence of a \code{[} 
#' after by default repairing the term vector.
#'
#'
#' @inheritParams params
#' @return A logical vector indicating whether each term is scalar.
#' @seealso [term-vector()] and [repair_terms()]
#' @export
#'
#' @examples
#' scalar_term(as.term(c("a", "a[2]", "b[1]", "c[1,1]")))
scalar_term <- function(x, repair = TRUE) {
  chk_s3_class(x, "term")
  if (!length(x)) {
    return(logical(0))
  }
  if(vld_true(repair)) {
    x <- repair_terms(x)
  }
  scalar <- !grepl("\\[", x)
  is.na(scalar[is.na(x)]) <- TRUE
  scalar
}

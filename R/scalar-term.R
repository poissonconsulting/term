#' Scalar Terms
#'
#' Test whether each element in a term vector is scalar.
#' 
#' The function tests for the absence of a \code{[}.
#' 
#' A modified term vector may need to be repaired first.
#'
#'
#' @inheritParams params
#' @return A logical vector indicating whether each term is scalar.
#' @seealso [term-vector()] and [repair_terms()]
#' @export
#'
#' @examples
#' scalar_term(as.term(c("a", "a[2]", "b[1]", "c[1,1]")))
#' scalar_term(repair_terms(as.term(c("a", "a[2]", "b[1]", "c[1,1]"))))
scalar_term <- function(x) {
  chk_s3_class(x, "term")
  if (!length(x)) {
    return(logical(0))
  }
  scalar <- !grepl("\\[", x)
  is.na(scalar[is.na(x)]) <- TRUE
  scalar
}

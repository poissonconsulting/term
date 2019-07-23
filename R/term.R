#' Object Terms
#'
#' Gets the term vector for an R object.
#' A term vector is a S3 vector of parameter terms.
#'
#' @param x An R object.
#' @param ... Unused.
#' @return A term vector.
#' @export
#' @examples 
#' term <- term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
#' term
#' str(term)
term <- function(x, ...) UseMethod("term")

#' @export
term.default <- function(x, ...) {
  check_unused(...)
  if(missing(x)) return(as.term(character(0)))
  as.term(x)
}
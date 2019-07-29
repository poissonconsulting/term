#' Consistent Terms
#'
#' Test whether the number of dimensions of terms in the same parameter are consistent.
#'
#' @param x A term vector.
#' @return A logical vector indicating whether the number of dimensions is consistent.
#' @seealso \code{\link{term-vector}} and \code{\link{npdims}}
#' @export
#' 
#' @examples 
#' consistent_terms(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")))
consistent_terms <- function(x) {
  if(!is.term(x)) err("x must be a term vector")
  x <- npdims(x, terms = TRUE)
  # need to take npdims and looks for odd ones...
  x
}

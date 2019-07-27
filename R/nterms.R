#' Number of Terms
#'
#' Gets the number of unique valid term elements of an object.
#'
#' @param x The object.
#' @param ... Unused.
#' @return A count of the number of terms.
#' @seealso \code{\link{term-vector}}, \code{\link{repair_terms}()} 
#' and \code{\link{valid_term}()} 
#' @export
#' 
#' @examples
#' nterms(3:4)
#' nterms(matrix(1:9, 3))
#' nterms(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
nterms <- function(x, ...) {
  UseMethod("nterms")
}

#' @export
nterms.default <- function(x, ...) {
  x <- as.term(x)
  if(!length(x)) return(0L)
  if(anyNA(x)) return(NA_integer_)
  length(unique(repair_terms(x)))
}

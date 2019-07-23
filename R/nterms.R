#' Number of Terms
#'
#' Gets the number of terms of an object.
#'
#' @param x The object.
#' @param ... Unused.
#' @return A count of the number of terms.
#' @export
#' @examples
#' nterms(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
nterms <- function(x, ...) {
  UseMethod("nterms")
}

#' @export
nterms.default <- function(x, ...) {
  length(as.term(x))
}

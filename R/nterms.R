#' Number of Terms
#'
#' Gets the number of terms for an object.
#'
#' @param x The object.
#' @param ... Not used.
#' @return A count of the number of terms.
#' @export
#' @examples
#' nterms(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#' "beta[1,2]", "beta[2,2]", "sigma")))
nterms <- function(x, ...) {
  UseMethod("nterms")
}

#' @describeIn nterms Number of terms for an object
#' @export
nterms.default <- function(x, ...) {
  length(as.term(x))
}

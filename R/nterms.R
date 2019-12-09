#' Number of Terms
#'
#' Gets the number of unique term elements of an object.
#'
#' By default if the vector includes
#' missing values then it returns NA_integer_.
#'
#' @inheritParams params
#' @return A count of the number of terms.
#' @seealso [term-vector()]
#' @export
#'
#' @examples
#' nterms(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]")))
#' nterms(as.term(c("alpha[1]", "alpha[1]", "beta[1,1]", "beta[1,1]")))
nterms <- function(x, ...) {
  UseMethod("nterms")
}

#' @describeIn nterms Number of unique term elements of term vector
#' @export
nterms.term <- function(x, ...) {
  if (anyNA(x)) {
    return(NA_integer_)
  }
  length(unique(x))
}

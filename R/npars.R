#' Number of Parameters
#'
#' Gets the number of parameters of an object as returned by [pars()].
#'
#' @inheritParams params
#' @param scalar A flag specifying whether to only count parameters with one term.
#' @return A count of the number of parameters.
#' @seealso [pars()] and [term-vector()]
#' @export
#'
#' @examples
#' npars(as.term(c("sigma", "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]")))
#' npars(as.term(c("sigma", "alpha[1]", "alpha[2]")), scalar = TRUE)
npars <- function(x, ...) UseMethod("npars")

#' @describeIn npars Number of parameters of term vector
#' @export
npars.term <- function(x, scalar = NA, ...) {
  chk_lgl(scalar)
  chk_unused(...)
  if (anyNA(x)) {
    return(NA_integer_)
  }
  length(pars(x, scalar = scalar))
}

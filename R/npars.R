#' Number of Parameters
#'
#' Gets the number of parameters of an object.
#'
#' @param x The object.
#' @param scalar_only A flag specifying whether to only count parameters with one term.
#' @param ... Unused.
#' @return A count of the number of parameters.
#' @seealso \code{\link{pars}()}
#' @export
#' 
#' @examples
#' npars(c("sigma", "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
#' npars(c("sigma", "alpha[1]", "alpha[2]"), scalar_only = TRUE)
npars <- function(x, ...) UseMethod("npars")

#' @describeIn npars Number of parameters of term vector
#' @export
npars.default <- function(x, scalar_only = FALSE, ...) {
  check_unused(...)
  length(pars(x, scalar_only = scalar_only))
}

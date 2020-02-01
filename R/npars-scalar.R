#' Number of Scalar Parameters
#'
#' Gets the number of parameters of an object as returned by [pars_scalar()].
#'
#' @inheritParams params
#' @return An integer scalar of the number of scalar parameters.
#' @family {parameters}
#' @export
npars_scalar <- function(x, ...) UseMethod("npars_scalar")

#' @describeIn npars_scalar Number of Scalar Parameters
#' @export
npars_scalar.default <- function(x, ...) {
  if (anyNA(x)) {
    return(NA_integer_)
  }
  length(pars_scalar(x, ...))
}

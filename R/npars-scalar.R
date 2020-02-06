#' @export
universals::npars_scalar

#' Number of Dimensions of each Parameter
#'
#' @inherit universals::npars_scalar
#' @export
#'
#' @examples
#' npars_scalar(term("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]"))
npars_scalar.default <- function(x, ...) {
  if (anyNA(x)) {
    return(NA_integer_)
  }
  length(pars_scalar(x, ...))
}

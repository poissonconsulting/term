#' Number of Parameters
#'
#' Gets the number of parameters for an object.
#'
#' @param x The object.
#' @param ... Unused.
#' @return A count of the number of parameters.
#' @export
#' @examples
#' npars(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#' "beta[1,2]", "beta[2,2]", "sigma")))
npars <- function(x, ...) UseMethod("npars")

#' @export
npars.default <- function(x, ...) length(parameters(x))

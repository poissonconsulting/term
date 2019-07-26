#' Number of Parameters
#'
#' Gets the number of parameters of an object.
#'
#' @param x The object.
#' @param ... Unused.
#' @return A count of the number of parameters.
#' @seealso \code{\link{pars}()}
#' @export
#' 
#' @examples
#' npars(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
npars <- function(x, ...) UseMethod("npars")

#' @export
npars.default <- function(x, ...) length(pars(x))

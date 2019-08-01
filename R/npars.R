#' Number of Parameters
#'
#' Gets the number of parameters of an object as returned by \code{\link{pars}()}.
#' 
#' @param x An R object.
#' @param scalar_only A flag specifying whether to only count parameters with one term.
#' @param ... Unused.
#' @return A count of the number of parameters.
#' @seealso \code{\link{pars}()} and \code{\link{term-vector}} 
#' @export
#' 
#' @examples
#' npars(as.term(c("sigma", "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]")))
#' npars(as.term(c("sigma", "alpha[1]", "alpha[2]")), scalar_only = TRUE)
npars <- function(x, ...) UseMethod("npars")

#' @describeIn npars Number of parameters of term vector
#' @export
npars.term <- function(x, scalar_only = FALSE, ...) {
  chk_flag(scalar_only)
  chk_unused(...)
  if(anyNA(x)) return(NA_integer_)
  length(pars(x, scalar_only = scalar_only))
}

#' Number of Parameters
#'
#' Gets the number of parameters of an object as returned by \code{\link{pars}()}.
#' 
#' By default (\code{na.rm = TRUE}) the function repairs the vector and 
#' returns \code{NA_integer_} if the term vector includes missing term elements.
#'
#' @param x An R object.
#' @param scalar_only A flag specifying whether to only count parameters with one term.
#' @param repair A flag specifying whether to repair the term vector.
#' @param na.rm A flag specifying whether to remove missing term elements
#' before getting the number of parameters.
#' @param ... Unused.
#' @return A count of the number of parameters.
#' @seealso \code{\link{pars}()}, \code{\link{term-vector}} 
#' and \code{\link{repair_terms}()}
#' @export
#' 
#' @examples
#' npars(as.term(c("sigma", "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]")))
#' npars(as.term(c("sigma", "alpha[1]", "alpha[2]")), scalar_only = TRUE)
npars <- function(x, ...) UseMethod("npars")

#' @describeIn npars Number of parameters of term vector
#' @export
npars.term <- function(x, scalar_only = FALSE, repair = TRUE, na.rm = FALSE, ...) {
  check_flag(scalar_only)
  check_flag(repair)
  check_flag(na.rm)
  check_unused(...)
  if(repair) x <- repair_terms(x, scalars = scalar_only)
  if(anyNA(x)) {
    if(isFALSE(na.rm)) return(NA_integer_)
    x <- x[is.na(x)]
  }
  length(.pars(x, scalar_only = scalar_only))
}

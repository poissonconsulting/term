#' Number of Parameters
#'
#' Gets the number of parameters of an object as returned by \code{\link{pars}()}.
#' 
#' By default (\code{na.rm = TRUE}) the function returns \code{NA_integer_}
#' if the term vector includes invalid or missing term elements.
#'
#' @param x An R object.
#' @param scalar_only A flag specifying whether to only count parameters with one term.
#' @param na.rm A flag specifying whether to remove invalid or missing term elements
#' before getting the number of parameters.
#' @param ... Unused.
#' @return A count of the number of parameters.
#' @seealso \code{\link{pars}()}, \code{\link{term-vector}} 
#' and \code{\link{valid_term}()}
#' @export
#' 
#' @examples
#' npars(c("sigma", "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
#' npars(c("sigma", "alpha[1]", "alpha[2]"), scalar_only = TRUE)
npars <- function(x, ...) UseMethod("npars")

#' @describeIn npars Number of parameters of default object
#' @export
npars.default <- function(x, scalar_only = FALSE, ...) {
  check_unused(...)
  length(.pars(x, scalar_only = scalar_only))
}

#' @describeIn npars Number of parameters of character vector
#' @export
npars.character <- function(x, scalar_only = FALSE, na.rm = FALSE, ...) {
  check_unused(...)
  npars(as.term(x), scalar_only = scalar_only, na.rm = na.rm)
}

#' @describeIn npars Number of parameters of term vector
#' @export
npars.term <- function(x, scalar_only = FALSE, na.rm = FALSE, ...) {
  check_flag(scalar_only)
  check_flag(na.rm)
  check_unused(...)
  x <- repair_terms(x, scalars = scalar_only)
  if(anyNA(x)) {
    if(isFALSE(na.rm)) return(NA_integer_)
    x <- x[is.na(x)]
  }
  length(.pars(x, scalar_only = scalar_only))
}

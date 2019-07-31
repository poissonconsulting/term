#' Parameter Dimensions
#'
#' Gets the parameter dimensions of an object as a named list of the dimensions
#' of each parameter.
#' 
#' Errors if the parameter dimensions are inconsistent.
#' 
#' A named list of the dimensions of each parameter can be converted
#' into the equivalent \code{\link{term-vector}} using \code{\link{term}()}.
#'
#' @param x The object
#' @param ... Unused.
#' @return A named list of the dimensions of each parameter.
#' @seealso \code{\link{dims}()} and \code{\link{term}()}
#' @export
#' 
#' @examples
#' pdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")))
pdims <- function(x, ...) UseMethod("pdims")

#' @export
pdims.term <- function(x, ...) {
  chk_no_missing(x)
  if(any(!consistent_term(x)))
    err("parameter dimensions are inconsistent")
  .pdims(x)
}

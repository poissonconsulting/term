#' Number of Parameter Dimensions
#'
#' Gets the number of parameter dimensions of an object as returned by \code{\link{pdims}()}.
#'
#' @param x The object
#' @param ... Unused.
#' @return A named list of the number of dimensions of each parameter.
#' @seealso \code{\link{pdims}()}
#' @export
#' 
#' @examples
#' npdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")))
npdims <- function(x, ...) UseMethod("npdims")

#' @export
npdims.default <- function(x, ...) vapply(pdims(x), length, 1L)

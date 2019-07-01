#' Number of Parameter Dimensions
#'
#' Gets the number parameter dimensions of an object.
#'
#' @param x The object
#' @param ... Unused.
#' @export
#' @examples
#' npdims(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#' "beta[1,2]", "beta[2,2]", "sigma")))
npdims <- function(x, ...) UseMethod("npdims")

#' @export
npdims.default <- function(x, ...) length(pdims(x))

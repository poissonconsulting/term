#' Number of Dimensions of an Object
#'
#' Retrieves the number of dimensions of an object as defined by dims.
#'
#' @param x An R object.
#' @param ... Unused
#' @return A vector or list of the number of dimensions.
#' @export
#' @examples
#' ndims(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#' "beta[1,2]", "beta[2,2]", "sigma")))
ndims <- function(x, ...) UseMethod("ndims")

#' @export
ndims.default <- function(x, ...) length(dims(x))

#' @export
ndims.matrix <- function(x, ...) 2L

#' @export
ndims.data.frame <- function(x, ...) 2L

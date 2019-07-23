#' Number of Dimensions of an Object
#'
#' Gets the number of dimensions of an object as defined by \code{\link{dims}()}.
#'
#' @param x An R object.
#' @param ... Unused
#' @return A vector or list of the number of dimensions.
#' @export
#' @examples
#' ndims(character(0))
#' ndims(1:3)
#' ndims(data.frame())
#' ndims(data.frame(x = 1:3))
ndims <- function(x, ...) UseMethod("ndims")

#' @export
ndims.default <- function(x, ...) length(dims(x))

#' @export
ndims.matrix <- function(x, ...) 2L

#' @export
ndims.data.frame <- function(x, ...) 2L

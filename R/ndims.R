#' Number of Dimensions of an Object
#'
#' Gets the number of dimensions of an object as defined by [dims()].
#'
#' @param x An R object.
#' @param ... Unused
#' @return A count of the number of dimensions.
#' @seealso [dims()]
#' @export
#'
#' @examples
#' ndims(character(0))
#' ndims(1:3)
#' ndims(data.frame())
#' ndims(data.frame(x = 1:3))
ndims <- function(x, ...) UseMethod("ndims")

#' @describeIn ndims Number of dimensions of a default object
#' @export
ndims.default <- function(x, ...) length(dims(x))

#' @describeIn ndims Number of dimensions of a matrix
#'
#' Always 2L.
#' @export
ndims.matrix <- function(x, ...) 2L

#' @describeIn ndims Number of dimensions of a data.frame
#'
#' Always 2L.
#' @export
ndims.data.frame <- function(x, ...) 2L

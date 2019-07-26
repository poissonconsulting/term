#' Dimensions of an Object
#'
#' Gets the dimensions of an object.
#' 
#' Unlike \code{base::dim()}, dims works as expected for vectors and data.frames.
#'
#' @param x An R object.
#' @param ... Unused
#' @return A vector or list of the dimensions.
#' @seealso \code{\link[base]{dim}()}
#' @export
#' 
#' @examples
#' dims(character(0))
#' dims(1:3)
#' dims(data.frame())
#' dims(data.frame(x = 1:3))
dims <- function(x, ...) UseMethod("dims")

#' @describeIn dims Dimensions of a default object
#' @export
dims.default <- function(x, ...) {
  if (is.vector(x) || is.factor(x) || is.term(x)) length(x) else dim(x)
}

#' @describeIn dims Dimensions of a data frame
#' @export
dims.data.frame <- function(x, ...) return(c(nrow(x), ncol(x)))

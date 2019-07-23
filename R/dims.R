#' Dimensions of an Object
#'
#' Gets the dimensions of an object.
#' 
#' Unlike base::dim(), dims returns a scalar corresponding to the length of
#' a vector and two values corresponding to the number of rows and columns 
#' of a data frame.
#'
#' @param x An R object.
#' @param ... Unused
#' @return A vector or list of the dimensions.
#' @export
#' @examples
#' dims(character(0))
#' dims(1:3)
#' dims(data.frame())
#' dims(data.frame(x = 1:3))
dims <- function(x, ...) UseMethod("dims")

#' @export
dims.default <- function(x, ...) {
  if (is.vector(x) || is.factor(x)) length(x) else dim(x)
}

#' @export
dims.term <- function(x, ...) length(x)

#' @export
dims.data.frame <- function(x, ...) return(c(nrow(x), ncol(x)))

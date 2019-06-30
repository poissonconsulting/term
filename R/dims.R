#' Dimensions of an Object
#'
#' Retrieves the dimensions of an object.
#' Unlike base::dim(), dims returns a scalar corresponding to the length of
#' a vector and two values corresponding to the number of rows and columns 
#' of a data frame.
#'
#' @param x An R object.
#' @param ... Unused
#' @return A vector or list of the dimensions.
#' @export
dims <- function(x, ...) {
  UseMethod("dims")
}

#' @export
dims.default <- function(x, ...) {
  if (is.vector(x) || is.factor(x)) length(x) else dim(x)
}

#' @export
dims.data.frame <- function(x, ...) {
  return(c(nrow(x), ncol(x)))
}

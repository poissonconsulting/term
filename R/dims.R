#' Dimensions of an Object
#'
#' Gets the dimensions of an object.
#'
#' Unlike `base::dim()`, dims works as intuitively expected for vectors and data.frames.
#' A integer vector of the dimensions of a parameter can be converted
#' into the equivalent [term-vector()] using [term()].
#' @param x An R object.
#' @param ... Unused
#' @return An integer vector of the dimensions.
#' @seealso [base::dim()], [term-vector()]
#' and [term()]
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
dims.data.frame <- function(x, ...) {
  return(c(nrow(x), ncol(x)))
}

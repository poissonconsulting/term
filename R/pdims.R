#' Parameter Dimensions
#'
#' Gets the parameter dimensions of an object.
#'
#' @param x The object
#' @param ... Unused.
#' @export
#' @examples
#' pdims(as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#' "beta[1,2]", "beta[2,2]", "sigma")))
pdims <- function(x, ...) UseMethod("pdims")

#' @export
pdims.term <- function(x, ...) {
  x <- sort(x)
  names <- parameters(x)
  x <- split(x, parameters(x, terms = TRUE))
  x <- lapply(x, function(x) x[length(x)])
  x <- unlist(x)
  x <- sub("(^\\w+)(.*)", "\\2", as.character(x))
  x <- sub("^$", "1", x)
  x <- gsub("\\[|\\]", "", x)
  x <- strsplit(x, ",")
  x <- lapply(x, as.integer)
  names(x) <- names
  x
}

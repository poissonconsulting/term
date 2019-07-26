#' Parameter Dimensions
#'
#' Gets the parameter dimensions of an object.
#'
#' @param x The object
#' @param ... Unused.
#' @return A named list of the dimensions of each parameter.
#' @seealso \code{\link{dims}()}
#' @export
#' 
#' @examples
#' pdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")))
pdims <- function(x, ...) UseMethod("pdims")

#' @export
pdims.term <- function(x, ...) {
  x <- sort(x)
  names <- pars(x)
  x <- split(x, pars(x, terms = TRUE))
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

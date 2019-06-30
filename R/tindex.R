#' Term Index
#'
#' Gets a list of the index for each term of an object.
#' 
#' \code{tdims()} is deprecated.
#'
#' @param x The object
#' @param ... Unused.
#' @export
#' @examples
#' tindex(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]", 
#' "beta[1,2]", "beta[2,2]", "sigma"))
tindex <- function(x, ...) UseMethod("tindex")

#' @export
tindex.default <- function(x, ...) tindex(as.term(x))

#' @export
tindex.term <- function(x, ...) {
  names <- x
  x <- sub("^(\\w+)(.*)", "\\2", x)
  x <- sub("^(\\[)(.*)(\\])$", "\\2", x)
  x <- strsplit(x, "\\s*[,]\\s*")
  x[vapply(x, function(x) identical(x, character(0)), TRUE)] <- ""
  x <- lapply(x, function(x) gsub("\\s+", "", x))
  x <- lapply(x, as.integer)
  x[is.na(x)] <- 1L
  names(x) <- names
  x
}

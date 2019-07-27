#' Term Index
#'
#' Gets the index for each term of an object.
#' 
#' For example the index of \code{beta[2,1]} is \code{c(2L, 1L)}
#' while the index for \code{sigma} is \code{1L}.
#' It is useful for extracting the values of individual terms.
#'
#' @param x The object
#' @param ... Unused.
#' @return A named list of the index for each term.
#' @export
#' 
#' @examples
#' tindex(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
tindex <- function(x, ...) UseMethod("tindex")

#' @describeIn tindex Term indices for default object
#' @export
tindex.default <- function(x, ...) tindex(as.term(x))

#' @describeIn tindex Term indices for term vector
#' @export
tindex.term <- function(x, ...) {
  names <- x
  x <- sub(paste0("^", .par_name_pattern), "", x)
  x <- sub("^(\\[)(.*)(\\])$", "\\2", x)
  x <- strsplit(x, "\\s*[,]\\s*")
  x[vapply(x, function(x) identical(x, character(0)), TRUE)] <- ""
  x <- lapply(x, function(x) gsub("\\s+", "", x))
  x <- lapply(x, as.integer)
  x[is.na(x)] <- 1L
  x[is.na(names)] <- NA_integer_
  names(x) <- names
  x
}

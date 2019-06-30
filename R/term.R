#' Object Terms
#'
#' Gets term vector for an R object.
#'
#' @param x An R object.
#' @param ... Unused.
#' @return A term vector.
#' @export
term <- function(x, ...) {
  UseMethod("term")
}

#' @export
term.default <- function(x, ...) as.term(x)

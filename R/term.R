#' Object Terms
#'
#' Gets term vector for an R object.
#'
#' @param x An R object.
#' @param ... Unused.
#' @return A term vector.
#' @export
#' @examples 
#' term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#' "beta[1,2]", "beta[2,2]", "sigma"))
term <- function(x, ...) UseMethod("term")

#' @export
term.default <- function(x, ...) as.term(x)

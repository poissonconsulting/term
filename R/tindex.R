#' Term Index
#'
#' Gets the index for each term of an object.
#' 
#' For example the index of \code{beta[2,1]} is \code{c(2L, 1L)}
#' while the index for \code{sigma} is \code{1L}.
#' It is useful for extracting the values of individual terms.
#' 
#' The term vector is repaired prior to calculating the indices.
#'
#' @param x The object
#' @param ... Unused.
#' @return A named list of the index for each term.
#' @seealso \code{\link{term-vector}} and \code{\link{repair_terms}()}
#' @export
#' 
#' @examples
#' tindex(as.term(c("alpha", "alpha[2]", "beta[1,1]", "beta[2 ,1  ]", NA)))
tindex <- function(x, ...) UseMethod("tindex")

#' @describeIn tindex Term indices for term vector
#' @export
tindex.term <- function(x, ...) {
  x <- repair_terms(x)
  .tindex(x)
}

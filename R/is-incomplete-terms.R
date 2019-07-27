#' Is Incomplete Terms
#'
#' Tests whether an objects has missing terms.
#' 
#' The test is performed after the object's terms have been repaired.
#'
#' @param x An object.
#' @param ... Unused
#' @return A flag indicating whether the object's terms are incomplete.
#' @seealso \code{\link{repair_terms}()} and \code{\link{complete_terms}()}
#' @export
#' 
#' @examples
#' is.incomplete_terms(as.term("b[2]"))
#' is.incomplete_terms(as.term(c("b[2]", "b[1]")))
is.incomplete_terms <- function(x, ...) UseMethod("is.incomplete_terms")

#' @describeIn is.incomplete_terms Test whether a term vectors terms are incomplete
#' @export
is.incomplete_terms.term <- function(x, ...) {
  x <- unique(x)
  if(!length(x)) return(FALSE)
  length(x) < sum(vapply(pdims(x), prod, 1))
}

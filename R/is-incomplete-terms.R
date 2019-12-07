#' Is Incomplete Terms
#'
#' Tests whether a term vector has absent elements.
#'
#' @param x An object.
#' @param ... Unused
#' @return A logical scalar indicating whether the object's terms are incomplete.
#' @seealso [term-vector()] and [complete_terms()]
#' @export
#'
#' @examples
#' is.incomplete_terms(as.term("b[2]"))
#' is.incomplete_terms(as.term(c("b[2]", "b[1]")))
is.incomplete_terms <- function(x, ...) UseMethod("is.incomplete_terms")

#' @describeIn is.incomplete_terms Test whether a term vector is incomplete
#' @export
is.incomplete_terms.term <- function(x, ...) {
  if (!length(x)) {
    return(FALSE)
  }
  if (anyNA(x)) {
    return(NA)
  }
  x <- unique(x)
  length(x) < sum(vapply(pdims(x), prod, 1))
}

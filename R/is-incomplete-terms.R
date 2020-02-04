#' Is Incomplete Terms
#'
#' Tests whether a term vector has absent elements.
#' The vector should not require repairing.
#'
#' @inheritParams params
#' @return A logical scalar indicating whether the object's terms are incomplete.
#' @seealso [term-vector()] and [complete_terms()]
#' @export
#'
#' @examples
#' is_incomplete_terms(term("b[2]"))
#' is_incomplete_terms(term("b[2]", "b[1]"))
#' is_incomplete_terms(term("b[2]", "b[1]", "b[1]"))
is_incomplete_terms <- function(x, ...) {
  if (!length(x)) {
    return(FALSE)
  }
  if (anyNA(x)) {
    return(NA)
  }
  if(length(unique(table(x))) != 1L)
    return(TRUE)
  x <- unique(x)
  length(x) < sum(vapply(pdims(x), prod, 1))
}

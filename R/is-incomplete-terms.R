#' Is Incomplete Terms
#'
#' Tests whether a term vector has absent elements.
#'
#' @inheritParams params
#' @return A logical scalar indicating whether the object's terms are incomplete.
#' @seealso [term-vector()] and [complete_terms()]
#' @export
#'
#' @examples
#' is_incomplete_terms(as.term("b[2]"))
#' is_incomplete_terms(as.term(c("b[2]", "b[1]")))
is_incomplete_terms <- function(x, ...) {
  if (!length(x)) {
    return(FALSE)
  }
  if (anyNA(x)) {
    return(NA)
  }
  x <- unique(x)
  length(x) < sum(vapply(pdims(x), prod, 1))
}

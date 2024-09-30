#' Is Inconsistent Terms
#'
#' Tests whether a term vector has inconsistent elements.
#' Returns TRUE if includes missing or invalid terms.
#'
#' @inheritParams params
#' @return A logical scalar indicating whether the object's terms are inconsistent.
#' @seealso [term-vector()] and [consistent_term()]
#' @export
#'
#' @examples
#' is_inconsistent_terms(term("b[2]"))
#' is_inconsistent_terms(term("b[2]", "b[1]"))
#' is_inconsistent_terms(term("b[2]", "b[1,1]"))
is_inconsistent_terms <- function(x, ...) {
  if (is_term(x) && !length(x)) {
    return(FALSE)
  }
  if (is_term_rcrd(x) && !length(x)) {
    return(FALSE)
  }
  x <- !consistent_term(x)
  if (anyNA(x)) {
    return(TRUE)
  }
  any(x)
}

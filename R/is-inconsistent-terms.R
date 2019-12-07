#' Is Inconsistent Terms
#'
#' Tests whether a term vector has inconsistent elements.
#'
#' @param x An object.
#' @param ... Unused
#' @return A logical scalar indicating whether the object's terms are inconsistent.
#' @seealso [term-vector()] and [consistent_term()]
#' @export
#'
#' @examples
#' is.inconsistent_terms(as.term("b[2]"))
#' is.inconsistent_terms(as.term(c("b[2]", "b[1]")))
#' is.inconsistent_terms(as.term(c("b[2]", "b[1,1]")))
is.inconsistent_terms <- function(x, ...) UseMethod("is.inconsistent_terms")

#' @describeIn is.inconsistent_terms Test whether a term vector is inconsistent
#' @export
is.inconsistent_terms.term <- function(x, ...) {
  if (!length(x)) {
    return(FALSE)
  }
  any(!consistent_term(x))
}

#' Complete Terms
#'
#' Completes an object's terms.
#'
#' @details It must not have any invalid or missing (NA) values.
#'
#' @inheritParams params
#' @seealso [term-vector()], [repair_terms()] and [is_incomplete_terms()].
#' @export
complete_terms <- function(x, ...) {
  UseMethod("complete_terms")
}

#' @describeIn complete_terms Complete Terms for a term Vector
#'
#' @export
#'
#' @examples
#' complete_terms(term("b[3]", "b[1]", "b[2]"))
#' complete_terms(term("z[2,2]", "z[1,1]"))
complete_terms.term <- function(x, ...) {
  chk_unused(...)
  if (!dims(x)) {
    return(x)
  }
  x <- repair_terms(x)
  if(anyNA(x)) {
    abort_chk("`x` must not have any missing values.")
  }
  term(x, !!!setdiff(term_impl(pdims(x)), x))
}


#' @describeIn complete_terms Complete Terms for a term_rcrd vector
#'
#' @export
#'
#' @examples
#' \dontrun{
#' complete_terms(term_rcrd("b[3]", "b[1]", "b[2]"))
#' complete_terms(term_rcrd("z[2,2]", "z[1,1]"))
#' }
complete_terms.term_rcrd <- function(x, ...) {
  if(!dims(x)) return(x)
  # FIXME: Can this be implemented easier operating directly on a term_rcrd?
  as_term_rcrd(complete_terms(as_term(x), ...))
}

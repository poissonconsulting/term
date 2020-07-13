#' Normalize Terms
#'
#' Normalizes a term vector.
#'
#' If a parameter such as `b`
#' is a scalar then `b[1]` is replaced by `b`
#' but if higher indices are included such as `b[2]` then `b`
#' is replaced by `b[1]`.
#'
#' @inheritParams params
#' @return The normalized term vector.
#' @seealso [term-vector()] and [repair_terms()]
#' @export
#'
#' @examples
#' normalize_terms(new_term(c("b", "b[3]")))
#' normalize_terms(new_term(c("b[1]", "a[3]")))
normalize_terms <- function(x) {
  chk_s3_class(x, "term")
  new_term(normalize_terms_impl(unclass(x)))
}

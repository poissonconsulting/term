#' Repair Terms
#'
#' Repairs a terms vector.
#'
#' Invalid elements are replaced by missing values and spaces removed.
#'
#' @inheritParams params
#' @return The repaired term vector.
#' @seealso [term-vector()], [valid_term()] and [normalize_terms()]
#' @export
#'
#' @examples
#' repair_terms(new_term(c("b[3]", "b")))
#' repair_terms(new_term(c("a[3]", "b[1]")))
#' repair_terms(new_term(c("a [3]", " b [ 1  ] ")))
#' repair_terms(new_term(c("a", NA)))
repair_terms <- function(x) {
  chk_s3_class(x, "term")
  new_term(repair_terms_impl(unclass(x)))
}

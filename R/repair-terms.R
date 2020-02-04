#' Repair Terms
#'
#' Repairs a terms vector.
#'
#' Invalid elements are replaced by missing values and spaces removed.
#'
#' If a parameter such as `b`
#' is a scalar then `b[1]` is replaced by `b`
#' but if higher indices are included such as `b[2]` then `b`
#' is replaced by `b[1]`.
#' Note that repairing does not necessarily establish
#' consistency or completeness, see [vld_term()] for details.
#'
#' @inheritParams params
#' @return The repaired term vector.
#' @seealso [term-vector()] and [valid_term()]
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

repair_terms_impl <- function(x) {
  if (!length(x)) {
    return(x)
  }
  is.na(x[is.na(x) | !valid_term_impl(x)]) <- TRUE
  x <- gsub("\\s+", "", x)

  x <- sub("\\[1\\]$", "", x)
  non_scalar <- unique(sub("\\[.*$", "", x[grepl("\\[", x)]))
  non_scalar <- x %in% non_scalar
  x[non_scalar] <- p0(x[non_scalar], "[1]")
  x
}

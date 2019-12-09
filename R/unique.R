#' Extract Unique Terms
#'
#' Extracts unique elements from a term vector.
#'
#' @inheritParams params
#' @return A vector of unique terms.
#' @seealso [term-vector()]
#' @export
#'
#' @examples
#' unique(as.term(c("b", "a", "a[1]", "a", NA, "aa", NA)))
unique.term <- function(x, incomparables = FALSE, ...) {
  chk_false(incomparables)
  chk_unused(...)

  as.term(unique(as.character(x)))
}

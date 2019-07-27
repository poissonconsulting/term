#' Extract Unique Terms
#' 
#' Extracts unique elements from a term vector.
#' 
#' If necessary the user should repair the terms prior to extracting unique elements.
#' 
#' @param x A term vector.
#' @param incomparables Ignored.
#' @param ... Unused.
#' @return A vector of unique terms.
#' @seealso \code{\link{term-vector}} and \code{\link{repair_terms}()}
#' @export
#' 
#' @examples 
#' unique(as.term(c("b", "a", "a[1]", "a", NA, "aa", NA)))
unique.term <- function(x, incomparables = FALSE, ...) {
  check_unused(...)
  if(!isFALSE(incomparables)) err("incomparables is ignored")
  as.term(unique(as.character(x)))
}

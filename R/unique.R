#' Extract Unique Terms
#' 
#' Extracts unique values from a term vector. 
#' By default the vector is repaired before extracting the unique values.
#' 
#' @param x A term vector.
#' @param incomparables Ignored.
#' @param repair_terms A flag specifying whether the vector should be repaired
#' before extracting the unique values.
#' @param ... Unused.
#' @return A vector of unique terms.
#' @seealso \code{\link{repair_terms}()}
#' @export
#' 
#' @examples 
#' unique(term(c("a", "a[2 ]", "a [1]")))
#' unique(term(c("a", "b[2 ]", "a [1]")))
unique.term <- function(x, incomparables = FALSE, repair_terms = TRUE, ...) {
  check_flag(repair_terms)
  check_unused(...)
  if(repair_terms) x <- repair_terms(x) 
  as.term(unique(as.character(x)))
}

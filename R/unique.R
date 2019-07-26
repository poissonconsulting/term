#' Extract Unique Elements
#' 
#' @param x A term vector.
#' @param incomparables Ignored.
#' @param ... Unused.
#' @return A term vector.
#' @export
#' 
#' @examples 
#' unique(term(c("a[2]", "a[1]", "a[1]")))
unique.term <- function(x, incomparables = FALSE, ...) {
  check_unused(...)
  as.term(unique(as.character(x)))
}
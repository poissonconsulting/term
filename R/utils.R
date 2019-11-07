#' Combine Term Vectors
#'
#' @param ... Term vectors to concatenate
#' @param recursive Ignored.
#'
#' @return A term vector.
#' @seealso [term-vector()]
#' @export
#'
#' @examples
#' c(NA_term_, "b", "a[1]", "")
c.term <- function(..., recursive = FALSE) {
  chk_false(recursive)
  dots <- list(...)
  as.term(c(unlist(lapply(dots, unclass))))
}

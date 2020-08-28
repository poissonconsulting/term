#' @export
anyDuplicated.term <- function(x, incomparables = FALSE, ...) {
  anyDuplicated(as_term_rcrd(x), incomparables = incomparables, ...)
}

#' @export
anyDuplicated.term_rcrd <- function(x, incomparables = FALSE, ...) {
  chk_false(incomparables)
  chk_unused(...)
  anyDuplicated(as.data.frame(x))
}

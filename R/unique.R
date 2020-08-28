#' @export
unique.term <- function(x, incomparables = FALSE, ...) {
  as_term(unique(as_term_rcrd(x), incomparables = incomparables, ...))
}

#' @export
unique.term_rcrd <- function(x, incomparables = FALSE, ...) {
  chk_false(incomparables)
  chk_unused(...)
  x[!duplicated(as.data.frame(x))]
}

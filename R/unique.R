#' @export
unique.term <- function(x, incomparables = FALSE, ...) {
  as_term(unique(as_term_rcrd(x), incomparables = incomparables, ...))
}

#' @export
unique.term_rcrd <- function(x, incomparables = FALSE, ...) {
  chk_false(incomparables)
  x <- x[!duplicated(x[c("par", "dim")]),,drop = FALSE]
  row.names(x) <- NULL
  x
}

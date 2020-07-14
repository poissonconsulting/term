npdims_terms_impl <- function(x) {
  is_na <- vapply(x$dim, identical, TRUE, y = NA_integer_)
  y <- vapply(x$dim, length, 1L)
  names(y) <- x$par
  is.na(y[is_na]) <- TRUE
  y
}

npdims_terms <- function(x) {
  chk_s3_class(x, "term")
  names <- pars_terms(x)
  x <- tindex(x)
  is_na <- vapply(x, identical, TRUE, y = NA_integer_)
  x <- vapply(x, length, 1L)
  names(x) <- names
  is.na(x[is_na]) <- TRUE
  x
}

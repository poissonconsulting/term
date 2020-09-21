#' @export
format.term <- function(x, ...) {
  tick_if_spaces(unclass(x))
}

#' @export
format.term_rcrd <- function(x, ...) {
  format(vec_cast(x, new_term()))
}

tick_if_spaces <- function(x) {
  # FIXME: What about backticks in identifiers?
  bad <- grep("^$| ", x)
  x[bad] <- paste0("`", x[bad], "`")
  x
}

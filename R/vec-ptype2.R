#' @export
vec_ptype2.term.default <- function(x, y, ..., x_arg = "x", y_arg = "y") {
  vec_default_ptype2(x, y, x_arg = x_arg, y_arg = y_arg)
}

#' @export
vec_ptype2.term.character <- function(x, y, ...) character()

#' @export
vec_ptype2.character.term <- function(x, y, ...) character()

#' @export
vec_ptype2.term_rcrd.term_rcrd <- function(x, y, ...) {
  x
}

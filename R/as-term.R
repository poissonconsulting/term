#' Coerce to a Term Vector
#'
#' Coerces an R object to a [term-vector()].
#'
#' @inheritParams params
#'
#' @seealso [term-vector()] and [repair_terms()]
#' @export
#'
#' @examples
#' as.term(matrix(1:4, 2))
#' as.term(c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]"))
as.term <- function(x, ...) UseMethod("as.term")

#' @describeIn as.term Coerce character vector to term vector
#' @export
as.term.character <- function(x, repair = FALSE, ...) {
  chk_unused(...)
  chk_flag(repair)
  x <- set_class(x, c("term", "character"))
  x[is.na(x)] <- NA_term_
  if (repair) x <- repair_terms(x)
  x
}

#' @describeIn as.term Coerce default object to term vector
#' @export
as.term.numeric <- function(x, name = "par", ...) {
  chk_string(name)
  chk_unused(...)
  term(dims(x), name = name)
}

#' @export
as.term.term <- function(x, ...) {
  chk_unused(...)
  x
}

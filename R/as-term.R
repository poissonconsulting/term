#' Coerce to a Term Vector
#'
#' Coerces an R object to a \code{\link{term-vector}}.
#' 
#' @param x The object to coerce.
#' @param name A string of the name for the parameter.
#' @param ... Unused.
#' @seealso \code{\link{term-vector}}
#' @export
#' 
#' @examples
#' as.term(matrix(1:4, 2))
#' as.term(c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]")) 
as.term <- function(x, ...) UseMethod("as.term")

#' @describeIn as.term Coerce character vector to term vector
#' @export
as.term.character <- function(x, ...) {
  check_unused(...)
  set_class(x, c("term", "character"))
}

#' @describeIn as.term Coerce default object to term vector
#' @export
as.term.default <- function(x, name = "par", ...) {
  check_string(name)
  check_unused(...)
  term(dims(x), name = name)
}

#' @export
as.term.term <- function(x, ...) {
  check_unused(...)
  x
}

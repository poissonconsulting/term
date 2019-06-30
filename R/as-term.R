#' Coerce to a term Vector
#'
#' Coerces an R object to a term vector.
#' 
#' A term vector is a sortable vector of parameter terms.
#'
#' @param x The object to coerce
#' @param ... Unused.
#' @export
#' @examples
#' as.term(c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]", 
#' "parm[2,1]", "parm[1,2]", "parm[10]", "parm3"))
as.term <- function(x, ...) UseMethod("as.term")

#' @describeIn as.term Coerces character vector to a term vector
#' @export
as.term.character <- function(x, ...) set_class(x, c("term", "character"))

#' @export
as.term.default <- function(x, name = "parameter", ...) {
  check_unused(...)
  as.term(term_dims(x, name))
}

#' @export
as.term.term <- function(x, ...) x

#' Coerce to a term Vector
#'
#' Coerces an R object to a term vector.
#' 
#' A term vector is a S3 vector of parameter terms.
#'
#' @param x The object to coerce
#' @param ... Unused.
#' @export
#' @examples
#' term <- as.term(c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]")) 
#' term
#' sort(term)
#' str(term)
as.term <- function(x, ...) UseMethod("as.term")

#' @export
as.term.character <- function(x, ...) set_class(x, c("term", "character"))

#' @export
as.term.default <- function(x, name = "parameter", ...) {
  check_unused(...)
  as.term(term_dims(x, name))
}

#' @export
as.term.term <- function(x, ...) x

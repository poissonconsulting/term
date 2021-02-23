#' Coerce to a Term Record
#'
#' Coerces an R object to a `term_rcrd`.
#'
#' @inheritParams params
#'
#' @seealso [as_term()] and [repair_terms()]
#' @export
#'
#' @examples
#' as_term(matrix(1:4, 2))
#' as_term(c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]"))
as_term_rcrd <- function(x, ...) UseMethod("as_term_rcrd")

#' @describeIn as_term_rcrd Coerce character vector to term_rcrd
#' @export
as_term_rcrd.character <- function(x, repair = FALSE, ...) {
  as_term_rcrd(as_term(x, repair = repair, normalize = FALSE, ...))
}

#' @describeIn as_term_rcrd Coerce numeric vector to term_rcrd
#' @export
as_term_rcrd.numeric <- function(x, name = "par", ...) {
  as_term_rcrd(as_term(x, name = name, ...))
}

#' @describeIn as_term_rcrd Coerce term vector to term_rcrd
#' @export
as_term_rcrd.term <- function(x, repair = FALSE, ...) {
  chk_flag(repair)
  chk_unused(...)
  if(repair) x <- repair_terms(x, normalize = FALSE)
  vec_cast(x, new_term_rcrd())
}

#' @export
as_term_rcrd.term_rcrd <- function(x, ...) x

#' @export
as_term_rcrd.default <- function(x, ...) vec_cast(x, new_term_rcrd())

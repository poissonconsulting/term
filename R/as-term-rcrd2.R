#' Coerce to a Term Record2
#'
#' Coerces an R object to a `term_rcrd2`.
#'
#' @inheritParams params
#'
#' @seealso [repair_terms()]
#' @export
#'
#' @examples
#' as_term(matrix(1:4, 2))
#' as_term(c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]"))
as_term_rcrd2 <- function(x, ...) UseMethod("as_term_rcrd2")

#' @export
as_term_rcrd2.term <- function(x, repair = FALSE, ...) {
  chk_flag(repair)
  chk_unused(...)
  if(repair) x <- repair_terms(x, normalize = FALSE)
  vec_cast(x, new_term_rcrd2())
}

#' @describeIn as_term_rcrd2 Coerce character vector to term_rcrd
#' @export
as_term_rcrd2.character <- function(x, repair = FALSE, ...) {
  as_term_rcrd2(as_term(x, repair = repair, normalize = FALSE, ...))
}

#' @describeIn as_term_rcrd2 Coerce numeric vector to term_rcrd
#' @export
as_term_rcrd2.numeric <- function(x, name = "par", ...) {
  as_term_rcrd2(as_term(x, name = name, ...))
}

#' @describeIn as_term_rcrd2 Coerce term vector to term_rcrd
#' @export
as_term_rcrd2.term <- function(x, repair = FALSE, ...) {
  chk_flag(repair)
  chk_unused(...)
  if(repair) x <- repair_terms(x, normalize = FALSE)
  vec_cast(x, new_term_rcrd2())
}

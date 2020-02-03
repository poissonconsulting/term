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
  lifecycle::deprecate_soft(
    "0.2.0", "term::as.term.character()", "vctrs::vec_cast()",
    details = "Use `term(par = dims(x))` instead."
  )

  if (!missing(repair)) {
    lifecycle::deprecate_soft(
      "0.2.0", "term::as.term.character(repair = )", "vctrs::vec_cast()",
      details = "Use `repair_terms()`."
    )
  }

  chk_unused(...)
  chk_flag(repair)

  if (repair) {
    x <- repair_terms_impl(x)
  }

  new_term(x)
}

#' @describeIn as.term Coerce default object to term vector
#' @export
as.term.numeric <- function(x, name = "par", ...) {
  lifecycle::deprecate_soft(
    "0.2.0", "term::as.term.numeric()",
    details = "Use `term(par = dims(x))` instead."
  )

  chk_string(name)
  chk_unused(...)
  term_impl(list2(!!name := dims(x)))
}

#' @export
as.term.term <- function(x, ...) {
  lifecycle::deprecate_soft(
    "0.2.0", "term::as.term.term()", "vctrs::vec_cast()"
  )

  chk_unused(...)
  x
}

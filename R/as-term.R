#' Coerce to a Term Vector
#'
#' Coerces an R object to a [term-vector()].
#'
#' `as.term` has been `r lifecycle::badge("soft-deprecated")` for `as_term`.
#'
#' @inheritParams params
#'
#' @seealso [term-vector()] and [repair_terms()]
#' @export
#'
#' @examples
#' as_term(matrix(1:4, 2))
#' as_term(c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]"))
as_term <- function(x, ...) UseMethod("as_term")

#' @rdname as_term
#' @export
as.term <- function(x, ...) {
  out <- UseMethod("as.term")
  deprecate_soft("0.2.0", "as.term()", "as_term()")
  out
}

#' @export
as.term.default <- function(x, ..., from_as_term = FALSE) {
  if(vld_false(from_as_term)) return(as_term(x, ...))
  vec_cast(x, new_term())
}

#' @export
as_term.default <- function(x, ...) {
  tryCatch(
    vec_cast(x, new_term()),
    error = function(e_cast) {
      tryCatch(
        as.term(x, ..., from_as_term = TRUE),
        error = function(e) {
          rlang::cnd_signal(e_cast)
        }
      )
    }
  )
}

#' @describeIn as_term Coerce character vector to term vector
#' @export
as_term.character <- function(x, repair = FALSE, normalize = repair, ...) {
  chk_flag(repair)
  chk_unused(...)

  if (repair) {
    x <- repair_terms_impl(x)
  }
  if(normalize) {
    x <- normalize_terms_impl(x)
  }

  new_term(x)
}

#' @describeIn as_term Coerce numeric object to term vector
#' @export
as_term.numeric <- function(x, name = "par", ...) {
  chk_string(name)
  chk_unused(...)

  term(!!name := dims(x))
}

#' @export
as_term.term <- function(x, ...)  x

#' @export
as_term.term_rcrd <- function(x, ...) {
  chk_unused(...)
  vec_cast(x, new_term())
}

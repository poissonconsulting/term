#' @export
universals::pars

#' @inherit universals::pars
#' @inheritParams params
#' @seealso [universals::pars]
#' @family parameters
#' @export
#' @examples
#' pars(matrix(1:4, nrow = 2))
pars.default <- function(x, scalar = NULL, ...) {
  chk_unused(...)
  x <- as_term(x)
  pars(x, scalar = scalar)
}

#' @inherit universals::pars
#' @inheritParams params
#' @seealso [universals::pars]
#' @family parameters
#' @export
#' @examples
#' pars(c("a", "b[1]", "a[3]"))
pars.character <- function(x, scalar = NULL, ...) {
  chk_unused(...)
  x <- term(x) # stricter than default
  pars(x, scalar = scalar)
}

#' Parameter Names
#'
#' @inherit universals::pars
#'
#' @inheritParams params
#' @family parameters
#' @seealso [universals::pars]
#' @export
#'
#' @examples
#' term <- term(
#'   "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#'   "beta[1,2]", "beta[2,2]", "sigma", NA
#' )
#' pars(term)
#' pars(term, scalar = TRUE)
#' pars(term, scalar = FALSE)
pars.term <- function(x, scalar = NULL, terms = FALSE, ...) {
  if (!missing(terms)) {
    deprecate_warn("0.2.1", "term::pars(terms =)")
  }
  if (isTRUE(terms)) {
    return(pars_terms(x))
  }

  pars(as_term_rcrd(x), scalar = scalar, ...)
}

#' Parameter Names
#'
#' @inherit universals::pars
#'
#' @inheritParams params
#' @family parameters
#' @seealso [universals::pars]
#' @export
#'
#' @examples
#' term <- term(
#'   "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#'   "beta[1,2]", "beta[2,2]", "sigma", NA
#' )
#' pars(term)
#' pars(term, scalar = TRUE)
#' pars(term, scalar = FALSE)
pars.term_rcrd <- function(x, scalar = NULL, ...) {
  # FIXME hack for nlist v0.1.0 and v0.1.1
  if (identical(scalar, NA)) scalar <- NULL
  if (!is.null(scalar)) chk_flag(scalar)
  chk_unused(...)

  if (!is.null(scalar)) {
    bol <- scalar_term(x)
    x <- x[is.na(bol) | if (scalar) bol else !bol]
  }
  unique(field(x, "par"))
}

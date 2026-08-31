#' @export
universals::pars

# The terms argument is defunct but only pars.term() carries it as a formal.
# The other methods absorb it into ... where chk_unused() would report it as an
# unused argument, which says nothing about the replacement, so intercept it
# first and raise the same defunct error.
stop_defunct_terms <- function(...) {
  if ("terms" %in% ...names()) {
    deprecate_stop("0.2.0", "term::pars(terms =)")
  }
}

#' @inherit universals::pars
#' @inheritParams params
#' @seealso [universals::pars]
#' @family parameters
#' @export
#' @examples
#' pars(matrix(1:4, nrow = 2))
pars.default <- function(x, scalar = NULL, ...) {
  stop_defunct_terms(...)
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
  stop_defunct_terms(...)
  chk_unused(...)
  x <- term(x) # stricter than default
  pars(x, scalar = scalar)
}

#' Parameter Names
#'
#' @inherit universals::pars
#'
#' @details
#' The `terms` argument is `r lifecycle::badge("defunct")`.
#' Use [pars_terms()] to get the parameter name for each term element.
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
    deprecate_stop("0.2.0", "term::pars(terms =)")
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
  if (!is.null(scalar)) {
    chk_flag(scalar)
  }
  stop_defunct_terms(...)
  chk_unused(...)

  if (!is.null(scalar)) {
    bol <- scalar_term(x)
    x <- x[is.na(bol) | if (scalar) bol else !bol]
  }
  unique(field(x, "par"))
}

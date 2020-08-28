#' Term Parameters
#'
#' Gets the name of each parameter for each term.
#'
#' The scalar argument is  \lifecycle{defunct}
#'
#' @inheritParams params
#' @param x A term vector.
#' @return A character vector of the term parameter names.
#' @family parameters
#' @export
#'
#' @examples
#' term <- term(
#'   "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#'   "beta[1,2]", "beta[2,2]", "sigma", NA
#' )
#' pars_terms(term)
pars_terms <- function(x, scalar = NULL, ...) {
  chkor(is_term(x), is_term_rcrd(x), is_term_rcrd2(x))
  if(!missing(scalar)) {
    deprecate_stop("0.2.1", "term::pars_terms(scalar =)")
  }
  chk_unused(...)

  x <- as_term_rcrd(x)
  x$par
}

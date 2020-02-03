#' @export
universals::pars

#' Parameter Names
#'
#' @inherit universals::pars
#'
#' @inheritParams params
#' @param terms A flag specifying whether to return the parameter name
#' for each term element.
#' @family {parameters}
#' @export
#'
#' @examples
#' term <- term(
#'   "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#'   "beta[1,2]", "beta[2,2]", "sigma", NA
#' )
#' pars(term)
pars.term <- function(x, scalar = NA, terms = FALSE, ...) {
  chk_lgl(scalar)
  chk_flag(terms)
  chk_unused(...)

  if(!missing(terms)) {
    deprecate_soft("0.1.0.9003", "term::pars(terms =)", details = "If `terms = TRUE` use `pars_terms() otherwise replace `pars(terms = FALSE)` with `pars()`.")
  }

  if(!missing(scalar)) {
    deprecate_soft("0.1.0.9003", "term::pars(scalar =)", details = "If `scalar = TRUE` use `pars_scalar() otherwise replace `pars(scalar = NA)` with `pars()`.")
  }

  x <- as.character(x)
  if (!is.na(scalar)) {
    bol <- grepl("\\[", x)
    x <- x[if (scalar) !bol else bol]
  }
  x <- sub(p0("^(", .par_name_pattern, ")(.*)"), "\\1", x)
  if (!terms) x <- unique(x)
  x
}

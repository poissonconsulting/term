#' @export
universals::pars_terms

#' @inherit universals::pars_terms
#' @inheritParams params
#' @export
#'
#' @examples
#' term <- as.term(c(
#'   "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#'   "beta[1,2]", "beta[2,2]", "sigma", NA
#' ))
#' pars_terms(term)
pars_terms.term <- function(x, scalar = NA, ...) {
  chk_lgl(scalar)
  chk_unused(...)
  scalar_term <- scalar_term(x)
  x <- as.character(x)
  x <- sub(p0("^(", .par_name_pattern, ")(.*)"), "\\1", x)
  if(vld_true(scalar)) x <- x[scalar_term]
  if(vld_false(scalar)) x <- x[!scalar_term]
  x
}

# internal use only
pars_terms.character <- function(x, scalar = NA, ...) {
  pars_terms(as.term(x), scalar = scalar, ...)
}

#' @importFrom universals pars_terms
#' @export
universals::pars_terms

#' @inherit universals::pars_terms
#' @export
#'
#' @examples
#' term <- as.term(c(
#'   "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#'   "beta[1,2]", "beta[2,2]", "sigma", NA
#' ))
#' pars_terms(term)
pars_terms.term <- function(x, ...) {
  x <- as.character(x)
  sub(p0("^(", .par_name_pattern, ")(.*)"), "\\1", x)
}

# internal use only
pars_terms.character <- function(x, ...) {
  pars_terms(as.term(x))
}

#' @importFrom universals pars
#' @export
universals::pars

#' Parameter Names
#'
#' @inherit universals::pars
#'
#' @inheritParams params
#' @param terms A flag specifying whether to return the parameter name
#' for each term element.
#' @export
#'
#' @examples
#' term <- as.term(c(
#'   "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#'   "beta[1,2]", "beta[2,2]", "sigma", NA
#' ))
#' pars(term)
#' pars(term, scalar = TRUE)
#' pars(term, terms = TRUE)
pars.term <- function(x, scalar = NA, terms = FALSE, ...) {
  chk_lgl(scalar)
  chk_flag(terms)
  chk_unused(...)

  x <- as.character(x)
  if (!is.na(scalar)) {
    bol <- grepl("\\[", x)
    x <- x[if (scalar) !bol else bol]
  }
  x <- sub(p0("^(", .par_name_pattern, ")(.*)"), "\\1", x)
  if (!terms) x <- unique(x)
  x
}

# internal use only
pars.character <- function(x, scalar = NA, terms = FALSE, ...) {
  pars(as.term(x), scalar = scalar, terms = terms)
}

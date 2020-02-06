#' @export
universals::pars_scalar

#' @inherit universals::npars_scalar
#' @export
pars_scalar.default <- function(x, ...) {
  chk_unused(...)
  x <- as.term(x)
  pars_scalar(x)
}

#' @inherit universals::npars_scalar
#' @export
#' @examples
#' pars_scalar(c("a", "b[1]", "a[3]"))
pars_scalar.character <- function(x, ...) {
  chk_unused(...)
  x <- term(x) # stricter than default
  pars_scalar(x)
}

#' @inherit universals::npars_scalar
#' @export
#' @examples
#' term <- term(
#'   "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#'   "beta[1,2]", "beta[2,2]", "sigma", NA
#' )
#' pars_scalar(term)
pars_scalar.term <- function(x, ...) {
  chk_s3_class(x, "term")
  chk_unused(...)

  x <- x[scalar_term(x)]
  x <- as.character(x)
  x <- sub(p0("^(", .par_name_pattern, ")(.*)"), "\\1", x)
  unique(x)
}

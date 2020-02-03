#' Scalar Parameters
#'
#' Gets the name of each scalar parameter.
#'
#' Useful for subsetting MCMC objects.
#'
#' @inheritParams params
#' @return A character vector of the parameter names.
#' @family {parameters}
#' @export
pars_scalar <- function(x, ...) {
  UseMethod("pars_scalar")
}

#' @describeIn pars_scalar Scalar Parameter Names for term vector
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

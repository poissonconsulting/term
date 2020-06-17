#' Term Parameters
#'
#' Gets the name of each parameter for each term.
#'
#' The scalar argument has been `r lifecycle::badge("soft-deprecated")`.
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
  chk_s3_class(x, "term")
  # FIXME hack for nlist v0.1.0 and v0.1.1
#  if(identical(scalar, NA)) scalar <- NULL
  if(!is.null(scalar)) chk_flag(scalar)
  chk_unused(...)

  if(!is.null(scalar)) {
    deprecate_soft("0.2.0", "term::pars_terms(scalar =)",
                   details = "More specifically the scalar argument has been soft-deprecated.")
  }

  scalar_term <- scalar_term(x)
  x <- as.character(x)
  x <- sub(p0("^(", .par_name_pattern, ")(.*)"), "\\1", x)
  if(vld_true(scalar)) x <- x[scalar_term]
  if(vld_false(scalar)) x <- x[!scalar_term]
  x
}

#' Term Parameters 
#'
#' Gets the name of each parameter for each term.
#'
#' @inheritParams params
#' @param x A term vector.
#' @return A character vector of the term parameter names.
#' @family {parameters}
#' @export
#' 
#' @examples
#' term <- as.term(c(
#'   "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#'   "beta[1,2]", "beta[2,2]", "sigma", NA
#' ))
#' pars_terms(term)
pars_terms <- function(x, scalar = NA, ...) {
  chk_s3_class(x, "term")
  chk_lgl(scalar)
  chk_unused(...)
  
  if(!missing(scalar)) {
    deprecate_soft("0.1.0.9003", "pars_terms(scalar =)")
  }
  
  scalar_term <- scalar_term(x)
  x <- as.character(x)
  x <- sub(p0("^(", .par_name_pattern, ")(.*)"), "\\1", x)
  if(vld_true(scalar)) x <- x[scalar_term]
  if(vld_false(scalar)) x <- x[!scalar_term]
  x
}

#' @export
universals::pars

#' @inherit universals::pars
#' @inheritParams params
#' @export
pars.default <- function(x, scalar = NULL, ...) {
  chk_unused(...)
  x <- as_term(x)
  pars(x, scalar = scalar)
}

#' @inherit universals::pars
#' @inheritParams params
#' @export
#' @examples
#' pars(c("a", "b[1]", "a[3]"))
pars.character <- function(x, scalar = NULL, ...) {
  chk_unused(...)
  x <- term(x) # stricter than default
  pars(x, scalar = scalar)
}

#' Parameter Names
#'
#' @inherit universals::pars
#'
#' @inheritParams params
#' @param terms A flag specifying whether to return the parameter name
#' for each term element.
#' @family parameters
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
  # FIXME hack for nlist v0.1.0 and v0.1.1
  if(identical(scalar, NA)) scalar <- NULL
  if(!is.null(scalar)) chk_flag(scalar)
  chk_flag(terms)
  chk_unused(...)

  if(terms) {
    deprecate_soft("0.2.0", "term::pars(terms =)", details = "If `terms = TRUE` use `pars_terms() otherwise replace `pars(terms = FALSE)` with `pars()`.")
  }

  x <- as.character(x)
  if(!is.null(scalar)) {
    bol <- grepl("\\[", x)
    x <- x[is.na(x) | if(scalar) !bol else bol]
  }
  x <- sub(p0("^(", .par_name_pattern, ")(.*)"), "\\1", x)
  if (!terms) x <- unique(x)
  x
}

#' @importFrom universals npdims
#' @export
universals::npdims

#' Number of Parameter Dimensions of a term
#'
#' @inherit universals::npars
#' @param terms A flag specifying whether to get the number of dimensions for each term element.
#' @export
#'
#' @examples
#' npdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")))
#' npdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")), terms = TRUE)
npdims.term <- function(x, terms = FALSE, ...) {
  chk_flag(terms)
  chk_unused(...)

  if (!terms) {
    return(vapply(pdims(x), length, 1L))
  }
  x <- tindex(x)
  names(x) <- pars_terms(as.term(names(x)))
  is.na <- vapply(x, identical, TRUE, y = NA_integer_)
  x <- vapply(x, length, 1L)
  is.na(x[is.na]) <- TRUE
  x
}

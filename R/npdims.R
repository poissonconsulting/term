#' @export
universals::npdims

#' Number of Dimensions of Each Parameter
#'
#' The terms argument is  `r lifecycle::badge("defunct")`.
#'
#' @inherit universals::npdims
#' @param terms A flag specifying whether to get the number of dimensions for each term element.
#'
#' @export
#'
#' @examples
#' npdims(term("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]"))
npdims.term <- function(x, terms = FALSE, ...) {
  chk_flag(terms)
  chk_unused(...)

  # when archive can remove entire function as covered by default
  if (!missing(terms)) {
    deprecate_stop("0.2.1", "term::npdims(terms =)")
  }
  vapply(pdims(x), length, 1L)
}

#' @export
universals::npdims

#' Number of Dimensions of each Parameter
#'
#' The terms argument is  \lifecycle{defunct}
#'
#' @inherit universals::npars
#' @param terms A flag specifying whether to get the number of dimensions for each term element.
#'
#' @export
#'
#' @examples
#' npdims(term("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]"))
npdims.term <- function(x, terms = FALSE, ...) {
  chk_flag(terms)
  chk_unused(...)

  if(!missing(terms)) {
    deprecate_stop("0.2.1", "term::npdims(terms =)")
  }
  vapply(pdims(x), length, 1L)
}

#' @export
universals::npdims

#' Number of Dimensions of each Parameter
#'
#' @inherit universals::npars
#' @param terms A flag specifying whether to get the number of dimensions for each term element.
#' @export
#'
#' @examples
#' npdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")))
npdims.term <- function(x, terms = FALSE, ...) {
  chk_flag(terms)
  chk_unused(...)
  
  if(!missing(terms)) {
    deprecate_soft("0.1.0.9003", "term::npdims(terms =)", details = "If `terms = TRUE` use `npdims_terms() otherwise replace `npdims(terms = FALSE)` with `npdims()`.")
  }
  
  if (terms) {
    return(npdims_terms(x))
  }
  vapply(pdims(x), length, 1L)
}

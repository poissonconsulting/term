#' @export
universals::nterms

#' Number of Terms of a term
#' 
#' Gets the number of unique terms.
#' 
#' If the term vector includes
#' missing values then it returns NA_integer.
#'
#' @inherit universals::nterms
#' @export
#'
#' @examples
#' nterms(term("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
#' nterms(term("alpha[1]", "alpha[1]", "beta[1,1]", "beta[1,1]"))
nterms.term <- function(x, ...) {
  if (anyNA(x)) {
    return(NA_integer_)
  }
  length(unique(x))
}

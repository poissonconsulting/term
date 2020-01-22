#' @importFrom universals npars
#' @export
universals::npars

#' Number of Parameters of a term
#' 
#' @inherit universals::dims
#' @param scalar A flag specifying whether to only count parameters with one term.
#' @export
#'
#' @examples
#' npars(as.term(c("sigma", "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]")))
#' npars(as.term(c("sigma", "alpha[1]", "alpha[2]")), scalar = TRUE)
npars.term <- function(x, scalar = NA, ...) {
  chk_unused(...)
  if (anyNA(x)) {
    return(NA_integer_)
  }
  length(pars(x, scalar = scalar))
}

#' @export
universals::npars

#' @inherit universals::npars
#' @inheritParams params
#' @export
#'
#' @examples
#' npars(term("sigma", "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
npars.term <- function(x, scalar = NULL, ...) {
  if (anyNA(x)) {
    return(NA_integer_)
  }
  length(pars(x, scalar = scalar, ...))
}

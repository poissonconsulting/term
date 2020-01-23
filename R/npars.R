#' @importFrom universals npars
#' @export
universals::npars

#' @inherit universals::npars
#' @inheritParams params
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

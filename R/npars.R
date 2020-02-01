#' @export
universals::npars

#' @inherit universals::npars
#' @inheritParams params
#' @export
#'
#' @examples
#' npars(as.term(c("sigma", "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]")))
npars.term <- function(x, scalar = NA, ...) {
  chk_unused(...)
  
  if(!missing(scalar)) {
    deprecate_soft("0.1.0.9003", "npars(scalar =)", details = "If `scalar = TRUE` use `npars_scalar() otherwise replace `pars(scalar = NA)` with `npars()`.")
  }
  if (anyNA(x)) {
    return(NA_integer_)
  }
  length(pars(x, scalar = scalar))
}

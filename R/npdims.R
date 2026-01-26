#' @export
universals::npdims

#' Number of Dimensions of Each Parameter
#'
#' @inherit universals::npdims
#'
#' @export
#'
#' @examples
#' npdims(term("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]"))
npdims.term <- function(x, ...) {
  chk_unused(...)

  vapply(pdims(x), length, 1L)
}

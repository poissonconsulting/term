#' @export
universals::dims

#' @inherit universals::dims
#' @export
#' @examples
#'
#' dims(term("beta[1,1]"))
#' dims(term("beta[1,1]", "beta[1,2]"))
dims.term <- function(x, ...) {
  length(x)
}

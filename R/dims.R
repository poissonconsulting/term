#' @importFrom universals dims
#' @export
universals::dims

#' Dimensions of a term
#'
#' @inherit universals::dims
#' @export
#' @examples
#'
#' dims(as.term("beta[1,1]"))
#' dims(as.term(c("beta[1,1]", "beta[1,2]")))
dims.term <- function(x, ...) {
  length(x)
}

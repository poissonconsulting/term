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

#' @inherit universals::dims
#' @export
#' @examples
#'
#' dims(term_rcrd("beta[1,1]"))
#' dims(term_rcrd("beta[1,1]", "beta[1,2]"))
dims.term_rcrd <- function(x, ...) {
  length(x)
}

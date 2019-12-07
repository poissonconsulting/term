#' Parameter Dimensions
#'
#' Gets the parameter dimensions of an object as a named list of the dimensions
#' of each parameter.
#'
#' Errors if the parameter dimensions are inconsistent.
#'
#' A named list of the dimensions of each parameter can be converted
#' into the equivalent [term-vector()] using [term()].
#'
#' @param x The object
#' @param ... Unused.
#' @return A named list of the dimensions of each parameter.
#' @seealso [dims()] and [term()]
#' @export
#'
#' @examples
#' pdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")))
pdims <- function(x, ...) UseMethod("pdims")

#' @export
pdims.term <- function(x, ...) {
  chk_not_any_na(x)
  if (is.inconsistent_terms(x)) {
    err("`x` must have terms with consistent parameter dimensions.")
  }
  x <- sort(x)
  names <- pars(x)
  x <- split(x, pars(x, terms = TRUE))
  x <- lapply(x, max_index)
  x
}

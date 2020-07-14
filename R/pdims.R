#' @export
universals::pdims

#' @details Errors if the parameter dimensions are invalid or inconsistent.
#'
#' A named list of the dimensions of each parameter can be converted
#' into the equivalent [term-vector()] using [term()].
#'
#' @inherit universals::pdims
#' @export
#'
#' @examples
#' pdims(term("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]"))
pdims.term <- function(x, ...) {

  if(anyNA(x)) abort_chk("`x` must not have any missing values")
  if (is_inconsistent_terms(x)) {
    abort_chk("`x` must have terms with consistent parameter dimensions")
  }
  x <- split(x, pars_terms(x))
  x <- lapply(x, max_index)
  x
}

#' @details Errors if the parameter dimensions are inconsistent.
#'
#' @inherit universals::pdims
#' @export
#'
#' @examples
#' pdims(as_term_rcrd(term("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")))
pdims.term_rcrd <- function(x, ...) {
  x <- as_term(x)
  pdims(x)
}

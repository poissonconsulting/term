#' Number of Parameter Dimensions
#'
#' Gets the number of parameter dimensions of an object as returned by [pdims()].
#'
#' @param x The object.
#' @param terms A flag specifying whether to get the number of dimensions for each
#' term element.
#' @param ... Unused.
#' @return A named integer vector of the number of dimensions of each parameter.
#' @seealso [pdims()] and [term-vector()]
#' @export
#'
#' @examples
#' npdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")))
#' npdims(as.term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")), terms = TRUE)
npdims <- function(x, ...) UseMethod("npdims")

#' @describeIn npdims Number of parameter dimensions of term vector
#' @export
npdims.term <- function(x, terms = FALSE, ...) {
  chk_flag(terms)
  chk_unused(...)

  if (!terms) {
    return(vapply(pdims(x), length, 1L))
  }
  x <- tindex(x)
  names(x) <- pars(as.term(names(x)), terms = TRUE)
  is.na <- vapply(x, identical, TRUE, y = NA_integer_)
  x <- vapply(x, length, 1L)
  is.na(x[is.na]) <- TRUE
  x
}

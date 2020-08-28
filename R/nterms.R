#' @export
universals::nterms

#' Number of Terms
#'
#' Gets the number of terms of an object.
#'
#' @inherit universals::nterms
#' @export
#'
#' @examples
#' nterms(term("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
#' nterms(term("alpha[1]", "alpha[1]", "beta[1,1]", "beta[1,1]"))
nterms.default <- function(x, ...) {
  nterms(as_term(x, ...))
}

#' Number of Terms of a term
#'
#' @inherit universals::nterms
#' @export
#'
#' @examples
#' nterms(term("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
#' nterms(term("alpha[1]", "alpha[1]", "beta[1,1]", "beta[1,1]"))
nterms.term <- function(x, ...) {
  length(x)
}

#' Number of Terms of a term_rcrd
#'
#' @inherit universals::nterms
#' @export
#'
#' @examples
#' nterms(as_term_rcrd(term("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]")))
#' nterms(as_term_rcrd(term("alpha[1]", "alpha[1]", "beta[1,1]", "beta[1,1]")))
nterms.term_rcrd <- function(x, ...) {
  length(x)
}

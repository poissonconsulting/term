#' Scalar Term
#'
#' Test whether each term is a scalar.
#'
#' @inheritParams params
#' @return A logical vector indicating whether the term is a scalar.
#' @export
#'
#' @examples
#' scalar_term(term("alpha[1]", "alpha[3]", "beta[1]", "sigma[3]"))
#' scalar_term(term("alpha[1]", NA_term_, "beta[1]", "beta[3]"))
scalar_term <- function(x) {
  x <- as_term_rcrd(x)
  dim1 <- vapply(x$dim, function(x) identical(x, 1L), TRUE)
  pars_terms <- x$par
  scalar_term <- dim1 & !pars_terms %in% unique(pars_terms[!dim1])
  scalar_term[is.na(pars_terms)] <- NA
  scalar_term
}

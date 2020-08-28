#' Consistent Terms
#'
#' Test whether the number of dimensions of terms in the same parameter are consistent.
#'
#' @inheritParams params
#' @return A logical vector indicating whether the number of dimensions is consistent.
#' @seealso [term-vector()] and [npdims()]
#' @export
#'
#' @examples
#' consistent_term(term("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]"))
#' consistent_term(term("alpha[1]", NA_term_, "beta[1,1]", "beta[2]"))
consistent_term <- function(x) {
  chkor(chk_s3_class(x, "term"), chk_s3_class(x, "term_rcrd"))
  x <- as_term_rcrd(x, repair = TRUE)
  names <- field(x, "par")
  x <- npdims_terms_impl(x)
  names(x) <- names
  y <- x[!is.na(x)]
  for (par in unique(names(y))) {
    bol <- names(y) == par
    y[bol] <- length(unique(y[bol])) == 1L
  }
  x[!is.na(x)] <- y
  as.logical(x)
}

#' Term Index
#'
#' Gets the index for each term of an term or term_rcrd object.
#'
#' For example the index of `beta[2,1]` is `c(2L, 1L)`
#' while the index for `sigma` is `1L`.
#' It is useful for extracting the values of individual terms.
#'
#' @inheritParams params
#' @return A named list of integer vectors of the index for each term.
#' @seealso [dims()], [ndims()], [npdims()] and [pdims()]
#' @family term
#' @export
#'
#' @examples
#' tindex(term("alpha", "alpha[2]", "beta[1,1]", "beta[2 ,1  ]"))
tindex <- function(x) {
  if (!is_term(x) && !is_term_rcrd(x)) {
    lifecycle::deprecate_soft(
      "0.2.1", "term::tindex(x = 'must be a term or term_rcrd object')"
    )
    x <- as_term(x)
  }
  tindex <- field(as_term_rcrd(x), "dim")
  names(tindex) <- as.character(as_term(x))
  tindex
}

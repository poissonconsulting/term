#' Term Index
#'
#' Gets the index for each term of an object.
#'
#' For example the index of `beta[2,1]` is `c(2L, 1L)`
#' while the index for `sigma` is `1L`.
#' It is useful for extracting the values of individual terms.
#'
#' @inheritParams params
#' @return A named list of integer vectors of the index for each term.
#' @family dimensions
#' @export
#'
#' @examples
#' tindex(term("alpha", "alpha[2]", "beta[1,1]", "beta[2 ,1  ]"))
tindex <- function(x) {
  if (!is_term(x)) {
    lifecycle::deprecate_soft(
      "0.2.0", "term::tindex(x = 'must be a term object')"
    )
    x <- as.term(x)
  }

  tindex_impl(x)
}

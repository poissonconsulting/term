#' @inherit vctrs::vec_cast title description params
#' @seealso [vctrs::vec_cast()]
#' @method vec_cast term_rcrd
#' @export
#' @export vec_cast.term_rcrd
#' @examples
#' vec_cast(new_term(c("a[1]", "a[2]")), character())
#' vec_cast(c("a[1]", "a[2]"), new_term())
vec_cast.term_rcrd <- function(x, to, ...) UseMethod("vec_cast.term_rcrd")

#' @method vec_cast.term_rcrd default
#' @export
vec_cast.term_rcrd.default <- function(x, to, ...) {
  vec_default_cast(x, to)
}

#' @method vec_cast.term_rcrd term
#' @export
vec_cast.term_rcrd.term <- function(x, to, ...) {
  par <- pars_terms_impl(x)
  dim <- unname(tindex_impl(x))
  r <- vctrs::new_data_frame(list(par = par, dim = dim))

  new_term_rcrd(r)
}

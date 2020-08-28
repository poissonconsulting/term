#' @inherit vctrs::vec_cast title description params
#' @seealso [vctrs::vec_cast()]
#' @method vec_cast term_rcrd2
#' @export
#' @export vec_cast.term_rcrd2
#' @examples
#' vec_cast(new_term(c("a[1]", "a[2]")), character())
#' vec_cast(c("a[1]", "a[2]"), new_term())
vec_cast.term_rcrd2 <- function(x, to, ...) UseMethod("vec_cast.term_rcrd2")

#' @method vec_cast.term_rcrd2 default
#' @export
vec_cast.term_rcrd2.default <- function(x, to, ...) {
  vec_default_cast(x, to)
}

#' @method vec_cast.term_rcrd2 term_rcrd2
#' @export
vec_cast.term_rcrd2.term_rcrd2 <- function(x, to, ...) x

#' @method vec_cast.term_rcrd2 character
#' @export
vec_cast.term_rcrd2.character <- function(x, to, ...) {
  vec_cast(vec_cast(x, term()), term_rcrd2())
}

#' @export
vec_cast.term_rcrd2.term <- function(x, to, ...) {
  par <- pars_terms_impl(x)
  dim <- unname(tindex_impl(x))
  r <- vctrs::new_data_frame(list(par = par, dim = dim))

  new_term_rcrd2(r)
}

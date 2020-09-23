#' @export
vec_cast.term_rcrd.default <- function(x, to, ...) {
  vec_default_cast(x, to)
}

#' @export
vec_cast.term_rcrd.term_rcrd <- function(x, to, ...) x

#' @export
vec_cast.term_rcrd.character <- function(x, to, ...) {
  vec_cast(vec_cast(x, term()), term_rcrd())
}

#' @export
vec_cast.term_rcrd.term <- function(x, to, ...) {
  par <- pars_terms_impl(x)
  dim <- unname(tindex_impl(x))
  r <- vctrs::new_data_frame(list(par = par, dim = dim))

  new_term_rcrd(r)
}

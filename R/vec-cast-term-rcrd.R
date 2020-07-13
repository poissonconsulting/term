#' @export
vec_cast.term_rcrd.term <- function(x, to, ...) {
  par <- pars_terms_impl(x)
  dim <- unname(tindex_impl(x))
  r <- vctrs::new_data_frame(list(par = par, dim = dim))

  new_term_rcrd(r)
}

#' @export
new_term_rcrd <- function(x = data.frame(par = character(), dim = list(), stringsAsFactors = FALSE)) {
  stopifnot(is.data.frame(x))
  stopifnot(grepl("^par$|^dim$", names(x)))
  #stopifnot(grepl("^par$|^dim[1-9][0-9]*$", names(x)))
  vctrs::new_data_frame(x, class = "term_rcrd")
}

#' @export
vec_ptype2.term_rcrd.term_rcrd <- function(x, y, ...) {
  x
}

#' @export
vec_cast.term.term_rcrd <- function(x, to, ...) {
  new_term(paste0(x$par, "[", vapply(x$dim, paste, collapse = ",", FUN.VALUE = ""), "]"))
}

#' @export
vec_cast.term_rcrd.term <- function(x, to, ...) {
  par <- pars_terms(x)
  dim <- tindex(x)
  r <- vctrs::new_data_frame(list(par = par, dim = dim))

  new_term_rcrd(r)
}

#' @export
print.term_rcrd <- function(x, ...) {
  if (is.character(vec_data(x))) {
    return(NextMethod())
  }
  print(new_vctr(unclass(vec_cast(x, new_term())), class = "term_rcrd"))
}

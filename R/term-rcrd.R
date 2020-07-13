#' Construct a new term_rcrd object
#'
#' Use this function to quickly construct a term_rcrd object.
#'
#' @param x A data frame with columns par and dim.
#'
#' @export
#' @examples
#' new_term_rcrd()
#' new_term_rcrd(data.frame(par = c("x", "x", "y"), dim = I(list(1, 2, c(2,2))),
#' stringsAsFactors = FALSE))
#' @export
new_term_rcrd <- function(x = data.frame(par = character(), dim = I(list()), stringsAsFactors = FALSE)) {
  chk_data(x)
  check_names(x, c("par", "dim"))
  x$dim <- as_list(x$dim)
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

#' @export
vctrs::vec_cast

#' @export
vec_cast.term.default <- function(x, to, ...) {
  vec_default_cast(x, to)
}

#' @export
vec_cast.term.term <- function(x, to, ...) x

#' @export
vec_cast.term.character <- function(x, to, ...) new_term(x)

#' @export
vec_cast.term.term_rcrd <- function(x, to, ...) {
  if (!length(x)) {
    return(new_term())
  }
  chr <- paste0(
    field(x, "par"),
    "[",
    vapply(field(x, "dim"), paste, character(1), collapse = ","),
    "]"
  )
  chr[is.na(field(x, "par"))] <- NA_character_
  chr <- new_term(chr)
  normalize_terms(chr)
}

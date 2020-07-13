#' @method vec_cast.character term
#' @export
vec_cast.character.term <- function(x, to, ...) unclass(x)

#' @method vec_cast.character term_rcrd
#' @export
vec_cast.character.term_rcrd <- function(x, to, ...) unclass(as_term(x))

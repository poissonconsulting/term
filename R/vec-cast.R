#' @method vec_cast term
#' @export
#' @export vec_cast.term
vec_cast.term <- function(x, to, ...) UseMethod("vec_cast.term")

#' @method vec_cast.term default
#' @export
vec_cast.term.default <- function(x, to, ...) {
  vec_default_cast(x, to)
}

#' @method vec_cast.term term
#' @export
vec_cast.term.term <- function(x, to, ...) x

#' @method vec_cast.term character
#' @export
vec_cast.term.character <- function(x, to, ...) new_term(x)

#' @method vec_cast.character term
#' @export
vec_cast.character.term <- function(x, to, ...) unclass(x)

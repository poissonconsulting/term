#' @method vec_cast.character term
#' @export
vec_cast.character.term <- function(x, to, ...) unclass(x)

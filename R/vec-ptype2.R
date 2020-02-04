#' @inherit vctrs::vec_ptype2 title description params
#' @seealso [vctrs::vec_ptype2()]
#' @method vec_ptype2 term
#' @export
#' @export vec_ptype2.term
vec_ptype2.term <- function(x, y, ...) UseMethod("vec_ptype2.term", y)

#' @method vec_ptype2.term default
#' @export
vec_ptype2.term.default <- function(x, y, ..., x_arg = "x", y_arg = "y") {
  vec_default_ptype2(x, y, x_arg = x_arg, y_arg = y_arg)
}

#' @method vec_ptype2.term character
#' @export
vec_ptype2.term.character <- function(x, y, ...) character()

#' @method vec_ptype2.character term
#' @export
vec_ptype2.character.term <- function(x, y, ...) character()

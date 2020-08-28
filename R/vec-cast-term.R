#' @export
vctrs::vec_cast

#' @inherit vctrs::vec_cast title description params
#' @seealso [vctrs::vec_cast()]
#' @method vec_cast term
#' @export
#' @export vec_cast.term
#' @examples
#' vec_cast(new_term(c("a[1]", "a[2]")), character())
#' vec_cast(c("a[1]", "a[2]"), new_term())
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

#' @method vec_cast.term term_rcrd
#' @export
vec_cast.term.term_rcrd <- function(x, to, ...) {
  if(!length(x)) return(new_term())
  chr <- paste0(
    field(x, "par"),
    "[",
    purrr::map_chr(field(x, "dim"), paste, collapse = ","),
    "]"
  )
  chr[is.na(field(x, "par"))] <- NA_character_
  chr <- new_term(chr)
  normalize_terms(chr)
}

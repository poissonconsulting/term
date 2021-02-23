#' Construct a New Term Object
#'
#' Use this function to quickly construct a [term] object
#' from a character vector, without checking the input.
#' Use [term()] to repair the input.
#'
#' @param x A character vector.
#' @seealso [new_term_rcrd()]
#' @export
#' @examples
#' new_term()
#' new_term(c("a", "b[1]", "b[2]"))
#'
#' # Terms are not checked for validity:
#' new_term("r[")
#' repair_terms(new_term("r["))
new_term <- function(x = character()) {
  new_vctr(x, class = "term")
}

#' Missing Term
#'
#' A missing term element.
#'
#' @seealso [term-vector()]
#' @export
#'
#' @examples
#' is_term(NA_term_)
#' is.na(NA_term_)
NA_term_ <- new_term(NA_character_)

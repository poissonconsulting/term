#' Missing Term
#'
#' A missing term element.
#'
#' @seealso [term-vector()]
#' @export
#'
#' @examples
#' is.term(NA_term_)
#' is.na(NA_term_)
NA_term_ <- set_class(NA_character_, c("term", "character"))

#' Construct a New Term Record Object
#'
#' Use this function to quickly construct a term_rcrd object.
#'
#' @param x A data frame with columns par and dim.
#' @seealso [new_term()]
#' @export
#' @examples
#' new_term_rcrd()
#' \dontrun{
#' new_term_rcrd(data.frame(
#'   par = c("x", "x", "y"), dim = I(list(1, 2, c(2, 2))),
#'   stringsAsFactors = FALSE
#' ))
#' }
#' @export
new_term_rcrd <- function(x = data.frame(par = character(), dim = I(list()), stringsAsFactors = FALSE)) {
  chk_data(x)
  check_names(x, c("par", "dim"))
  x$dim <- as_list_unnamed_default(x$dim)
  vctrs::new_rcrd(fields = x[c("par", "dim")], class = "term_rcrd")
}


#' Missing Term
#'
#' A missing term element of `term_rcrd` type.
#'
#' @seealso [term-vector()]
#' @export
#'
#' @examples
#' is_term_rcrd(NA_term_)
#' is.na(NA_term_)
NA_term_rcrd_ <- new_term_rcrd()[NA_integer_]

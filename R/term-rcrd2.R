#' Term Record
#'
#' Creates a term_rcrd2 from values.
#' This function checks that all terms are valid
#' but does not require stronger levels of consistency,
#' see `chk_valid()` for details.
#'
#' @param ... Unnamed values are term values,
#'   named values describe the parameter in the name
#'   and the dimensionality in the value.
#'
#' @return A term_rcrd2 vector.
#' @aliases term_rcrd2-object term_rcrd2_object
#' @seealso [dims()] and [pdims()]
#' @export
#'
#' @examples
#' term_rcrd2()
#' term_rcrd2("p", "q[1]", "q[2]", "q[3]")
#' term_rcrd2("q[1]", "q[2]", "q[3]")
term_rcrd2 <- function(...) {
  as_term_rcrd2(term(...))
}

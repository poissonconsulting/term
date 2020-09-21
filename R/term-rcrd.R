#' Term Record
#'
#' Creates a term_rcrd from values.
#' This function checks that all terms are valid
#' but does not require stronger levels of consistency,
#' see `chk_valid()` for details.
#'
#' @param ... Unnamed values are term values,
#'   named values describe the parameter in the name
#'   and the dimensionality in the value.
#'
#' @return A term_rcrd vector.
#' @aliases term_rcrd-object term_rcrd_object
#' @seealso [dims()] and [pdims()]
#' @export
#'
#' @examples
#' term_rcrd()
#' \dontrun{
#' term_rcrd("p", "q[1]", "q[2]", "q[3]")
#' term_rcrd("q[1]", "q[2]", "q[3]")
#' }
term_rcrd <- function(...) {
  vec_cast(term(...), new_term_rcrd())
}

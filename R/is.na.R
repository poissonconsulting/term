#' @method is.na term_rcrd
#' @export
is.na.term_rcrd <- function(x) {
  is.na(field(x, "par"))
}

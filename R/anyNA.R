#' @export
anyNA.term_rcrd <- function(x, recursive = FALSE) {
  anyNA(field(x, "par"))
}

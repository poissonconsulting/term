#' @export
anyNA.term_rcrd <- function(x, recursive = FALSE) {
  anyNA(as.data.frame(x[c("dim", "par")], stringsAsFactors = FALSE))
}

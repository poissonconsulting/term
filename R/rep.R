#' @export
rep.term <- function(x, times, ...) {
  chk_unused(...)
  new_term(rep(as.character(x), times))
}

#' @export
rep.term_rcrd <- function(x, times, ...) {
  chk_unused(...)
  x <- data.frame(par = rep(field(x, "par"), times), dim = I(rep(field(x, "dim"), times)),
                  stringsAsFactors = FALSE)
  new_term_rcrd(x)
}

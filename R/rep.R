#' @export
rep.term <- function(x, times, ...) {
  new_term(rep(as.character(x), times))
}

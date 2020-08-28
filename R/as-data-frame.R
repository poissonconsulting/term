#' @method as.data.frame term_rcrd
#' @export
as.data.frame.term <- function(x, ..., stringsAsFactors = default.stringsAsFactors()) {
  as.data.frame(as_term_rcrd(x, ...,  stringsAsFactors = stringsAsFactors))
}

#' @method as.data.frame term_rcrd
#' @export
as.data.frame.term_rcrd <- function(x, ..., stringsAsFactors = default.stringsAsFactors()) {
  chk_flag(stringsAsFactors)
  chk_unused(...)
  data.frame(par = field(x, "par"), dim = I(field(x, "dim")), stringsAsFactors = stringsAsFactors)
}

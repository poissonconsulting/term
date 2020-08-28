#' @method as.data.frame term_rcrd
#' @export
as.data.frame.term_rcrd <- function(x, ..., stringsAsFactors = default.stringsAsFactors()) {
  chk_flag(stringsAsFactors)
  data.frame(par = field(x, "par"), dim = I(field(x, "dim")), stringsAsFactors = stringsAsFactors)
}

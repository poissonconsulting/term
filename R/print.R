#' @export
print.term_rcrd <- function(x, ...) {
  if (is.character(vec_data(x))) {
    return(NextMethod())
  }
  print(new_vctr(unclass(vec_cast(x, new_term())), class = "term_rcrd"))
}

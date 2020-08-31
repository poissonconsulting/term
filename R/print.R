#' @export
obj_print_data.term_rcrd <- function(x, ...) {
  obj_print_data(vec_cast(x, new_term()))
}

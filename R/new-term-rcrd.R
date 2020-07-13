#' Construct a new term_rcrd object
#'
#' Use this function to quickly construct a term_rcrd object.
#'
#' @param x A data frame with columns par and dim.
#'
#' @export
#' @examples
#' new_term_rcrd()
#' new_term_rcrd(data.frame(par = c("x", "x", "y"), dim = I(list(1, 2, c(2,2))),
#' stringsAsFactors = FALSE))
#' @export
new_term_rcrd <- function(x = data.frame(par = character(), dim = I(list()), stringsAsFactors = FALSE)) {
  chk_data(x)
  check_names(x, c("par", "dim"))
  x$dim <- as_list(x$dim)
  vctrs::new_data_frame(x, class = "term_rcrd")
}
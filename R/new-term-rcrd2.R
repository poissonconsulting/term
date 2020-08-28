
#' Construct a new term_rcrd2 object
#'
#' Use this function to quickly construct a term_rcrd2 object.
#'
#' @param x A data frame with columns par and dim.
#'
#' @export
#' @examples
#' new_term_rcrd2()
#' new_term_rcrd2(data.frame(par = c("x", "x", "y"), dim = I(list(1, 2, c(2,2))),
#' stringsAsFactors = FALSE))
#' @export
new_term_rcrd2 <- function(x = data.frame(par = character(), dim = I(list()), stringsAsFactors = FALSE)) {
  chk_data(x)
  check_names(x, c("par", "dim"))
  x$dim <- as_list(x$dim)
  vctrs::new_rcrd(fields = x[c("par", "dim")], class = "term_rcrd2")
}

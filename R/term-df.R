#' Term Data Frame
#'
#' Creates a \code{term-data-frame}.
#'
#' @param x An R object.
#' @inheritParams as.term
#' @return A term data frame.
#' @seealso \code{\link{term-data-frame}}
#' @export
#' 
#' @examples
#' term_df(matrix(1:4, 2))
term_df <- function(x, ...) UseMethod("term_df")

#' @describeIn term_df Term data frame for a numeric object.
#' @export
term_df.numeric <- function(x, name = "par", ...) {
  check_unused(...)
  tibble(term = as.term(x, name = name), n1 = as.vector(x))
}

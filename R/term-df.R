#' Term Data Frame
#'
#' Creates a term data frame from object.
#'
#' @param x An R object.
#' @inheritParams as.term
#' @return A term data frame.
#' @seealso \code{\link{term-vector}}
#' @export
#' 
#' @examples
#' term_df(matrix(1:4, 2))
term_df <- function(x, ...) UseMethod("term_df")

#' @describeIn term_df Term data frame for a numeric vector
#' @export
term_df.numeric <- function(x, name = "par", ...) {
  check_unused(...)
  term <- as.term(x, name = name)
  x <- as.vector(x)
  x <- data.frame(term = term, n1 = x, stringsAsFactors = FALSE)
  class(x) <- c("tbl_df", "tbl", "data.frame")
  x
}

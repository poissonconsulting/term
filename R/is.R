#' Is Term
#'
#' Tests whether an R object inherits from class \code{term}.
#'
#' It does not test the validity of consistency of the term elements.
#'
#' @param x The object to test.
#' @return A flag indicating whether the test was positive.
#' @seealso \code{\link{term-vector}}, \code{\link{valid_term}()}
#' and \code{\link{consistent_term}()}
#' @export
#'
#' @examples
#' is.term(c("parameter[2]", "parameter[10]"))
#' is.term(as.term(c("parameter[2]", "parameter[10]")))
is.term <- function(x) inherits(x, "term")

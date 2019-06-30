#' Is Term
#'
#' Test whether an R object inherits from class term.
#'
#' @param x The object to test.
#' @return A flag indicating whether the test was positive.
#' @export
#' @examples
#' is.term(as.term(c("parameter[2]", "parameter[10]")))
is.term <- function(x) inherits(x, "term")

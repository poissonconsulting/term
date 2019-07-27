#' Is Incomplete Terms
#'
#' Tests whether a term vector has absent elements.
#' 
#' The test is performed after the object's terms have been repaired.
#' By default if the term has any missing values then NA is return.
#'
#' @param x An object.
#' @param na.rm A flag specifying whether to ignore missing values.
#' @param ... Unused
#' @return A logical scalar indicating whether the object's terms are incomplete.
#' @seealso \code{\link{term-vector}()}, \code{\link{repair_terms}()} 
#' and \code{\link{complete_terms}()}
#' @export
#' 
#' @examples
#' is.incomplete_terms(as.term("b[2]"))
#' is.incomplete_terms(as.term(c("b[2]", "b[1]")))
#' is.incomplete_terms(as.term(c("b[2]", "b[1]", NA)))
is.incomplete_terms <- function(x, ...) UseMethod("is.incomplete_terms")

#' @describeIn is.incomplete_terms Test whether a term vector is incomplete
#' @export
is.incomplete_terms.term <- function(x, na.rm = FALSE, ...) {
  if(anyNA(x)) {
    if(isFALSE(na.rm)) return(NA)
    x <- x[!is.na(x)]
  }
  if(!length(x)) return(FALSE)
  x <- repair_terms(x)
  x <- unique(x)
  length(x) < sum(vapply(pdims(x), prod, 1))
}

#' Number of Terms
#'
#' Gets the number of unique valid term elements of an object.
#' 
#' By default if the vector includes missing values then it returns NA_integer_.
#'
#' @param x The object.
#' @param na.rm A flag specifying whether to remove missing values.
#' @param ... Unused.
#' @return A count of the number of terms.
#' @seealso \code{\link{term-vector}}, \code{\link{repair_terms}()} 
#' and \code{\link{valid_term}()} 
#' @export
#' 
#' @examples
#' nterms(3:4)
#' nterms(matrix(1:9, 3))
#' nterms(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
nterms <- function(x, ...) {
  UseMethod("nterms")
}

#' @describeIn nterms Number of terms of default object
#' @export
nterms.default <- function(x, na.rm = FALSE, ...) {
  check_flag(na.rm)
  check_unused(...)
  x <- as.term(x)
  if(anyNA(x)) {
    if(isFALSE(na.rm)) return(NA_integer_)
    x <- x[!is.na(x)]
  }
  length(unique(repair_terms(x)))
}

#' Number of Terms
#'
#' Gets the number of unique valid term elements of an object.
#' 
#' By default if the vector includes invalid term elements of 
#' missing values then it returns NA_integer_.
#' 
#' If \code{na.rm = TRUE} then any invalid term elements and missing values
#' are removed before the number of terms is counted.
#' 
#' If you are certain all the terms are unique and valid then just use
#' \code{length(x)}.
#'
#' @param x The object.
#' @param na.rm A flag specifying whether to remove missing values.
#' @param ... Unused.
#' @return A count of the number of terms.
#' @seealso \code{\link{term-vector}} and \code{\link{valid_term}()} 
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
nterms.default <- function(x, ...) {
  length(unique(as.term(x)))
}

#' @describeIn nterms Number of terms of character vector
#' @export
nterms.character <- function(x, na.rm = FALSE, ...) {
  check_unused(...)
  nterms(as.term(x), na.rm = na.rm)
}

#' @describeIn nterms Number of elements of term vector
#' @export
nterms.term <- function(x, na.rm = FALSE, ...) {
  check_flag(na.rm)
  check_unused(...)
  
  x <- repair_terms(x)
  
  if(anyNA(x)) {
    if(isFALSE(na.rm)) return(NA_integer_)
    x <- x[!is.na(x)]
  }
  length(unique(x))
}

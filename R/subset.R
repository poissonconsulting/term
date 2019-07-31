#' Subset Term Vector
#' 
#' Subsets a term vector.
#' 
#' The term vector is repaired prior to subsetting.
#' 
#' @param x A term vector to be subsetted.
#' @param select A character vector of the names of the parameters to include in the subsetted object.
#' @param na.rm A flag specifying whether to remove missing or invalid terms.
#' @param ... Unused.
#' @return The modified term vector.
#' @seealso \code{\link{term-vector}} and \code{\link{repair_terms}()}
#' @export
#' 
#' @examples 
#' term <- as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#' "beta[1,2]", "beta[2,2]", "sigma"))
#' subset(term, "beta")
#' subset(term, c("alpha", "sigma"))
subset.term <- function(x, select = NULL, na.rm = FALSE, ...) {
  chk_flag(na.rm)
  chk_unused(...)
  
  if(isTRUE(na.rm)) x <- x[!is.na(x)]
  if(is.null(select)) return(x)
  x <- repair_terms(x)
  if(isTRUE(na.rm)) x <- x[!is.na(x)]
  
  chk_is(select, "character")
  if(!all(select %in% .pars(x))) err("unrecognized parameters in select")
  
  if(!length(select)) return(term(0L))
  
  x[is.na(x) | .pars(x, terms = TRUE) %in% select]
}

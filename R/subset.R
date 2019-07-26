#' Subset term vector
#' 
#' @param x A term vector to be subsetted.
#' @param select A character vector of the parameters to include in the subsetted object.
#' @param ... Unused.
#' @return The modified term vector.
#' @export
#' 
#' @examples 
#' term <- as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#' "beta[1,2]", "beta[2,2]", "sigma"))
#' subset(term, "beta")
#' subset(term, c("alpha", "sigma"))
subset.term <- function(x, select = NULL, ...) {
  if(is.null(select)) return(x)
  check_vector(select, pars(x), unique = TRUE, only = TRUE)
  check_unused(...)
  
  if(!length(select)) return(x[-1])
  
  x <- x[pars(x, terms = TRUE) %in% select]
  x[order(as.integer(factor(pars(x, terms = TRUE), levels = select)))]
}

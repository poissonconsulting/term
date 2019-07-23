#' Subset term vector
#' 
#' @param x A term vector to be subsetted.
#' @param pars A character vector of the parameters to include in the subsetted vector.
#' @param ... Unused.
#' @return The modified term vector.
#'
#' @export
#' @examples 
#' term <- as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#' "beta[1,2]", "beta[2,2]", "sigma"))
#' subset(term, "beta")
#' subset(term, c("alpha", "sigma"))
subset.term <- function(x, pars = NULL, ...) {
  checkor(check_null(pars), check_vector(pars, pars(x), unique = TRUE, only = TRUE))
  check_unused(...)

  if(!is.null(pars)) {
    pars <- paste0("(^", pars, ("($|\\[))"))
    pars <- paste0(pars, collapse = ")|(")
    pars <- paste0("(", pars, ")", collapse = "")
    x <- x[grepl(pars, x)]
  }
  x
}

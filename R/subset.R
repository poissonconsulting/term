#' Subset Term Vector
#'
#' Subsets a term vector.
#'
#' @param x A term vector to be subsetted.
#' @param select A character vector of the names of the parameters to include in the subsetted object.
#' @param ... Unused.
#' @return The modified term vector.
#' @seealso [term-vector()]
#' @export
#'
#' @examples
#' term <- as.term(c(
#'   "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#'   "beta[1,2]", "beta[2,2]", "sigma"
#' ))
#' subset(term, "beta")
#' subset(term, c("alpha", "sigma"))
subset.term <- function(x, select = NULL, ...) {
  chk_not_any_na(x)
  chk_unused(...)

  if (is.null(select)) {
    return(x)
  }

  chk_s3_class(select, "character")
  chk_subset(select, pars(x))

  if (!length(select)) {
    return(term(0L))
  }

  x[pars(x, terms = TRUE) %in% select]
}

#' Check Term
#'
#' Checks if term using `[vld_term](x)`.
#'
#' @inheritParams chk::chk_flag
#' @inheritParams vld_term
#' @return `NULL`, invisibly. Called for the side effect of throwing an error
#'   if the condition is not met.
#' @export
#' @examples
#' x <- as.term(c("x[2]", "x[1]"))
#' chk_term(x)
#' x <- c("x[2]", "x[1]")
#' try(chk_term(x, validate = "sorted"))
chk_term <- function(x, validate = "class", x_name = NULL) {
  if (vld_term(x, validate = validate)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick(substitute(x))

  if (!is.term(x)) abort_chk(x_name, " must be a term vector")
  x <- x[!is.na(x)]
  if (!all(valid_term(x))) {
    abort_chk("All elements of term vector ", x_name, " must be valid")
  }
  if (is.inconsistent_terms(x)) abort_chk("All elements of term vector ", x_name, " must be consistent")
  abort_chk("All elements of term vector ", x_name, " must be complete")
}

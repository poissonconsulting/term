#' Validate Term
#'
#' Validates the elements of a term vector.
#'
#' Missing values are ignored as are duplicates and order.
#'
#' @inheritParams params
#' @inheritParams chk::chk_flag
#' @return A flag indicating whether the condition was met.
#' @seealso [chk_term()]
#' @export
#' @examples
#' vld_term(c("x[2]", "x[1]"))
#' vld_term(as.term(c("x[2]", "x[1]")))
vld_term <- function(x, validate = "complete") {
  chk_string(validate)
  if(validate == "class") {
    deprecate_soft("0.1.0.9000", "vld_term(validate =)",
   details = "More specifically the 'class' value of the `validate` argument has been deprecated for `vld_s3_class(class = 'term')` and the default value of validate has been replaced by 'complete'")
  }
  chk_subset(validate, c("class", "valid", "consistent", "complete"))
  
  if (!is_term(x)) {
    return(FALSE)
  }
  x <- x[!is.na(x)]
  if (!length(x)) {
    return(TRUE)
  }
  if (validate == "class") {
    return(TRUE)
  }
  if (!all(valid_term(x))) {
    return(FALSE)
  }
  if (validate == "valid") {
    return(TRUE)
  }
  if (is_inconsistent_terms(x)) {
    return(FALSE)
  }
  if (validate == "consistent") {
    return(TRUE)
  }
  !is_incomplete_terms(x)
}

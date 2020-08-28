#' Validate Term or Term Record
#'
#' Validates the elements of a term or term_rcrd vector.
#' Use [chk_s3_class()] to check if an object is a term or term_rcrd.
#'
#' Internal validity of a term can be checked on three levels:
#'
#' - `"valid"` checks that all terms are of the form
#'   `x`, `x[#]`, `x[#,#]` etc. where `x` is an identifier
#'   and `#` are positive integers.
#' - `"consistent"` checks that all terms are addressed
#'   with the same dimensionality; the terms `x[1]` and `x[2,3]`
#'   are inconsistent.
#' - `"complete"` checks that the values span all possible values
#'   across all dimensions; if `x[3,4]` exist, the vector must
#'   contain at least 11 more terms to be consistent
#'   (`x[1,1]` to `x[1,4]`, `x[2,1]` to `x[2,4]` and
#'   `x[3,1]` to `x[3,3]`).
#'
#' Missing values are ignored as are duplicates and order.
#'
#' @inheritParams params
#' @inheritParams chk::chk_flag
#' @return A flag indicating whether the condition was met.
#' @seealso [chk_term()]
#' @export
#' @examples
#' # vld_term
#' vld_term(c("x[2]", "x[1]"))
#' vld_term(term("x[2]", "x[1]"))
vld_term <- function(x, validate = "complete") {
  chk_string(validate)
  if(validate == "class") {
    deprecate_soft("0.2.0", "term::vld_term(validate =)",
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

#' @describeIn vld_term Validate Term Record
#' @export
#' @examples
#'
#' # vld_term_rcrd
#' vld_term_rcrd(c("x[2]", "x[1]"))
#' vld_term_rcrd(term_rcrd("x[2]", "x[1]"))
vld_term_rcrd <- function(x, validate = "complete") {
  chk_string(validate)
  chk_subset(validate, c("valid", "consistent", "complete"))

  if (!is_term_rcrd(x)) {
    return(FALSE)
  }
  x <- x[!is.na(x)]
  if (!length(x)) {
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

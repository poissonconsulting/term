#' Valid Terms
#'
#' Test whether each element in a term vector is valid.
#'
#' Repairing a term vector replaces invalid terms with a missing value.
#'
#' @inheritParams params
#' @return A logical vector indicating whether each term is valid.
#' @seealso [term-vector()] and [repair_terms()]
#' @export
#'
#' @examples
#' # valid term elements
#' valid_term(term("a", "a [3]", " b [ 1  ] ", "c[1,300,10]"))
#' # invalid term elements
#' valid_term(new_term(c("a b", "a[1]b", "a[0]", "b[1,]", "c[]", "d[1][2]")))
valid_term <- function(x) {
  chk_s3_class(x, "term")
  valid_term_impl(x)
}

valid_term_impl <- function(x) {
  if (!length(x)) {
    return(logical(0))
  }
  pattern <- p0(
    "^\\s*", .par_name_pattern, "\\s*(\\[\\s*",
    .index_pattern, "(\\s*,\\s*", .index_pattern,
    ")*\\s*\\]){0,1}\\s*$"
  )
  valid <- grepl(pattern, x)
  is.na(valid[is.na(x)]) <- TRUE
  valid
}

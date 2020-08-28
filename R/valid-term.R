#' Valid Terms
#'
#' Test whether each element in a term or term_rcrd object is valid.
#'
#' Repairing a term vector replaces invalid terms with missing values.
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
  chkor(chk_s3_class(x, "term"), chk_s3_class(x, "term_rcrd"))
  valid_term_impl(as_term(x))
}

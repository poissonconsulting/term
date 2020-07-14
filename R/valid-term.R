#' Valid Terms
#'
#' Test whether each element in a term or term_rcrd object is valid.
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
  chkor(chk_s3_class(x, "term"), chk_s3_class(x, "term_rcrd"))
  if(is_term(x)) return (valid_term_impl(x))
  valid <- grepl(pattern , x)

  pattern <- p0("^\\s*", .par_name_pattern, "\\s*$")
  valid_par <- grepl(pattern, x$par)
  valid_par[is.na(x$par)] <- NA
  valid_dim <-vapply(x$dim, is_index, TRUE)
    valid_par[vapply(x$par, anyNA, TRUE)] <- NA
  valid_par & valid_dim
}

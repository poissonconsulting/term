#' Is Term
#'
#' Tests whether an R object inherits from S3 class `term`.
#'
#' It does not test the validity of consistency of the term elements.
#'
#' @inheritParams params
#' @return A flag indicating whether the test was positive.
#' @seealso [term-vector()], [vld_term()], [valid_term()]
#' and [consistent_term()]
#' @export
#'
#' @examples
#' is_term(c("parameter[2]", "parameter[10]"))
#' is_term(term("parameter[2]", "parameter[10]"))
is_term <- function(x) {
  vld_s3_class(x, "term")
}

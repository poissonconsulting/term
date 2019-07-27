#' Valid Terms
#'
#' Test whether each element in a term vector is valid.
#'
#' @param x A term vector.
#' @return A logical vector indicating whether each term is valid.
#' @seealso \code{\link{term-vector}}
#' @export
#' 
#' @examples
#' # valid term elements
#' valid_term(c("a", "a [3]", " b [ 1  ] ", "c[1,300,10]"))
#' # invalid term elements
#' valid_term(c("a b", "a[1]b", "a[0]", "b[1,]", "c[]", "d[1][2]"))
valid_term <- function(x) {
  if(!length(x)) return(TRUE)
  valid <- grepl("^\\s*\\w+\\s*(\\[\\s*[123456789][0123456789]*(\\s*,\\s*[123456789][0123456789]*)*\\s*\\]){0,1}\\s*$", x)
  is.na(valid[is.na(x)]) <- TRUE
  valid
}

#' Repair Terms
#'
#' Repairs a terms vector.
#' 
#' Invalid elements are replaced by missing values and spaces removed.
#' 
#' If a parameter such as \code{b} 
#' is a scalar then \code{b[1]} is replaced by \code{b}
#' but if higher indices are included such as \code{b[2]} then \code{b}
#' is replaced by \code{b[1]}.
#'
#' @param x A term vector.
#' @return The repaired term vector.
#' @seealso \code{\link{term-vector}} and \code{\link{valid_term}}
#' @export
#' 
#' @examples
#' repair_terms(as.term(c("b[3]", "b")))
#' repair_terms(as.term(c("a[3]", "b[1]")))
#' repair_terms(as.term(c("a [3]", " b [ 1  ] ")))
#' repair_terms(as.term(c("a", NA)))
repair_terms <- function(x) {
  chk_inherits(x, "term")
  if(!length(x)) return(x)
  is.na(x[is.na(x) | !valid_term(x)]) <- TRUE
  x <- as.character(x)
  x <- gsub("\\s+", "", x)

  x <- sub("\\[1\\]$", "", x)
  non_scalar <- unique(sub("\\[.*$", "", x[grepl("\\[", x)]))
  non_scalar <- x %in% non_scalar
  x[non_scalar] <- p0(x[non_scalar], "[1]")
  as.term(x)
}

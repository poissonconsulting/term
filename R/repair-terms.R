#' Repair Terms
#'
#' Repairs a terms vector. I
#' 
#' Invalid elements are replaced by missing values and spaces removed.
#' 
#' By default (\code{scalars = TRUE}) if a parameter such as \code{b} 
#' is a scalar then \code{b[1]} is replaced by \code{b}
#' but if higher indices are included such as \code{b[2]} then \code{b}
#' is replaced by \code{b[1]}.
#'
#' @param x A term vector.
#' @param scalars A flag specifying whether to repair scalars (see details).
#' @return The repaired term vector.
#' @seealso \code{\link{term-vector}} and \code{\link{valid_term}}
#' @export
#' 
#' @examples
#' repair_terms(as.term(c("b[3]", "b")))
#' repair_terms(as.term(c("a[3]", "b[1]")))
#' repair_terms(as.term(c("a [3]", " b [ 1  ] ")))
#' repair_terms(as.term(c("a", NA)))
repair_terms <- function(x, scalars = TRUE) {
  check_flag(scalars)
  if(!length(x)) return(x)
  is.na(x[!valid_term(x)]) <- TRUE
  x <- as.character(x)
  x <- gsub("\\s+", "", x)
  
  if(isFALSE(scalars)) return(as.term(x))
  
  x <- sub("\\[1\\]$", "", x)
  non_scalar <- unique(sub("\\[.*$", "", x[grepl("\\[", x)]))
  non_scalar <- x %in% non_scalar
  x[non_scalar] <- paste0(x[non_scalar], "[1]")
  as.term(x)
}

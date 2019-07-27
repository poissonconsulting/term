#' Repair Terms
#'
#' Repairs values in an terms vector.
#' 
#' Initially removes spaces.
#' Empty strings (\code{""}) are dropped.
#' If a parameter such as \code{b} is a scalar then \code{b[1]} is replaced by \code{b}
#' but if higher indices are included such as \code{b[2]} then \code{b}
#' is replaced by \code{b[1]}.
#'
#' @param x A term vector.
#' @return The repaired term vector.
#' @export
#' 
#' @examples
#' complete_terms(term("b[1]"))
#' complete_terms(term("b[3]"), as.term(c("b[3]", "b[1]", "b[2]")))
#' complete_terms(term(c("z[2,2]", "z[1,1]")))
repair_terms <- function(x) {
  check_vector(x, term("a"))
  x <- unname(x)
  if(!length(x)) return(x)
  x <- as.character(x)
  x <- gsub("\\s+", "", x)
  x <- x[grepl("^\\w+(\\[[123456789]+(,[123456789]+)*\\]){0,1}$", x)]
  x <- sub("\\[1\\]$", "", x)
  non_scalar <- unique(sub("\\[.*$", "", x[grepl("\\[", x)]))
  non_scalar <- x %in% non_scalar
  x[non_scalar] <- paste0(x[non_scalar], "[1]")
  x <- as.term(x)
}

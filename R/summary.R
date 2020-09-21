#' @export
summary.term <- function(object, ...) {
  summary(as.character(object), ...)
}

# FIXME: summary.term_rcrd()?

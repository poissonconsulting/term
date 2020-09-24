# FIXME: functions to import from extras
as_list_unnamed_default <- function(x, ...) {
  x <- as.list(x)
  names <- names(x)
  attributes(x) <- NULL
  if(!is.null(names))
    names(x) <- names
  x
}

par_pattern <- function() {
  "[[:alpha:]][[:alnum:]._]*"
}


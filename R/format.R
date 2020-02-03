#' @export
format.term <- function(x, ...) {
  tick_if_spaces(unclass(x))
}

tick_if_spaces <- function(x) {
  bad <- grep("^$| ", x)
  x[bad] <- paste0("`", x[bad], "`")
  x
}

#' @export
print.term <- function(x, ...) {
  print(unclass(x))
  invisible(x)
}

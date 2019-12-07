#' @export
print.term <- function(x, ...) {
  if (!length(x)) {
    cat("term(0)")
  } else {
    print(unclass(x))
  }
  invisible(x)
}

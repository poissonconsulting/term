#' @export
levels.term <- function(x) {
  # Allows rbind(), #40
  # FIXME: Remove method after https://github.com/r-lib/vctrs/issues/1186
  NULL
}

#' @export
levels.term_rcrd <- function(x) {
  # Allows rbind(), #40
  # FIXME: Remove method after https://github.com/r-lib/vctrs/issues/1186
  NULL
}

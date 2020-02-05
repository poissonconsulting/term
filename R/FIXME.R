# FIXME horrible hack to partially deal with
# https://github.com/poissonconsulting/term/issues/40

#' @export
levels.term <- function(x) unique(as.character(x))

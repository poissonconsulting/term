#' @export
subset.term <- function(x, pars = NULL, ...) {
  checkor(check_null(pars), check_vector(pars, pars(x), unique = TRUE, only = TRUE))
  check_unused(...)

  if(!is.null(pars)) {
    pars <- paste0("(^", pars, ("($|\\[))"))
    pars <- paste0(pars, collapse = ")|(")
    pars <- paste0("(", pars, ")", collapse = "")
    x <- x[grepl(pars, x)]
  }
  x
}

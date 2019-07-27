#' Parameter Names
#'
#' Gets or sets the parameter names for an object.
#'
#' @param x An R object.
#' @param scalar_only A flag specifying whether to only get the names of
#' parameters with one term.
#' @param terms A flag specifying whether to return the parameter name
#' for each term element.
#' @param ... Unused.
#' @param value A character vector of the new parameter names.
#' @param pars A character vector of the new parameter names.
#' @return A character vector of the parameter names.
#' @export
#' 
#' @examples
#' term <- as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#' "beta[1,2]", "beta[2,2]", "sigma"))
#' pars(term)
#' pars(term, scalar_only = TRUE)
#' pars(term, terms = TRUE)
pars <- function(x, ...) UseMethod("pars")

#' @rdname pars
#' @export
`pars<-` <- function(x, value) UseMethod("pars<-", x)

#' @rdname pars
#' @export
set_pars <- function(x, pars) {
  pars(x) <- pars
  x
}

#' @describeIn pars Parameter names for a default object
#' @export
pars.default <- function(x, scalar_only = FALSE, terms = FALSE, ...) {
  check_unused(...)
  pars(as.term(x), scalar_only = scalar_only, terms = terms)
}

#' @describeIn pars Parameter names for a term vector
#' @export
pars.term <- function(x, scalar_only = FALSE, terms = FALSE, ...) {
  check_flag(scalar_only)
  check_flag(terms)
  check_unused(...)

  x <- as.character(x)
  if(scalar_only) x <- x[!grepl("\\[", x)]
  x <- sub("^(\\w+)(.*)", "\\1", x)
  if(!terms) x <- unique(x)
  x
}

#' @export
`pars<-.term` <- function(x, value) {
  check_vector(value, "", length = npars(x), unique = TRUE)

  pars <- pars(x)
  terms <- x

  for(i in seq_along(value)) {
    which <- which(grepl(pars[i], terms, fixed = TRUE))
    x[which] <- sub(pars[i], value[i], x[which], fixed = TRUE)
  }
  x
}

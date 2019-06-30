#' Parameter Names
#'
#' Gets or sets the parameter names for an object.
#'
#' @param x An R object.
#' @param scalar_only A flag indicating whether to only get the names of
#' parameters with one term.
#' @param terms A flag indicating whether to return the parameter name
#' for each term.
#' @param ... Not used.
#' @param value A character vector of the new parameter names.
#' @param parameters A character vector of the new parameter names.
#' @return A character vector of the parameter names.
#' @export
parameters <- function(x, ...) UseMethod("parameters")

#' @rdname parameters
#' @export
`parameters<-` <- function(x, value) UseMethod("parameters<-", x)

#' @rdname parameters
#' @export
set_parameters <- function(x, parameters) {
  parameters(x) <- parameters
  x
}

#' @export
parameters.default <- function(x, scalar_only = FALSE, terms = FALSE, ...) {
  check_unused(...)
  parameters(as.term(x, scalar_only = scalar_only, terms = terms))
}

#' @describeIn parameters Parameter names for a term vector
#' @export
parameters.term <- function(x, scalar_only = FALSE, terms = FALSE, ...) {
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
`parameters<-.character` <- function(x, value) {
  x <- as.term(x)
  parameters(x) <- value
  as.character(x)
}

#' @export
`parameters<-.term` <- function(x, value) {
  check_vector(value, "", length = npars(x), unique = TRUE)

  parameters <- parameters(x)
  terms <- x

  for(i in seq_along(value)) {
    which <- which(grepl(parameters[i], terms, fixed = TRUE))
    x[which] <- sub(parameters[i], value[i], x[which], fixed = TRUE)
  }
  x
}

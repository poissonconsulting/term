#' Parameter Names
#'
#' Gets or sets the parameter names for an object.
#' 
#' By default term elements are repaired prior to getting the parameter names.
#' Term elements are always repaired prior to setting.
#' 
#' @param x An R object.
#' @param scalar_only A flag specifying whether to only get the names of
#' parameters with one term.
#' @param terms A flag specifying whether to return the parameter name
#' for each term element.
#' @param repair A flag specifying whether to repair term elements.
#' @param ... Unused.
#' @param value A character vector of the new parameter names.
#' @param pars A character vector of the new parameter names.
#' @return A character vector of the parameter names.
#' @seealso \code{\link{repair_terms}()}
#' @export
#' 
#' @examples
#' term <- as.term(c("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#' "beta[1,2]", "beta[2,2]", "sigma", NA))
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
  .pars(as.term(x), scalar_only = scalar_only, terms = terms)
}

#' @describeIn pars Parameter names for a character vector
#' @export
pars.character <- function(x, scalar_only = FALSE, terms = FALSE, repair = TRUE, ...) {
  check_unused(...)
  pars(as.term(x), scalar_only = scalar_only, terms = terms, repair = repair)
}

#' @describeIn pars Parameter names for a term vector
#' @export
pars.term <- function(x, scalar_only = FALSE, terms = FALSE, repair = TRUE, ...) {
  check_flag(scalar_only)
  check_flag(terms)
  check_flag(repair)
  check_unused(...)
  
  if(isTRUE(repair)) x <- repair_terms(x)
  .pars(x, scalar_only = scalar_only, terms = terms)
}

#' @export
`pars<-.term` <- function(x, value) {
  check_vector(value, "", length = c(1L, 1L, length(x)))
  if(!all(grepl(paste0("^", .par_name_pattern ,"$"), value)))
    err("invalid parameter name")

  x <- repair_terms(x, scalars = FALSE)

  x <- sub(paste0("^", .par_name_pattern), "", x)
  is.na <- is.na(x)
  x <- paste(value, x, sep = "")
  is.na(x[is.na]) <- TRUE
  as.term(x)
}

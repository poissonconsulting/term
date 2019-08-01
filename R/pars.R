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

# internal use only
pars.character <- function(x, scalar_only = FALSE, terms = FALSE, ...) {
  pars(as.term(x), scalar_only = scalar_only, terms = terms)
}

#' @describeIn pars Parameter names for a term vector
#' @export
pars.term <- function(x, scalar_only = FALSE, terms = FALSE, ...) {
  chk_flag(scalar_only)
  chk_flag(terms)
  chk_unused(...)
  
  x <- as.character(x)
  if(scalar_only) x <- x[!grepl("\\[", x)]
  x <- sub(p0("^(", .par_name_pattern, ")(.*)"), "\\1", x)
  if(!terms) x <- unique(x)
  x
}

#' @export
`pars<-.term` <- function(x, value) {
  chk_is(value, "character")
  chk_length(value, length = c(1L, 1L, length(x)))
  
  if(!all(grepl(p0("^", .par_name_pattern ,"$"), value)))
    err("invalid parameter name")

  x <- sub(p0("^", .par_name_pattern), "", x)
  is.na <- is.na(x)
  x <- p(value, x, sep = "")
  is.na(x[is.na]) <- TRUE
  as.term(x)
}

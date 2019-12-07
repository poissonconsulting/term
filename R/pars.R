#' Parameter Names
#'
#' Gets or sets the parameter names for an object.
#'
#' @param x An R object.
#' @param scalar A logical scalar specifying whether to get the names of
#' all parameters (NA), only scalars (TRUE) or all parameters
#' except scalars (FALSE).
#' @param terms A flag specifying whether to return the parameter name
#' for each term element.
#' @param ... Unused.
#' @param value A character vector of the new parameter names.
#' @param pars A character vector of the new parameter names.
#' @return A character vector of the parameter names.
#' @export
#'
#' @examples
#' term <- as.term(c(
#'   "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
#'   "beta[1,2]", "beta[2,2]", "sigma", NA
#' ))
#' pars(term)
#' pars(term, scalar = TRUE)
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
pars.character <- function(x, scalar = NA, terms = FALSE, ...) {
  pars(as.term(x), scalar = scalar, terms = terms)
}

#' @describeIn pars Parameter names for a term vector
#' @export
pars.term <- function(x, scalar = NA, terms = FALSE, ...) {
  chk_lgl(scalar)
  chk_flag(terms)
  chk_unused(...)

  x <- as.character(x)
  if (!is.na(scalar)) {
    bol <- grepl("\\[", x)
    x <- x[if (scalar) !bol else bol]
  }
  x <- sub(p0("^(", .par_name_pattern, ")(.*)"), "\\1", x)
  if (!terms) x <- unique(x)
  x
}

#' @export
`pars<-.term` <- function(x, value) {
  chk_not_any_na(x)
  chk_s3_class(value, "character")
  chk_not_any_na(value)
  chk_unique(value)

  if (any(!valid_term(x))) err("`x` must not include invalid terms.")

  if (!identical(npars(x), length(value))) {
    err("`value` must be length ", npars(x), ", not ", length(value), ".")
  }

  if (!length(x)) {
    return(x)
  }

  if (!vld_match(value, p0("^", .par_name_pattern, "$"))) {
    err(ngettext(
      length(value), "`value` must be a valid parameter name.",
      "`value` must be valid parameter names."
    ))
  }
  pars <- pars(x)
  term_pars <- pars(x, term = TRUE)
  term_value <- NA_character_
  for (i in seq_along(pars)) {
    term_value[term_pars == pars[i]] <- value[i]
  }

  x <- sub(p0("^", .par_name_pattern), "", x)
  x <- p(term_value, x, sep = "")
  as.term(x)
}

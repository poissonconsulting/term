#' @export
universals::set_pars

#' Set Parameter Names
#'
#' @inherit universals::set_pars
#'
#' @export
#' @examples
#' term <- as_term(c("b[2]", "a[1]", "b[3,3]"))
#' set_pars(term, c("x", "y"))
set_pars.term <- function(x, value, ...) {
  chk_not_any_na(x)
  chk_term(x, validate = "valid")
  chk_pars(value)
  chk_not_any_na(value)
  chk_unique(value)
  chk_unused(...)

  if (!identical(npars(x), length(value))) {
    abort_chk(
      "`value` must be length ",
      npars(x),
      ", not %n.",
      n = length(value)
    )
  }

  if (!length(x)) {
    return(x)
  }
  pars <- pars(x)
  term_pars <- pars_terms(x)
  term_value <- NA_character_
  for (i in seq_along(pars)) {
    term_value[term_pars == pars[i]] <- value[i]
  }

  x <- sub(p0("^", par_pattern()), "", x)
  x <- p(term_value, x, sep = "")
  new_term(x)
}

#' Set Parameter Names
#'
#' @inherit universals::set_pars
#'
#' @export
#' @examples
#' term_rcrd <- term_rcrd("b[2]", "a[1]", "b[3,3]")
#' set_pars(term_rcrd, c("x", "y"))
set_pars.term_rcrd <- function(x, value, ...) {
  chk_not_any_na(x)
  chk_term_rcrd(x, validate = "valid")
  chk_pars(value)
  chk_not_any_na(value)
  chk_unique(value)
  chk_unused(...)

  pars <- pars(x)
  if (!identical(length(pars), length(value))) {
    abort_chk(
      "`value` must be length ",
      length(pars),
      ", not %n.",
      n = length(value)
    )
  }

  if (!length(x)) {
    return(x)
  }
  par <- field(x, "par")
  new_par <- par
  for (i in seq_along(pars)) {
    new_par[par == pars[i]] <- value[i]
  }
  field(x, "par") <- new_par
  x
}

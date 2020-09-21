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
    abort_chk("`value` must be length ", npars(x), ", not %n.", n = length(value))
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

# FIXME: set_pars.term_rcrd()

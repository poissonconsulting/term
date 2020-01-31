#' @export
universals::set_pars

#' Set Parameter Names
#'
#' @inherit universals::set_pars
#'
#' @export
set_pars.term <- function(x, value, ...) {
  chk_not_any_na(x)
  chk_term(x, validate = "valid")
  chk_s3_class(value, "character")
  chk_not_any_na(value)
  chk_unique(value)
  chk_unused(...)

  if (!identical(npars(x), length(value))) {
    err("`value` must be length ", npars(x), ", not ", length(value), ".")
  }

  if (!length(x)) {
    return(x)
  }

  if (!vld_match(value, p0("^", .par_name_pattern, "$"))) {
    abort_chk("Parameter name%s in `value` must be valid.", n = length(value))
  }
  pars <- pars(x)
  term_pars <- pars_terms(x)
  term_value <- NA_character_
  for (i in seq_along(pars)) {
    term_value[term_pars == pars[i]] <- value[i]
  }

  x <- sub(p0("^", .par_name_pattern), "", x)
  x <- p(term_value, x, sep = "")
  as.term(x)
}

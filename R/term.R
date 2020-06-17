#' Term Vector
#'
#' Creates a term vector from values.
#' A `term` vector is an S3 vector of parameter terms
#' of the form `p`, `q[#]` or `r[#,#]` where `#` are
#' positive integers.
#' This function checks that all terms are valid
#' but does not require stronger levels of consistency,
#' see `chk_valid()` for details.
#'
#' @param ... Unnamed values are term values,
#'   named values describe the parameter in the name
#'   and the dimensionality in the value.
#'
#' @return A term vector.
#' @aliases term-object term_object term-vector term_vector
#' @seealso [dims()] and [pdims()]
#' @export
#'
#' @examples
#' term()
#' term("p", "q[1]", "q[2]", "q[3]")
#' term("q[1]", "q[2]", "q[3]")
#' combined <- term(par = 2:4, "alpha")
#' pdims(combined)
#' term(!!!pdims(combined))
#'
#' # Invalid terms are rejected:
#' try(term("r["))
#'
#' # Valid terms are repaired
#' term("r  [ 1  ,2  ]")
term <- function(...) {
  args <- list2(...)
  compat_args <- exec(term_compat_args, !!!args)
  if (is.numeric(compat_args$x) && all(compat_args$x != 0)) {
    lifecycle::deprecate_soft(
      "0.2.0", "term::term(x =)",
      details = "Use named arguments to pass integer dimensions."
    )
    term <- term_impl(list2(!!compat_args$name := compat_args$x))
  } else if (is.list(compat_args$x)) {
    lifecycle::deprecate_soft(
      "0.2.0", "term::term(x =)",
      details = "Use named arguments directly, or splice a list as in `term(!!!x)`."
    )
    term <- term_impl(compat_args$x)
  } else {
    term <- term_impl(args)
  }

  repair_terms_impl(term)
}

term_impl <- function(args) {
  numbers <- vapply(args, is.numeric, logical(1))
  strings <- vapply(args, is.character, logical(1))
  nas <- vapply(args, anyNA, logical(1))
  chk_true(all(numbers | strings | nas))

  string_args <- lapply(unname(args[strings]), as_term)
  string_args_term <- new_term(unlist_chr(string_args))
  chk_term(string_args_term, "valid")

  number_args <- args[numbers]
  chk_all(number_args, chk_whole_numeric)
  chk_all(number_args, chk_gte)

  args[numbers] <- mapply(
    term_from_pdims,
    number_args, names2(number_args),
    SIMPLIFY = FALSE
  )

  expanded_args <- unlist_chr(unname(args))
  new_term(expanded_args)
}

term_compat_args <- function(`_x` = x, name = "par", ..., x = NULL) {
  list(x = if (is.null(x)) `_x` else NULL, name = name)
}

term_from_pdims <- function(x, name) {
  if (is_empty(x)) {
    # FIXME: Return new_term(name) instead?
    return(new_term())
  }
  if (any(x == 0)) {
    return(new_term())
  }

  chk_false(name == "")

  if (length(x) == 1 && x == 1) {
    return(new_term(name))
  }

  x <- lapply(x, seq_len)
  x <- do.call("expand.grid", x)
  x <- as.matrix(x)
  x <- apply(x, 1L, function(x) p(x, collapse = ","))
  x <- p0(name, "[", x, "]")
  new_term(x)
}

unlist_chr <- function(x) {
  vec_c(!!!x, .ptype = character())
}

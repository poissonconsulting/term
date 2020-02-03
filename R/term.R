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
#' @param ... Term values.
#' @inheritParams params
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
#' combimed <- term(par = 2:4, "alpha")
#' pdims(combined)
#' term(!!!pdims(combined))
#' try(term("r["))
term <- function(...) {
  args <- list2(...)
  compat_args <- exec(term_compat_args, !!!args)
  if (is.numeric(compat_args$x)) {
    lifecycle::deprecate_soft(
      "0.2.0", "term::term(x =)",
      details = "Use named arguments to pass integer dimensions."
    )
    return(term_impl(list2(!!compat_args$name := compat_args$x)))
  } else if (is.list(compat_args$x)) {
    lifecycle::deprecate_soft(
      "0.2.0", "term::term(x =)",
      details = "Use named arguments directly, or splice a list as in `term(!!!x)`."
    )
    return(term_impl(compat_args$x))
  }

  term_impl(args)
}

term_impl <- function(args) {
  named <- (names2(args) != "")
  unnamed_args <- unname(args[!named])
  chk_all(unnamed_args, chk_string)
  chk_term(new_term(unlist_chr(unnamed_args)), "valid")

  named_args <- args[named]
  chk_all(named_args, chk_whole_numeric)
  chk_all(named_args, chk_gte)

  args[named] <- mapply(
    term_from_pdims,
    named_args, names(named_args),
    SIMPLIFY = FALSE
  )

  new_term(unlist_chr(unname(args)))
}

term_compat_args <- function(`_x` = x, name = "par", ..., x = NULL) {
  list(x = `_x`, name = name)
}

term_from_pdims <- function(x, name) {
  if (is_empty(x)) {
    # FIXME: Return new_term(name) instead?
    return(new_term())
  }
  if (any(x == 0)) {
    return(new_term())
  }
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

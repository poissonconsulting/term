#' Deprecated Functions
#'
#' @inheritParams params
#' @keywords internal
#' @usage NULL
# nocov start
deprecated <- function(...) NULL
# nocov end

#' @describeIn deprecated Is Term
#'
#' `r lifecycle::badge("defunct")`
#'
#' Replace by [is_term()]
#' @export
is.term <- function(x) {
  deprecate_stop("0.1.0", what = "term::is.term()", with = "term::is_term()")
}

#' @describeIn deprecated Is Incomplete Terms
#'
#' `r lifecycle::badge("defunct")`
#'
#' Replace by [is_incomplete_terms()]
#' @export
is.incomplete_terms <- function(x) {
  deprecate_stop(
    "0.1.0",
    what = "term::is.incomplete_terms()",
    with = "term::is_incomplete_terms()"
  )
}

#' @describeIn deprecated Is Inconsistent Terms
#'
#' `r lifecycle::badge("defunct")`
#'
#' Replace by [is_inconsistent_terms()]
#' @export
is.inconsistent_terms <- function(x) {
  deprecate_stop(
    "0.1.0",
    what = "term::is.inconsistent_terms()",
    with = "term::is_inconsistent_terms()"
  )
}

#' @describeIn deprecated Get Parameters
#'
#' `r lifecycle::badge("defunct")`
#'
#' Replace by [pars()]
#' @export
parameters <- function(x, ...) {
  deprecate_stop("0.1.0", what = "parameters()", with = "pars()")
}


#' @describeIn deprecated Setting Parameters
#'
#' `r lifecycle::badge("defunct")`
#'
#' Replace by pars<-
#' @export
`parameters<-` <- function(x, value) {
  deprecate_stop("0.1.0", what = "`parameters<-`()", with = "`pars<-`()")
}

#' @describeIn deprecated Set Parameters
#'
#' `r lifecycle::badge("defunct")`
#'
#' Replace by [set_pars()]
#' @export
set_parameters <- function(x, pars) {
  deprecate_stop(
    "0.1.0",
    what = "term::set_parameters()",
    with = "term::set_pars()"
  )
}

#' @describeIn deprecated Term Index
#'
#' `r lifecycle::badge("defunct")`
#'
#' Replace by [tindex()]
#' @export
tdims <- function(x) {
  deprecate_stop("0.1.0", what = "term::tdims()", with = "term::tindex()")
}

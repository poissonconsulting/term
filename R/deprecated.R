#' Deprecated Functions
#'
#' Deprecated `term()` functions
#'
#' @inheritParams params
#' @keywords internal
#' @name term_deprecated
NULL

#' @describeIn term_deprecated Is Term
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [is_term()]
#' @export
is.term <- function(x) {
  deprecate_soft("0.0.1",
    what = "is.term()",
    with = "is_term()"
  )  
  is_term(x)
}

#' @describeIn term_deprecated Is Incomplete Terms
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [is_incomplete_terms()]
#' @export
is.incomplete_terms <- function(x) {
  deprecate_soft("0.0.1",
    what = "is.incomplete_terms()",
    with = "is_incomplete_terms()"
  )  
  is_incomplete_terms(x)
}

#' @describeIn term_deprecated Get Parameters
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [pars()]
#' @export
parameters <- function(x, ...) {
  deprecate_soft("0.0.1",
    what = "parameters()",
    with = "pars()"
  )
  pars(x, ...)
}


#' @describeIn term_deprecated Setting Parameters
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by pars<-
#' @export
`parameters<-` <- function(x, value) {
  deprecate_soft("0.0.1",
    what = "parameters<-",
    with = "pars<-"
  )
  pars(x) <- value
  x
}


#' @describeIn term_deprecated Setting Parameters
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by pars<-
#' @export
`pararameters<-` <- function(x, value) {
  deprecate_soft("0.0.1",
    what = "pararameters<-",
    with = "pars<-"
  )
  pars(x) <- value
  x
}


#' @describeIn term_deprecated Set Parameters
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [set_pars()]
#' @export
set_parameters <- function(x, pars) {
  deprecate_soft("0.0.1",
    what = "set_parameters()",
    with = "set_pars()"
  )
  set_pars(x, pars)
}

#' @describeIn term_deprecated Term Index
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [tindex()]
#' @export
tdims <- function(x) {
  deprecate_soft("0.0.1",
    what = "tdims()",
    with = "tindex()"
  )
  tindex(x)
}

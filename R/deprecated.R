#' Deprecated Functions
#'
#' @inheritParams params
#' @keywords internal
#' @name deprecated
NULL

#' @describeIn deprecated Is Term
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [is_term()]
#' @export
is.term <- function(x) {
  deprecate_soft("0.0.1.9000",
    what = "is.term()",
    with = "is_term()"
  )  
  is_term(x)
}

#' @describeIn deprecated Is Incomplete Terms
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [is_incomplete_terms()]
#' @export
is.incomplete_terms <- function(x) {
  deprecate_soft("0.0.1.9000",
    what = "is.incomplete_terms()",
    with = "is_incomplete_terms()"
  )  
  is_incomplete_terms(x)
}

#' @describeIn deprecated Is Inconsistent Terms
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [is_inconsistent_terms()]
#' @export
is.inconsistent_terms <- function(x) {
  deprecate_soft("0.0.1.9000",
    what = "is.inconsistent_terms()",
    with = "is_inconsistent_terms()"
  )  
  is_inconsistent_terms(x)
}

#' @describeIn deprecated Get Parameters
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [pars()]
#' @export
parameters <- function(x, ...) {
  deprecate_soft("0.0.1.9000",
    what = "parameters()",
    with = "pars()"
  )
  pars(x, ...)
}


#' @describeIn deprecated Setting Parameters
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by pars<-
#' @export
`parameters<-` <- function(x, value) {
  deprecate_soft("0.0.1.9000",
    what = "parameters<-",
    with = "pars<-"
  )
  pars(x) <- value
  x
}

#' @describeIn deprecated Set Parameters
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [set_pars()]
#' @export
set_parameters <- function(x, pars) {
  deprecate_soft("0.0.1.9000",
    what = "set_parameters()",
    with = "set_pars()"
  )
  set_pars(x, pars)
}

#' @describeIn deprecated Term Index
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [tindex()]
#' @export
tdims <- function(x) {
  deprecate_soft("0.0.1.9000",
    what = "tdims()",
    with = "tindex()"
  )
  tindex(x)
}

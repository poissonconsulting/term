#' Deprecated Functions
#'
#' Deprecated `term()` functions
#'
#' @inheritParams params
#' @keywords internal
#' @name term_deprecated
NULL


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
  UseMethod("pars")
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
  UseMethod("pars<-", x)
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
  UseMethod("pars<-", x)
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

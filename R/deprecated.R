#' @rdname tindex
#' @details `tdims()` is deprecated.
#' @export
tdims <- function(x) {
  deprecate_soft("0.0.1", what = "tdims()", with = "tindex()")
  tindex(x)
}

#' @rdname pars
#' @details `parameters()` is deprecated.
#' @export
parameters <- function(x, ...) {
  deprecate_soft("0.0.1", what = "parameters()", with = "pars()")
  UseMethod("pars")
}

#' @rdname pars
#' @details `parameters<-` is deprecated.
#' @export
`pararameters<-` <- function(x, value) {
  deprecate_soft("0.0.1", what = "pararameters()", with = "pars()")
  UseMethod("pars<-", x)
}

#' @rdname pars
#' @details `set_parameters()` is deprecated.
#' @export
set_parameters <- function(x, pars) {
  deprecate_soft("0.0.1", what = "set_parameters()", with = "set_pars()")
  set_pars(x, pars)
}

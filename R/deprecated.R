#' @rdname tindex
#' @details `tdims()` is deprecated.
#' @export
tdims <- function(x) {
  .Deprecated("tindex")
  tindex(x)
}

#' @rdname pars
#' @details `parameters()` is deprecated.
#' @export
parameters <- function(x, ...) {
  .Deprecated("pars")
  UseMethod("pars")
}

#' @rdname pars
#' @details `parameters<-` is deprecated.
#' @export
`pararameters<-` <- function(x, value) {
  .Deprecated("pars<-")
  UseMethod("pars<-", x)
}

#' @rdname pars
#' @details `set_parameters()` is deprecated.
#' @export
set_parameters <- function(x, pars) {
  .Deprecated("set_pars")
  set_pars(x, pars)
}

#' @rdname tindex
#' @export
tdims <- function(x) {
  .Deprecated("tindex")
  tindex(x)
}

#' @rdname npars
#' @export
npdims <- function(x) {
  .Deprecated("npdims")
  npars(x)
}

#' @rdname pars
#' @export
parameters <- function(x, ...) {
  .Deprecated("pars")
  UseMethod("pars")
}

#' @rdname pars
#' @export
`parameters<-` <- function(x, value) {
  .Deprecated("pars")
  UseMethod("pars<-", x)
}

#' @rdname pars
#' @param parameters A character vector of the new parameter names.
#' @export
set_parameters <- function(x, parameters) {
  .Deprecated("set_pars")
  pars(x) <- parameters
  x
}

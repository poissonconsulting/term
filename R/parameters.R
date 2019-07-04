#' @rdname pars
#' @export
parameters <- function(x, ...) {
  UseMethod("pars")
}

#' @rdname pars
#' @export
`parameters<-` <- function(x, value) {
  UseMethod("pars<-", x)
}

#' @rdname pars
#' @export
set_parameters <- function(x, pars) {
  set_pars(x, parameters)
}

#' @rdname tindex
#' @details \code{tdims()} is deprecated.
#' @export
tdims <- function(x) {
  .Deprecated("tindex")
  tindex(x)
}

#' @rdname pars
#' @details \code{parameters()} is deprecated.
#' @export
parameters <- function(x, ...) UseMethod("pars")

#' @rdname pars
#' @details \code{parameters<-} is deprecated.
#' @export
`pararameters<-` <- function(x, value) UseMethod("pars<-", x)

#' @rdname pars
#' @details \code{set_parameters()} is deprecated.
#' @export
set_parameters <- function(x, pars) set_pars(x, pars)

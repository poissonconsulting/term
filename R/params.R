#' Parameter Descriptions for term Package
#'
#' Default parameter descriptions which may be overridden in individual
#' functions.
#'
#' A flag is a non-missing logical scalar.
#'
#' A string is a non-missing character scalar.
#'
#' @inheritParams rlang::args_dots_empty
#' @param x The object.
#' @param name A string specifying the name of the parameter.
#' @param validate A string specifying the level of the validation.
#' The possible values in order of increasing strictness
#' are 'class', 'valid', 'consistent' and 'complete'.
#' @param repair A flag specifying whether to repair terms.
#' @param normalize A flag specifying whether to normalize terms.
#' @param select A character vector of the names of the parameters to include in the subsetted object.
#'
#' @param value A character vector of the new parameter names.
#' @param pars A character vector of parameter names.
#' @param scalar A flag specifying whether to by default return all parameters (NULL), or only scalar parameters (TRUE) or only non-scalar parameters (FALSE).
#' @param terms A flag specifying whether to return the parameter name
#' for each term element.
#' @param incomparables Ignored.
#'
#' @keywords internal
#' @usage NULL
# nocov start
params <- function(...) NULL
# nocov end


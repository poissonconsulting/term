#' Term Vector
#'
#' Creates a term vector from object dimensions.
#'
#' @param x An integer vector of the object dimensions
#' or a named list of the parameter's dimensions.
#' @param name A string specifying the name of the parameter.
#' @param ... Unused.
#' @return A term vector.
#' @seealso \code{\link{term-vector}}, \code{\link{dims}()} and 
#' \code{\link{pdims}()}
#' @export
#' 
#' @examples 
#' term(0L)
#' term(1L)
#' term(2L)
term <- function(x, ...) UseMethod("term")

#' @export
term.NULL <- function(x, name = "par", ...) {
  check_unused(...)
  term(0L, name = name)
}

#' @describeIn term Term vector from an integer vector of the object's dimensions
#' @export
term.integer <- function(x, name = "par", ...) {
  checkor(check_count(x), 
          check_vector(x, c(1L, chk_max_int())))
  check_string(name)
  check_unused(...)
 
  if(!length(x) || identical(x, 0L)) return(as.term(character(0)))
  if(identical(x, 1L)) return(as.term(name))
  if(identical(length(x), 1L)) 
    return(as.term(paste0(name, "[", 1:x, "]")))

  x <- lapply(x, function(x) 1:x)
  x <- do.call("expand.grid", x)
  x <- as.matrix(x)
  x <- apply(x, 1L, function(x) paste(x, collapse = ","))
  x <- paste0(name, "[", x, "]")
  as.term(x)
}

#' @export
term.numeric <- function(x, name = "par", ...) {
  check_unused(...)
  term(as.integer(x), name = name)
}

#' @export
term.list <- function(x, ...) {
  if(!length(x)) return(term(0L))
  check_named(x)
  x <- mapply(term, x, names(x))
  x <- unlist(x)
  x <- as.vector(x)
  as.term(x)
}

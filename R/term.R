#' Term Vector
#'
#' Creates a term vector from object dimensions.
#'
#' @param x An integer vector of the object dimensions or a named list of the parameter's dimensions.
#' @inheritParams params
#'
#' @return A term vector.
#' @seealso [term-vector()], [dims()] and
#' [pdims()]
#' @export
#'
#' @examples
#' term(0L)
#' term(1L)
#' term(2L)
term <- function(x, ...) UseMethod("term")

#' @export
term.NULL <- function(x, name = "par", ...) {
  chk_unused(...)
  term(0L, name = name)
}

#' @describeIn term Term vector from an integer vector of the object's dimensions
#' @export
term.integer <- function(x, name = "par", ...) {
  chk_string(name)
  chk_unused(...)

  if (!length(x)) {
    return(as.term(character(0)))
  }
  if (any(x == 0L)) {
    return(as.term(character(0)))
  }
  if (identical(x, 1L)) {
    return(as.term(name))
  }
  if (identical(length(x), 1L)) {
    return(as.term(p0(name, "[", 1:x, "]")))
  }

  x <- lapply(x, function(x) 1:x)
  x <- do.call("expand.grid", x)
  x <- as.matrix(x)
  x <- apply(x, 1L, function(x) p(x, collapse = ","))
  x <- p0(name, "[", x, "]")
  as.term(x)
}

#' @export
term.numeric <- function(x, name = "par", ...) {
  chk_unused(...)
  term(as.integer(x), name = name)
}

#' @export
term.list <- function(x, ...) {
  if (!length(x)) {
    return(term(0L))
  }
  chk_named(x)
  x <- mapply(term, x, names(x))
  x <- unlist(x)
  x <- as.vector(x)
  as.term(x)
}

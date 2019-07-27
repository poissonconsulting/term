#' Term Vectors
#'
#' Creates a term vector.
#'
#' @param dims An integer vector of the parameter dimensions.
#' @param name A string specifying the name of the parameter 
#' for vectors of positive length.
#' @return A term vector.
#' @seealso \code{\link{term-vector}} and \code{\link{dims}()}
#' @export
#' 
#' @examples 
#' term(0L)
#' term(1L)
#' term(2L)
term <- function(dims = 0L, name = "par") {
  dims <- as.integer(dims)
  checkor(check_count(dims), 
          check_vector(dims, c(1L, chk_max_int())))
  check_string(name)
  
  if(!length(dims) || identical(dims, 0L)) return(as.term(character(0)))
  if(identical(dims, 1L)) return(as.term(name))
  if(identical(length(dims), 1L)) 
    return(as.term(paste0(name, "[", 1:dims, "]")))

  dims <- lapply(dims, function(x) 1:x)
  dims <- do.call("expand.grid", dims)
  dims <- as.matrix(dims)
  dims <- apply(dims, 1L, function(x) paste(x, collapse = ","))
  dims <- paste0(name, "[", dims, "]")
  as.term(dims)
}

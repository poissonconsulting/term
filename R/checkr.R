
check_flag <- function(x, x_name = deparse(x)) {
  if(isTRUE(x) || isFALSE(x)) return(TRUE)
  x <- deparse(substitute(x))
  err(x, " must be TRUE or FALSE")
}

check_string <- function(x, x_name = deparse(x)) {
  if((identical(length(x), 1L) && !is.na(x) && is.character(x)))
    return(invisible(TRUE))
  x <- deparse(substitute(x))
  err(x, " must be a string (character vector of length 1)")
}

check_unused <- function (...) {
  if (length(list(...))) 
    err("... must be unused")
  invisible(TRUE)
}

check_named <- function (x) {
  if(!is.null(names(x))) return(invisible(TRUE))
  x <- deparse(substitute(x))
  err(x, " must be named")
}

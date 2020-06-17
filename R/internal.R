max_index <- function(x) {
  x <- tindex(x)
  x <- matrix(unlist(x), ncol = length(x[[1]]), byrow = TRUE)
  apply(x, 2, max)
}

scalar_term <- function(x) {
  if (!length(x)) {
    return(logical(0))
  }
  scalar <- !grepl("\\[", x)
  is.na(scalar[is.na(x)]) <- TRUE
  scalar
}

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

tindex_impl <- function(x) {
  names <- x
  x <- sub(p0("^", .par_name_pattern), "", x)
  x <- sub("^$", "1", x)
  x <- gsub("\\[|\\]", "", x)
  x <- strsplit(x, ",")
  x <- lapply(x, as.integer)
  x[is.na(x)] <- 1L
  x[is.na(names)] <- NA_integer_
  names(x) <- names
  x
}

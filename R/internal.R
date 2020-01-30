greater_than_term <- function(e1, e2) {
  e1_parm <- pars(e1)
  e2_parm <- pars(e2)
  if (e1_parm != e2_parm) {
    return(e1_parm > e2_parm)
  }

  e1 <- tindex(e1)[[1]]
  e2 <- tindex(e2)[[1]]

  if (length(e1) != length(e2)) {
    return(length(e1) > length(e2))
  }

  equal <- e1 == e2

  if (all(equal)) {
    return(FALSE)
  }

  which <- which(!equal)
  which <- which[length(which)]

  e1[which] > e2[which]
}

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

set_class <- function(x, class) {
  class(x) <- class
  x
}

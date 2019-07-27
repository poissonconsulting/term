greater_than_term <- function(e1, e2) {
  e1 <- as.term(e1)
  e2 <- as.term(e2)
  e1_parm <- pars(e1)
  e2_parm <- pars(e2)
  if (e1_parm != e2_parm) return(e1_parm > e2_parm)
  
  e1 <- tindex(e1)[[1]]
  e2 <- tindex(e2)[[1]]
  
  if (length(e1) != length(e2)) return(length(e1) > length(e2))
  
  equal <- e1 == e2
  
  if (all(equal)) return(FALSE)
  
  which <- which(!equal)
  which <- which[length(which)]
  
  e1[which] > e2[which]
}

term_dims <- function(x, name) {
  x <- dims(x)
  if(all(x == 0L)) return(as.term(character(0)))
  if(identical(x, 1L)) return(as.term(name))
  if(identical(length(x), 1L)) 
    return(as.term(paste0(name, "[", seq_len(x), "]")))
  x <- lapply(x, seq_len)
  x <- expand.grid(x)
  x <- as.matrix(x)
  x <- apply(x, 1, function(x) paste(x, collapse = ","))
  paste0(name, "[", x, "]")
}

set_class <- function(x, class) {
  class(x) <- class
  x
}

pdim2term <- function(pdim, par) {
  if(!length(pdim)) return(term())
  if(identical(length(pdim), 1L)) {
    if(pdim == 1) return(as.term(par))
    return(as.term(paste0(par, "[", 1:pdim, "]")))
  }
  pdim <- lapply(pdim, function(x) 1:x)
  pdim <- do.call("expand.grid", pdim)
  pdim <- as.matrix(pdim)
  pdim <- apply(pdim, 1L, function(x) paste(x, collapse = ","))
  pdim <- paste0(par, "[", pdim, "]")
  as.term(pdim)
}

pdims2term <- function(pdims) {
  if(!length(pdims)) return(term())
  term <- mapply(pdim2term, pdims, names(pdims))
  term <- unlist(term)
  term <- as.vector(term)
  as.term(term)
}

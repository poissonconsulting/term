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

# assumes that pars do not require repairing
.pars <- function(x, scalar_only = FALSE, terms = FALSE) {
  x <- as.character(x)
  if(scalar_only) x <- x[!grepl("\\[", x)]
  x <- sub(paste0("^(\\s*)(", .par_name_pattern, ")(.*)"), "\\2", x)
  if(!terms) x <- unique(x)
  x
}

.pdims <- function(x) {
  x <- sort(x)
  names <- .pars(x)
  x <- split(x, .pars(x, terms = TRUE))
  x <- lapply(x, function(x) x[length(x)])
  x <- unlist(x)
  x <- sub(paste0("^", .par_name_pattern), "", as.character(x))
  x <- sub("^$", "1", x)
  x <- gsub("\\[|\\]", "", x)
  x <- strsplit(x, ",")
  x <- lapply(x, as.integer)
  names(x) <- names
  x
}

set_class <- function(x, class) {
  class(x) <- class
  x
}

err <- function (...) stop(..., call. = FALSE, domain = NA)

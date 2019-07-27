greater_than_term <- function(e1, e2) {
  e1_parm <- .pars(e1)
  e2_parm <- .pars(e2)
  if (e1_parm != e2_parm) return(e1_parm > e2_parm)
  
  e1 <- .tindex(e1)[[1]]
  e2 <- .tindex(e2)[[1]]
  
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
  x <- sub(paste0("^(", .par_name_pattern, ")(.*)"), "\\1", x)
  if(!terms) x <- unique(x)
  x
}

# assumes that pars do not require repairing
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

# assumes that pars do not require repairing
.tindex <- function(x) {
  names <- x
  x <- sub(paste0("^", .par_name_pattern), "", x)
  x <- sub("^(\\[)(.*)(\\])$", "\\2", x)
  x <- strsplit(x, "\\s*[,]\\s*")
  x[vapply(x, function(x) identical(x, character(0)), TRUE)] <- ""
  x <- lapply(x, function(x) gsub("\\s+", "", x))
  x <- lapply(x, as.integer)
  x[is.na(x)] <- 1L
  x[is.na(names)] <- NA_integer_
  names(x) <- names
  x
}

set_class <- function(x, class) {
  class(x) <- class
  x
}

err <- function (...) stop(..., call. = FALSE, domain = NA)

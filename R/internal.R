max_index <- function(x) {
  x <- tindex(x)
  x <- matrix(unlist(x), ncol = length(x[[1]]), byrow = TRUE)
  apply(x, 2, max)
}

scalar_term_impl <- function(x) {
  if (!length(x)) {
    return(logical(0))
  }
  scalar <- !grepl("\\[", x)
  is.na(scalar[is.na(x)]) <- TRUE
  scalar
}

tindex_impl <- function(x) {
  names <- x
  x <- sub(p0("^", par_pattern()), "", x)
  x <- sub("^$", "1", x)
  x <- gsub("\\[|\\]", "", x)
  x <- strsplit(x, ",")
  x <- lapply(x, as.integer)
  x[is.na(x)] <- 1L
  x[is.na(names)] <- NA_integer_
  names(x) <- names
  x
}

valid_term_impl <- function(x) {
  .index_pattern <- "[1-9][0-9]*"

  if (!length(x)) {
    return(logical(0))
  }
  pattern <- p0(
    "^\\s*", par_pattern(), "\\s*(\\[\\s*",
    .index_pattern, "(\\s*,\\s*", .index_pattern,
    ")*\\s*\\]){0,1}\\s*$"
  )
  valid <- grepl(pattern, x)
  is.na(valid[is.na(x)]) <- TRUE
  valid
}

pars_terms_impl <- function(x, scalar = NULL) {
  scalar_term <- scalar_term_impl(x)
  x <- as.character(x)
  x <- sub(p0("^(", par_pattern(), ")(.*)"), "\\1", x)
  if(vld_true(scalar)) x <- x[scalar_term]
  if(vld_false(scalar)) x <- x[!scalar_term]
  x
}

term_impl <- function(args) {
  numbers <- vapply(args, is.numeric, logical(1))
  strings <- vapply(args, is.character, logical(1))
  nas <- vapply(args, anyNA, logical(1))
  chk_true(all(numbers | strings | nas))

  string_args <- lapply(unname(args[strings]), as_term)
  string_args_term <- new_term(unlist_chr(string_args))
  chk_term(string_args_term, "valid")

  number_args <- args[numbers]
  chk_all(number_args, chk_whole_numeric)
  chk_all(number_args, chk_gte)

  args[numbers] <- mapply(
    term_from_pdims,
    number_args, names2(number_args),
    SIMPLIFY = FALSE
  )

  expanded_args <- unlist_chr(unname(args))
  new_term(expanded_args)
}

repair_terms_impl <- function(x) {
  if (!length(x)) {
    return(x)
  }
  is.na(x[is.na(x) | !valid_term_impl(x)]) <- TRUE
  x <- gsub("\\s+", "", x)
}

npdims_terms_impl <- function(x) {
  is_na <- vapply(field(x, "dim"), identical, TRUE, y = NA_integer_)
  y <- vapply(field(x, "dim"), length, 1L)
  names(y) <- field(x, "par")
  is.na(y[is_na]) <- TRUE
  y
}

normalize_terms_impl <- function(x) {
  x <- sub("\\[1\\]$", "", x)
  non_scalar <- unique(as.character(sub("\\[.*$", "", x[grepl("\\[", x)])))
  non_scalar <- x %in% non_scalar
  x[non_scalar] <- p0(x[non_scalar], "[1]")
  x
}

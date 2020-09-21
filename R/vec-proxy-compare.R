#' @export
vec_proxy_compare.term <- function(x, ...) {
  pars <- pars_terms(x)

  tindex <- tindex(x)
  ndims <- vapply(tindex, length, integer(1))

  # Compute a dataframe with one column per dimensions
  # using as many columns as needed
  #
  # How many columns do we need?
  max_ntindex <- max(c(0L, ndims))
  # Expand all index vectors to match this length,
  # fill with zeros, to create a data frame
  # with one column per value
  tindex_expanded <- lapply(tindex, expand_zeros, max_ntindex)
  # Reverse column order of resulting data frame
  # to obtain column-major ordering.
  # This is for consistency with R's way of storing arrays internally.
  # It means that a complete term is arranged in exactly the same way
  # as the cells in an array.
  indexes <- rev(transpose_df(as.data.frame(tindex_expanded)))

  # Return a data frame with the three items computed.
  # The lexical ordering in this data frame corresponds
  # to the order of our input vector
  data.frame(pars, ndims, indexes, stringsAsFactors = FALSE)
}

expand_zeros <- function(x, new_length) {
  length(x) <- new_length
  fill_na(x)
}

transpose_df <- function(x) {
  as.data.frame(t(as.matrix(x)))
}

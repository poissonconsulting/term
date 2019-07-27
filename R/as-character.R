#' @describeIn as.term Coerce term vector to character vector
#' @export
as.character.term <- function(x, ...) set_class(x, "character")

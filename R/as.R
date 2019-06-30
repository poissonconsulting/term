#' @describeIn as.term Coerces term vector to a character vector
#' @export
as.character.term <- function(x, ...) set_class(x, "character")

#' Check Term Vector
#' 
#' Check term vector.
#'
#' @inheritParams checkr::check_vector
#' @param nas A logical scalar specifying whether x can include missing values.
#' @param valid A logical scalar specifying whether x must not require repairing.
#' @param complete A logical scalar specifying whether x must be complete.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_term(as.term("a"))
check_term <- function (x, nas = TRUE, length = NA, unique = FALSE, sorted = FALSE, 
                        named = NA, valid = FALSE, complete = FALSE, 
                        attributes = named, names = TRUE, x_name = substitute(x),
                        error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  check_flag(nas)
  check_flag(valid)
  check_flag(complete)
  check_flag(error)
  check_vector(x, values = as.term("a"), length = length, unique = unique, 
               sorted = sorted, named = named, attributes = attributes, 
               names = names, class = FALSE, x_name = x_name, error = error)
  
  if(!nas && anyNA(x))
    chk_fail(x_name, " must not include missing values", error = error)
  if(valid && !identical(x, repair_terms(x)))
    chk_fail(x_name, " must not require repairing", error = error)
  if(complete && is.incomplete_terms(x))
    chk_fail(x_name, " must be complete", error = error)
  
  invisible(x)
}

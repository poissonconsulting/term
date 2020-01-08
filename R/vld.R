#' Validate Term
#'
#' Validates the elements of a term vector.
#'
#' @inheritParams chk::chk_flag
#' @param validate A string specifying the level of the validation. 
#' The possible values in order of increasing strictness 
#' are 'class', 'valid', 'consistent', 'complete', 'unique' and 'sorted'.
#' @param any_na A flag specifying whether to permit missing values.
#' @return A flag indicating whether the condition was met.
#' @export
#' @examples
#' vld_term(c("x[2]", "x[1]"))
#' vld_term(as.term(c("x[2]", "x[1]")))
#' vld_term(as.term(c("x[2]", "x[1]")), validate = "sorted")
vld_term <- function(x, validate = "class", any_na = FALSE) {
  chk_string(validate)
  chk_subset(validate, 
             c("class", "valid", "consistent", "complete", "unique", "sorted"))
  
  if(!is.term(x)) return(FALSE)
  if(anyNA(x)) {
    if(!any_na) return(FALSE)
    x <- x[!is.na(x)]
  }
  if(!length(x)) return(TRUE)
  if(validate == "class") return(TRUE)
  if(!all(valid_term(x))) return(FALSE)
  if(validate == "valid") return(TRUE)
  if(is.inconsistent_terms(x)) return(FALSE)
  if(validate == "consistent") return(TRUE)
  if(is.incomplete_terms(x)) return(FALSE)
  if(validate == "complete") return(TRUE)
  if(anyDuplicated(x)) return(FALSE)
  if(validate == "unique") return(TRUE)
  !is.unsorted(x)
}

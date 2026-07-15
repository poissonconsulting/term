# complete_terms term

    Code
      complete_terms(NA_term_)
    Condition
      Error:
      ! `x` must not have any missing values.

---

    Code
      complete_terms(new_term(c(NA_term_, "b[2]")))
    Condition
      Error:
      ! `x` must not have any missing values.

---

    Code
      complete_terms(new_term(c("b", "b[2,2]")))
    Condition
      Error in `complete_terms.term()`:
      ! `x` must have terms with consistent parameter dimensions.

# complete_terms term_rcrd

    Code
      complete_terms(term_rcrd(c(NA_term_, "b[2]")))
    Condition
      Error in `complete_terms.term_rcrd()`:
      ! `x` must not have any missing values.

---

    Code
      complete_terms(term_rcrd(c("b", "b[2,2]")))
    Condition
      Error in `complete_terms.term()`:
      ! `x` must have terms with consistent parameter dimensions.

